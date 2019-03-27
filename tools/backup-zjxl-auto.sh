#!/bin/bash
EXEC_PATH=$(dirname "$0")

#
#   Notice: the baked file is actually yesterday, so the date in the file should be -1 day
#
#

zhome=$HOME
cd $zhome/zhanghui/zjxl/data/backup

export LD_LIBRARY_PATH=:/usr/lib/oracle/11.2/client64/lib:/usr/local/lib::.:/home/h_zhanghui/usr/sqlplus/lib/oracle/11.2/client64/lib:/usr/lib:.

# A. prepare
date_hoy=`date +%Y%m%d`
date_ayer=`date -d "-1 day $date_hoy" +%Y%m%d`
year=`date -d $date_hoy +%Y`
month=`date -d $date_hoy +%m`
day=`date -d $date_hoy +%d`
ts_hoy=`date -d "$date_hoy" +%s`000

lzop_dir=`which lzop`
lzop_arr=(${lzop_dir//\/lzop/})
lzop_home=${lzop_arr[0]}
data_dir=$zhome/zhanghui/zjxl/data/tables
hd_data_dir=/bigdata/product/mapred/static/data
#hd_hy_dir=/user/h_zhanghui/data/hy
hd_hy_dir=$hd_data_dir/hy
hd_vims_dir=$hd_data_dir/vims
hd_crm_dir=$hd_data_dir/crm
hd_lh_dir=$hd_data_dir/lh

# 1 tb_truck
hdir_hy_tb_truck=$hd_hy_dir/truck
hy_tb_truck_trunk=hy-tb-truck-
hy_tb_truck_table=tb_truck
hy_tb_truck=$hy_tb_truck_trunk$year$month$day
# 2
#hdir_hy_tb_sim=$hd_hy_dir/sim
#hy_tb_sim_trunk=hy-tb-sim-
#hy_tb_sim_table=tb_sim
#hy_tb_sim=$hy_tb_sim_trunk$year$month$day
## 3
#hdir_hy_tb_terminal=$hd_hy_dir/terminal
#hy_tb_terminal_trunk=hy-tb-terminal-
#hy_tb_terminal_table=tb_terminal
#hy_tb_terminal=$hy_tb_terminal_trunk$year$month$day
## 4
#hdir_hy_tr_serviceunit=$hd_hy_dir/serviceunit
#hy_tr_serviceunit_trunk=hy-tr-serviceunit-
#hy_tr_serviceunit_table=tr_serviceunit
#hy_tr_serviceunit=$hy_tr_serviceunit_trunk$year$month$day
# 4
hdir_hy_tr_truck_first_position=$hd_hy_dir/first-position
hy_tr_truck_first_position_trunk=hy-tr-truck-first-position-
hy_tr_truck_first_position_table=tr_truck_first_position
hy_tr_truck_first_position=$hy_tr_truck_first_position_trunk$year$month$day
# 5
hdir_hy_tr_redis_lasttrack=$hd_hy_dir/redis-lasttrack
hy_tr_redis_lasttrack_trunk=hy-tr-redis-lasttrack-
hy_tr_redis_lasttrack_table=tr_redis_lasttrack
hy_tr_redis_lasttrack=$hy_tr_redis_lasttrack_trunk$year$month$day
# 6
hdir_hy_tb_organization_jk=$hd_hy_dir/organization-jk
hy_tb_organization_jk_trunk=hy-tb-organization-jk-
hy_tb_organization_jk_table=tb_organization_jk
hy_tb_organization_jk=$hy_tb_organization_jk_trunk$year$month$day
# 7
hdir_hy_sys_general_code=$hd_hy_dir/general-code
hy_sys_general_code_trunk=hy-sys-general-code-
hy_sys_general_code_table=sys_general_code
hy_sys_general_code=$hy_sys_general_code_trunk$year$month$day
# 8
hdir_hy_sys_product_type=$hd_hy_dir/product-type
hy_sys_product_type_trunk=hy-sys-product-type-
hy_sys_product_type_table=sys_product_type
hy_sys_product_type=$hy_sys_product_type_trunk$year$month$day
# 9
hdir_hy_tb_terminal_oem=$hd_hy_dir/terminal-oem
hy_tb_terminal_oem_trunk=hy-tb-terminal-oem-
hy_tb_terminal_oem_table=tb_terminal_oem
hy_tb_terminal_oem=$hy_tb_terminal_oem_trunk$year$month$day
# 10
hdir_hy_tb_terminal_model=$hd_hy_dir/terminal-model
hy_tb_terminal_model_trunk=hy-tb-terminal-model-
hy_tb_terminal_model_table=tb_terminal_model
hy_tb_terminal_model=$hy_tb_terminal_model_trunk$year$month$day
# 11
hdir_hy_tb_vehicle_attach=$hd_hy_dir/vehicle-attach
hy_tb_vehicle_attach_trunk=hy-tb-vehicle-attach-
hy_tb_vehicle_attach_table=tb_vehicle_attach
hy_tb_vehicle_attach=$hy_tb_vehicle_attach_trunk$year$month$day
# 12
hdir_hy_tb_operator_platform=$hd_hy_dir/operator-platform
hy_tb_operator_platform_trunk=hy-tb-operator-platform-
hy_tb_operator_platform_table=tb_operator_platform
hy_tb_operator_platform=$hy_tb_operator_platform_trunk$year$month$day

# 20
hdir_vims_tb_vehicle=$hd_vims_dir/vehicle
vims_tb_vehicle_trunk=vims-tb-vehicle-
vims_tb_vehicle_table=tb_vehicle
vims_tb_vehicle=$vims_tb_vehicle_trunk$year$month$day

# 30
hdir_crm_tb_customer=$hd_crm_dir/customer
crm_tb_customer_trunk=crm-tb-customer-
crm_tb_customer_table=tb_customer
crm_tb_customer=$crm_tb_customer_trunk$year$month$day

# 40
hdir_lh_tb_mobile_user=$hd_lh_dir/user
lh_tb_mobile_user_trunk=lh-tb-mobile-user-
lh_tb_mobile_user_table=tb_mobile_user
lh_tb_mobile_user=$lh_tb_mobile_user_trunk$year$month$day
# 41
hdir_lh_tt_mobile_user_truck=$hd_lh_dir/user-truck
lh_tt_mobile_user_truck_trunk=lh-tt-mobile-user-truck-
lh_tt_mobile_user_truck_table=tt_mobile_user_truck
lh_tt_mobile_user_truck=$lh_tt_mobile_user_truck_trunk$year$month$day

# -----hy-----20-----vims-----30-----crm-----40------lh------60---------- reserve ------------

# 2. backup
echo This program backup important data. 
echo Notice: the baked file is actually yesterday, so the date in the file should be -1 day
date +"%Y-%m-%d %H:%M:%S"

backup_table(){
    if [ $# -ne 5 ];then
        echo [`date +"%Y-%m-%d %H:%M:%S"`] $1 Parameter not correct. Continue.
        return 1
    fi
    num=$1
    hdir=$2
    file_trunk=$3
    db_table=$4
    fname_date=$5
	if [ $num -lt 20 ];then
		pt="hypt"
	elif [ $num -lt 30 ];then
		pt="vims"
	elif [ $num -lt 40 ];then
		pt="crm3"
	elif [ $num -lt 60 ];then
		pt="lanhai"
	fi
    # 0. backup table
    $HPHOME/bin/hadoop fs -test -f $hdir/$fname_date.lzo
    isfile=$?
    $HPHOME/bin/hadoop fs -test -z $hdir/$fname_date.lzo
    iszero=$?
    if [ $isfile -eq 0 ] && [ $iszero -ne 0 ];then
        echo [`date +"%Y-%m-%d %H:%M:%S"`] $num. $pt $db_table exist: $hdir/$fname_date.lzo, omit ----------
    else
        echo [`date +"%Y-%m-%d %H:%M:%S"`] $num. Backup $pt $db_table table --------------------------
        if [ -s $data_dir/$fname_date.txt ] ;then
            echo [`date +"%Y-%m-%d %H:%M:%S"`] Existed file found, use it. $data_dir/$fname_date.txt
            echo [`date +"%Y-%m-%d %H:%M:%S"`] Zip $data_dir/$fname_date.txt to LZO ...
            cat $data_dir/$fname_date.txt | $lzop_home/lzop > $fname_date.lzo
        else
            echo [`date +"%Y-%m-%d %H:%M:%S"`] Draw data from $db_table table ...
            python ./ex-db-2-dfile.py "select * from $pt.$db_table" $fname_date
            echo [`date +"%Y-%m-%d %H:%M:%S"`] Zip ./$fname_date.txt to LZO ...
            cat $fname_date.txt | $lzop_home/lzop > $fname_date.lzo
        fi
        $HPHOME/bin/hadoop fs -test -d $hdir
        if [[ $? -ne 0 ]];then
            echo [`date +"%Y-%m-%d %H:%M:%S"`] Dir $hdir not exist, mkdir ...
            $HPHOME/bin/hadoop fs -mkdir -p $hdir
        fi
        echo [`date +"%Y-%m-%d %H:%M:%S"`] Upload tb_vehicle data to $hdir ...
        $HPHOME/bin/hadoop fs -put -f $fname_date.lzo $hdir
        echo [`date +"%Y-%m-%d %H:%M:%S"`] Remove $fname_date.txt/lzo ...
        #rm $fname_date.txt
        if [ ! -f $data_dir/$fname_date.* ] ;then
            rm -rf $data_dir/$file_trunk$date_ayer.txt
            mv $fname_date.txt $data_dir/
        else
			echo [`date +"%Y-%m-%d %H:%M:%S"`] $data_dir/$fname_date.* exist.
		fi
        rm $fname_date.lzo
    fi
}

backup_table 1 "$hdir_hy_tb_truck" "$hy_tb_truck_trunk" "$hy_tb_truck_table" "$hy_tb_truck"
#backup_table 2 "$hdir_hy_tb_sim" "$hy_tb_sim_trunk" "$hy_tb_sim_table" "$hy_tb_sim"
#backup_table 3 "$hdir_hy_tb_terminal" "$hy_tb_terminal_trunk" "$hy_tb_terminal_table" "$hy_tb_terminal"
#backup_table 4 "$hdir_hy_tr_serviceunit" "$hy_tr_serviceunit_trunk" "$hy_tr_serviceunit_table" "$hy_tr_serviceunit"
backup_table 4 "$hdir_hy_tr_truck_first_position" "$hy_tr_truck_first_position_trunk" "$hy_tr_truck_first_position_table" "$hy_tr_truck_first_position"
backup_table 5 "$hdir_hy_tr_redis_lasttrack" "$hy_tr_redis_lasttrack_trunk" "$hy_tr_redis_lasttrack_table" "$hy_tr_redis_lasttrack"
backup_table 6 "$hdir_hy_tb_organization_jk" "$hy_tb_organization_jk_trunk" "$hy_tb_organization_jk_table" "$hy_tb_organization_jk"
backup_table 7 "$hdir_hy_sys_general_code" "$hy_sys_general_code_trunk" "$hy_sys_general_code_table" "$hy_sys_general_code"
backup_table 8 "$hdir_hy_sys_product_type" "$hy_sys_product_type_trunk" "$hy_sys_product_type_table" "$hy_sys_product_type"
backup_table 9 "$hdir_hy_tb_terminal_oem" "$hy_tb_terminal_oem_trunk" "$hy_tb_terminal_oem_table" "$hy_tb_terminal_oem"
backup_table 10 "$hdir_hy_tb_terminal_model" "$hy_tb_terminal_model_trunk" "$hy_tb_terminal_model_table" "$hy_tb_terminal_model"
backup_table 11 "$hdir_hy_tb_vehicle_attach" "$hy_tb_vehicle_attach_trunk" "$hy_tb_vehicle_attach_table" "$hy_tb_vehicle_attach"
backup_table 12 "$hdir_hy_tb_operator_platform" "$hy_tb_operator_platform_trunk" "$hy_tb_operator_platform_table" "$hy_tb_operator_platform"
backup_table 20 "$hdir_vims_tb_vehicle" "$vims_tb_vehicle_trunk" "$vims_tb_vehicle_table" "$vims_tb_vehicle"
backup_table 30 "$hdir_crm_tb_customer" "$crm_tb_customer_trunk" "$crm_tb_customer_table" "$crm_tb_customer"
backup_table 40 "$hdir_lh_tb_mobile_user" "$lh_tb_mobile_user_trunk" "$lh_tb_mobile_user_table" "$lh_tb_mobile_user"
backup_table 41 "$hdir_lh_tt_mobile_user_truck" "$lh_tt_mobile_user_truck_trunk" "$lh_tt_mobile_user_truck_table" "$lh_tt_mobile_user_truck"


# D. finish
cp ./logs/log-backup.log.tmp ./logs/log-backup-$date_hoy.log

