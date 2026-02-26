from sqlalchemy import create_engine, Column, Integer, String, DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy.sql import func
import datetime

# 数据库配置
DATABASE_URL = "mysql+pymysql://jason:123456@localhost:3306/test"

# 创建引擎
engine = create_engine(DATABASE_URL, echo=True)

# 创建基类
Base = declarative_base()


# 定义数据模型
class User(Base):
    __tablename__ = 'users'

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)
    email = Column(String(100), unique=True, nullable=False)
    created_at = Column(DateTime, default=func.now())

    def __repr__(self):
        return f"<User(id={self.id}, name='{self.name}', email='{self.email}')>"


# 创建表
def create_tables():
    Base.metadata.create_all(engine)
    print("✅ 表创建成功!")


# 数据库操作类
class DatabaseManager:
    def __init__(self):
        self.Session = sessionmaker(bind=engine)

    def add_user(self, name, email):
        session = self.Session()
        try:
            user = User(name=name, email=email)
            session.add(user)
            session.commit()
            print(f"✅ 用户 {name} 添加成功!")
            return user
        except Exception as e:
            session.rollback()
            print(f"❌ 添加用户失败: {e}")
            return None
        finally:
            session.close()

    def get_all_users(self):
        session = self.Session()
        try:
            users = session.query(User).all()
            return users
        except Exception as e:
            print(f"❌ 查询用户失败: {e}")
            return []
        finally:
            session.close()

    def get_user_by_id(self, user_id):
        session = self.Session()
        try:
            user = session.query(User).filter(User.id == user_id).first()
            return user
        except Exception as e:
            print(f"❌ 查询用户失败: {e}")
            return None
        finally:
            session.close()


# 主程序
def main():
    # 创建表
    create_tables()

    # 初始化数据库管理器
    db = DatabaseManager()

    # 添加示例用户
    user1 = db.add_user("张三", "zhangsan@example.com")
    user2 = db.add_user("李四", "lisi@example.com")

    # 查询所有用户
    print("\n📋 所有用户:")
    users = db.get_all_users()
    for user in users:
        print(user)

    # 根据ID查询用户
    if users:
        user_id = users[0].id
        user = db.get_user_by_id(user_id)
        print(f"\n🔍 根据ID查询用户 (ID: {user_id}):")
        print(user)


if __name__ == "__main__":
    main()