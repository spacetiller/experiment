# 调试连接问题
import pymysql

try:
    # 直接测试 PyMySQL 连接
    connection = pymysql.connect(
        host='localhost',
        user='jason',
        password='123456',
        database='macro'
    )
    print("✅ PyMySQL 直接连接成功")
    connection.close()
except Exception as e:
    print(f"❌ PyMySQL 连接失败: {e}")
