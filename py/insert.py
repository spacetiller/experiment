#!/usr/bin/env python
# -*- encoding: utf-8 -*-

import mysql.connector
import time
import logging

from mysql.connector import errorcode
from pyspider.result import ResultWorker

logger = logging.getLogger("MyResultWorker")

class MyResultWorker(ResultWorker):
    def on_result(self, task, result):
        """override"""
        # assert task['taskid']
        # assert task['project']
        # assert task['url']
        # assert result
        # 插入结果，部分数据是硬编码的，方便测试
        if MySQLDB().insert(app_id=1, instance_name='test_name', url=task['url']):
            logger.info('result %s:%s %s -> %.30r' % (
                task['project'], task['taskid'], task['url'], result))

class MySQLDB:
    username = 'root'
    password = ''
    database = 'fusys_result'
    host = '127.0.0.1'
    port = 3306

    connection = None
    is_connect = True
    placeholder = '%s'

    def __init__(self):
        """init db"""
        if self.is_connect:
            self.connect()

    @staticmethod
    def escape(string):
        return '`%s`' % string

    def connect(self):
        connect_kvs = {
            'user': self.username,
            'password': self.password,
            'host': self.host,
            'port': self.port,
            'database': self.database
        }

        try:
            cnx = mysql.connector.connect(**connect_kvs)
            self.connection = cnx
            return True
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
                print("The credentials you provided are not correct.")
            elif err.errno == errorcode.ER_BAD_DB_ERROR:
                print("The database you provided does not exist.")
            else:
                print("Something went wrong: ", err)
            return False

    def insert(self, **values):
        """insert data"""
        if self.connection is None:
            print("Please connect first")
            return False

        cursor = self.connection.cursor()

        sql = "insert into fupai_machine " \
              "(sn, device_id, device_name) " \
              "values " \
              "(%s,%s,%s)"
        # values
        sn = values['sn']
        device_id = values['device_id']
        device_name = values['device_name']

        try:
            cursor.execute(sql, (sn, device_id, device_name))
            self.connection.commit()
            return True
        except mysql.connector.Error as err:
            print("An error occurred: {}".format(err))
            return False


if __name__ == '__main__':
    import sys

    reload(sys)
    sys.setdefaultencoding('gbk')
    db = MySQLDB()
    db.insert(sn=81, device_id='11111', device_name='testmachinename')

