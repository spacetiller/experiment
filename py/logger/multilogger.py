# -*- coding:utf8 -*-

import logging
import logging.handlers


def ini_file_logging(log_file_name):  #创建文件Logger
    logger = logging.getLogger('fileLog')
    logger.setLevel(logging.DEBUG)

    rh = logging.handlers.TimedRotatingFileHandler(log_file_name, 'D')
    fm = logging.Formatter("%(name)s %(asctime)s  %(levelname)s - %(message)s", "%Y-%m-%d %H:%M:%S")
    rh.setFormatter(fm)
    logger.addHandler(rh)


def ini_console_logging():  # 创建直接输出到stderr的Logger
    logger = logging.getLogger('consoleLog')
    logger.setLevel(logging.DEBUG)

    rh = logging.StreamHandler()
    fm = logging.Formatter("%(name)s %(asctime)s  %(levelname)s - %(message)s", "%Y-%m-%d %H:%M:%S")
    rh.setFormatter(fm)
    logger.addHandler(rh)

    rh = logging.handlers.TimedRotatingFileHandler('console.log', 'D')
    fm = logging.Formatter("%(name)s %(asctime)s  %(levelname)s - %(message)s", "%Y-%m-%d %H:%M:%S")
    rh.setFormatter(fm)
    logger.addHandler(rh)

def write_reg(addr, value):  # 写寄存器
    my_logger = logging.getLogger('fileLog')  # log写到文件里
    my_logger.info('write reg %02x : %02x' % (addr, value))


def read_reg(addr, len):  # 读寄存器
    my_logger = logging.getLogger('fileLog')  # log写到文件里
    ret = 128  # 假设的返回值，实际从网络获取
    my_logger.info('read reg %02x : %02x' % (addr, ret))


if __name__ == '__main__':

    ini_file_logging('testlog.log')
    ini_console_logging()

    logger = logging.getLogger('consoleLog')
    logger.info('Start')

    write_reg(100, 16)
    read_reg(100, 1)

    logger = logging.getLogger('consoleLog')
    logger.info('End')

