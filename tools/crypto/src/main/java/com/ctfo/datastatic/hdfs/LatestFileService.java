package com.ctfo.datastatic.hdfs;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by Administrator on 2015-03-02.
 */
public class LatestFileService {

    public static Log log = LogFactory.getLog(LatestFileService.class);

    public static String STATIC_DATA_PATH = "/bigdata/product/mapred/dic/vehicle";

    /**
     * 返回最新生成的hdfs 静态文件
     * @return
     */
    public static String getLatestFile(Configuration conf) {
        try {
            FileSystem fs = FileSystem.get(conf);
            FileStatus[] staticDataFileList = fs.listStatus(new Path(STATIC_DATA_PATH));

            List<String> staticDataFileNameList = new ArrayList<String>();
            for (FileStatus staticDataFileStatus : staticDataFileList) {

                // 过滤掉.tmp 使用中的文件
                if (!staticDataFileStatus.getPath().getName().endsWith(".tmp")) {
                    staticDataFileNameList.add(staticDataFileStatus.getPath().getName());
                }
            }

            if (staticDataFileNameList.size() == 0) return "";
            Collections.sort(staticDataFileNameList);

            return STATIC_DATA_PATH+"/"+staticDataFileNameList.get(staticDataFileNameList.size() - 1);
        } catch (Exception e) {
            log.error("getLatestFile error, ",e);
            return "";
        }
    }

    public static void main(String[] args) {
        System.getProperties().put("hadoop.home.dir", "F:\\ideaworkspace\\src3\\java_src");
        Configuration conf = new Configuration();
        String filename = getLatestFile(conf);
        System.out.println(filename);
    }
}
