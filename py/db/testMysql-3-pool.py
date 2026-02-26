from sqlalchemy import create_engine, text
from sqlalchemy.pool import QueuePool

# 带连接池配置的连接
DATABASE_URL = "mysql+pymysql://jason:123456@localhost:3306/test"

engine = create_engine(
    DATABASE_URL,
    poolclass=QueuePool,
    pool_size=10,           # 连接池大小
    max_overflow=20,        # 最大溢出连接数
    pool_pre_ping=True,     # 连接前ping检测
    pool_recycle=3600,      # 连接回收时间（秒）
    echo=False              # 生产环境建议关闭
)

# 测试连接
try:
    with engine.connect() as conn:
        result = conn.execute(text("SELECT VERSION()"))
        mysql_version = result.scalar()
        print(f"✅ MySQL 版本: {mysql_version}")
except Exception as e:
    print(f"❌ 连接失败: {e}")