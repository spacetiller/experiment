package com.ctfo.datastatic.hdfs;

import com.ctfo.datastatic.bean.VehicleBeanConverter;
import com.ctfo.datastatic.bean.VehicleFromFreightBean;
import com.ctfo.datastatic.bean.VehicleInternalBean;
import com.ctfo.datastatic.util.Constant;
import com.ctfo.datastatic.util.DBUtil;
import com.ctfo.datastatic.util.DateUtil;
import com.ctfo.datastatic.util.PropertyUtil;
import com.hadoop.compression.lzo.LzoCodec;
import com.hadoop.compression.lzo.LzopCodec;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.compress.CompressionOutputStream;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;

/**
 * Created by Administrator on 2015-03-02.
 */
public class HdfsSynService {

    private static Log log = LogFactory.getLog(HdfsSynService.class);

    private static Configuration conf;

    private static LzoCodec lzo;

    public void init() {
        try {
            conf = new Configuration();
            lzo = new LzopCodec();
            lzo.setConf(conf);
        } catch (Exception e) {
            log.error("HdfsSynService init fail");
            throw new RuntimeException("HdfsSynService init fail");

        }
    }

    /**
     * 同步
     */
    public void syn() {
        CompressionOutputStream fout = null;
        FSDataOutputStream outputStream = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        FileSystem fs = null;

        try {
            String destFileName = Constant.STATIC_FILE_PREFIX +
                    DateFormatUtils.format(Calendar.getInstance(), "yyyyMMddhhmm");
            Path staticDataPath = new Path(PropertyUtil.getStaticFilePath());
            Path destFile = new Path(staticDataPath, destFileName + ".tmp");
            fs = FileSystem.get(conf);
            log.info(destFile.toUri().getPath());
            outputStream = fs.create(destFile, true);
            fout = lzo.createOutputStream(outputStream);
            log.info("create write file: " + destFile.toUri().getPath());

            //
            conn = DBUtil.getConn();
            // 总记录数
            pstmt = conn.prepareStatement(PropertyUtil.getProperties("TOTAL_ALL_SQL"));
            rs = pstmt.executeQuery();
            rs.next();
            int totalCount = rs.getInt(1);
            DBUtil.close(rs, pstmt, null);

            // 分页获取数据，写到文件
            String queryAllSql = PropertyUtil.getProperties("QUERY_ALL_SQL");
            int pageSize = 5000;
            String lastId = "";
            String sql = queryAllSql +" order by vid asc limit " + pageSize;;
            for (int i = 0; i < totalCount; ) {
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                	//数据库中已经删除的车不写入HDFS
                	VehicleFromFreightBean vehicle = VehicleBeanConverter.convertMysqlResultFromFreightInterface(rs);
                    String record = VehicleBeanConverter.toHDFSString(vehicle);
                    record = record.replaceAll("\r|\n", "");
                    record = record + "\n";
                    
                    String isDeleted = rs.getString("isDeleted");
                	if(isDeleted!=null){
                		if(rs.getString("isDeleted").equals("true")){
                    		log.info("this vid: "+rs.getString("vid")+" has deleted,so this line data is not in HDFS file.");
//                    		continue;
                    	}else{
                    		fout.write(record.getBytes(), 0, record.getBytes().length);
                    	}
                	}else{
                		fout.write(record.getBytes(), 0, record.getBytes().length);
                	}
                    
                    i++;
                    lastId = vehicle.getVid();
                }
                sql = queryAllSql + " where vid>'" + lastId + "' order by vid asc limit " + pageSize;
                DBUtil.close(rs, pstmt, null);
                //TODO 提前刷新,不然一次堆太多不好.
                fout.flush();
                log.info("Flush and total record size:" + totalCount + ",has export record size:" + i + ",execute sql:" + sql);
            }

            // 关闭文件，并且修改文件后缀
            if (fout != null) {
                fout.flush();
                fout.close();
            }
            Path renameDestFile =  new Path(staticDataPath, destFileName + ".lzo");
            fs.rename(destFile,renameDestFile);
            log.info("rename write file: " + renameDestFile.toUri().getPath());
            if (fs != null) {
                fs.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, pstmt, conn);
        }
    }

}
