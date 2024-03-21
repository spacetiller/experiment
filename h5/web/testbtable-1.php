<?php
/**
 * �����ģ������
 */
 
//ǰ����������Ϊjson
header("Content-Type:application/json;charset=utf-8");
//post ���� ������������Ϊ application/x-www-form-urlencoded ����� application/json ����Ҫ���д��� $_POST ���鲻�ᱻ���
 
//Ϊ�˱���ģ�������
session_start();
 
if ($_SESSION['emulate_data']) {
 //������
} else {
 $list = [];
 //��һ�λ�ģ�������
 for($i = 1; $i < 50; $i ++) {
 $list[] = [
 "id" => $i,
 "name" => substr(str_shuffle(implode('', range('a', 'z'))), 0, 5),
 "age" => mt_rand(10, 30)
 ];
 }
 $_SESSION['emulate_data'] = $list;
}
 
$list_temp = [];
//����
if (isset($_POST['search']) && !empty($_POST['search'])) {
 foreach ($_SESSION['emulate_data'] as $key => $row) {
 if (strpos($row['name'], $_POST['search']) !== false 
 || strpos($row['age'], $_POST['search']) !== false) {
 $list_temp[] = $_SESSION['emulate_data'][$key];
 }
 }
} else {
 $list_temp = $_SESSION['emulate_data'];
}
//����
if (isset($_POST['sort'])) {
 $temp = [];
 foreach ($list_temp as $row) {
 $temp[] = $row[$_POST['sort']];
 }
 //php�Ķ�ά����
 array_multisort($temp,
 $_POST['sort'] == 'name' ? SORT_STRING : SORT_NUMERIC,
 $_POST['order'] == 'asc' ? SORT_ASC : SORT_DESC,
 $list_temp
 );
}
 
//��ҳʱ��Ҫ��ȡ��¼��������ֵΪ total
$result["total"] = count($list_temp);
//���ݴ��ݹ����ķ�ҳƫ�����ͷ�ҳ����ȡģ���ҳ rows ���Ը���ǰ�˵� dataField ������
$result["rows"] = array_slice($list_temp, $_POST['offset'], $_POST['limit']);
 
echo json_encode($result);
