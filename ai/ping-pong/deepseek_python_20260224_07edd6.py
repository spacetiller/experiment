import pygame
import numpy as np
import random
from enum import Enum
import pickle
import os

# 初始化Pygame
pygame.init()

# 游戏常量
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
FPS = 60

# 颜色定义
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
RED = (255, 0, 0)
BLUE = (0, 0, 255)
GREEN = (0, 255, 0)
YELLOW = (255, 255, 0)

# 游戏对象尺寸
PADDLE_WIDTH = 10
PADDLE_HEIGHT = 100
BALL_SIZE = 10

# 游戏速度
BALL_SPEED_X = 5
BALL_SPEED_Y = 3
PADDLE_SPEED = 8

class PlayerType(Enum):
    HUMAN = 1
    AI_RANDOM = 2
    AI_RL = 3

class Ball:
    def __init__(self, x, y):
        self.rect = pygame.Rect(x, y, BALL_SIZE, BALL_SIZE)
        self.speed_x = BALL_SPEED_X * random.choice([-1, 1])
        self.speed_y = BALL_SPEED_Y * random.choice([-1, 1])
        self.last_hit = None  # 记录最后一次击球的选手
        
    def move(self):
        self.rect.x += self.speed_x
        self.rect.y += self.speed_y
        
    def bounce_wall(self):
        # 上下墙壁反弹
        if self.rect.top <= 0 or self.rect.bottom >= SCREEN_HEIGHT:
            self.speed_y *= -1
            return True
        return False
    
    def bounce_paddle(self):
        self.speed_x *= -1.1  # 每次击球稍微加速
        # 根据击球位置增加一些随机性
        self.speed_y += random.uniform(-1, 1)
        
    def reset(self, direction):
        self.rect.center = (SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2)
        self.speed_x = BALL_SPEED_X * direction
        self.speed_y = BALL_SPEED_Y * random.choice([-1, 1])
        self.last_hit = None

class Paddle:
    def __init__(self, x, y, color, player_num):
        self.rect = pygame.Rect(x, y - PADDLE_HEIGHT//2, PADDLE_WIDTH, PADDLE_HEIGHT)
        self.color = color
        self.player_num = player_num
        self.score = 0
        
    def move(self, direction):
        # direction: 1 = 向下, -1 = 向上
        self.rect.y += direction * PADDLE_SPEED
        # 限制在屏幕内
        if self.rect.top < 0:
            self.rect.top = 0
        if self.rect.bottom > SCREEN_HEIGHT:
            self.rect.bottom = SCREEN_HEIGHT

class RLAgent:
    def __init__(self, player_num):
        self.player_num = player_num
        self.q_table = {}  # 状态-动作值函数
        self.learning_rate = 0.1
        self.discount_factor = 0.95
        self.epsilon = 0.1  # 探索率
        self.actions = [-1, 0, 1]  # 上、不动、下
        
        # 记录训练数据
        self.last_state = None
        self.last_action = None
        self.memory = []
        
    def get_state(self, ball, paddle, opponent_paddle):
        """将游戏状态离散化为元组"""
        # 归一化坐标到离散值
        ball_x = int(ball.rect.x / 50)
        ball_y = int(ball.rect.y / 30)
        ball_speed_x = int(ball.speed_x)
        ball_speed_y = int(ball.speed_y)
        paddle_y = int(paddle.rect.y / 30)
        opponent_y = int(opponent_paddle.rect.y / 30)
        
        return (ball_x, ball_y, ball_speed_x, ball_speed_y, paddle_y, opponent_y)
    
    def get_action(self, state, training=True):
        """根据当前状态选择动作"""
        if training and random.random() < self.epsilon:
            # 探索：随机选择动作
            return random.choice(self.actions)
        
        # 利用：选择Q值最大的动作
        if state not in self.q_table:
            self.q_table[state] = {a: 0 for a in self.actions}
        
        return max(self.actions, key=lambda a: self.q_table[state][a])
    
    def remember(self, state, action, reward, next_state):
        """存储经验"""
        self.memory.append((state, action, reward, next_state))
        
    def learn(self):
        """从记忆中学习，更新Q表"""
        for state, action, reward, next_state in self.memory[-100:]:  # 只学习最近的100条经验
            if state not in self.q_table:
                self.q_table[state] = {a: 0 for a in self.actions}
            if next_state not in self.q_table:
                self.q_table[next_state] = {a: 0 for a in self.actions}
            
            # Q-learning 更新
            current_q = self.q_table[state][action]
            max_next_q = max(self.q_table[next_state].values())
            new_q = current_q + self.learning_rate * (reward + self.discount_factor * max_next_q - current_q)
            self.q_table[state][action] = new_q
        
        # 清空记忆
        self.memory = []
    
    def save_model(self, filename):
        """保存模型"""
        with open(filename, 'wb') as f:
            pickle.dump(self.q_table, f)
    
    def load_model(self, filename):
        """加载模型"""
        if os.path.exists(filename):
            with open(filename, 'rb') as f:
                self.q_table = pickle.load(f)

class PingPongGame:
    def __init__(self):
        self.screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
        pygame.display.set_caption("乒乓球游戏 with AI训练")
        self.clock = pygame.time.Clock()
        self.font = pygame.font.Font(None, 36)
        self.small_font = pygame.font.Font(None, 24)
        
        # 创建游戏对象
        self.ball = Ball(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2)
        self.player1 = Paddle(30, SCREEN_HEIGHT // 2, BLUE, 1)
        self.player2 = Paddle(SCREEN_WIDTH - 40, SCREEN_HEIGHT // 2, RED, 2)
        
        # 设置玩家类型
        self.player1_type = PlayerType.HUMAN
        self.player2_type = PlayerType.HUMAN
        
        # AI智能体
        self.rl_agent1 = RLAgent(1)
        self.rl_agent2 = RLAgent(2)
        
        # 游戏状态
        self.running = True
        self.game_state = "menu"  # menu, playing, game_over
        self.winner = None
        
        # 训练相关
        self.training_mode = False
        self.episode_reward = 0
        self.episode_count = 0
        
        # 加载预训练模型（如果有）
        self.rl_agent1.load_model("agent1_model.pkl")
        self.rl_agent2.load_model("agent2_model.pkl")
        
    def handle_menu(self):
        """处理菜单选择"""
        self.screen.fill(BLACK)
        
        title = self.font.render("乒乓球游戏 - 选择玩家类型", True, WHITE)
        self.screen.blit(title, (SCREEN_WIDTH//2 - 200, 100))
        
        options = [
            "1: 玩家1 人类 vs 玩家2 人类",
            "2: 玩家1 人类 vs 玩家2 随机AI",
            "3: 玩家1 人类 vs 玩家2 强化学习AI",
            "4: 玩家1 随机AI vs 玩家2 人类",
            "5: 玩家1 强化学习AI vs 玩家2 人类",
            "6: AI对战训练模式 (两个RL AI对战)",
            "7: 加载并继续训练AI",
            "ESC: 退出"
        ]
        
        for i, option in enumerate(options):
            text = self.small_font.render(option, True, WHITE)
            self.screen.blit(text, (SCREEN_WIDTH//2 - 200, 200 + i * 30))
        
        # 显示训练统计
        if self.episode_count > 0:
            stats = f"已完成训练轮次: {self.episode_count}"
            stats_text = self.small_font.render(stats, True, GREEN)
            self.screen.blit(stats_text, (SCREEN_WIDTH//2 - 200, 400))
        
        pygame.display.flip()
        
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                return False
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_1:
                    self.player1_type = PlayerType.HUMAN
                    self.player2_type = PlayerType.HUMAN
                    self.game_state = "playing"
                elif event.key == pygame.K_2:
                    self.player1_type = PlayerType.HUMAN
                    self.player2_type = PlayerType.AI_RANDOM
                    self.game_state = "playing"
                elif event.key == pygame.K_3:
                    self.player1_type = PlayerType.HUMAN
                    self.player2_type = PlayerType.AI_RL
                    self.game_state = "playing"
                elif event.key == pygame.K_4:
                    self.player1_type = PlayerType.AI_RANDOM
                    self.player2_type = PlayerType.HUMAN
                    self.game_state = "playing"
                elif event.key == pygame.K_5:
                    self.player1_type = PlayerType.AI_RL
                    self.player2_type = PlayerType.HUMAN
                    self.game_state = "playing"
                elif event.key == pygame.K_6:
                    self.player1_type = PlayerType.AI_RL
                    self.player2_type = PlayerType.AI_RL
                    self.training_mode = True
                    self.game_state = "playing"
                elif event.key == pygame.K_7:
                    self.load_ai_models()
                    self.player1_type = PlayerType.AI_RL
                    self.player2_type = PlayerType.AI_RL
                    self.training_mode = True
                    self.game_state = "playing"
                elif event.key == pygame.K_ESCAPE:
                    return False
        return True
    
    def handle_input(self):
        """处理人类玩家输入"""
        keys = pygame.key.get_pressed()
        
        # 玩家1控制 (W/S)
        if self.player1_type == PlayerType.HUMAN:
            if keys[pygame.K_w]:
                self.player1.move(-1)
            if keys[pygame.K_s]:
                self.player1.move(1)
        
        # 玩家2控制 (上下箭头)
        if self.player2_type == PlayerType.HUMAN:
            if keys[pygame.K_UP]:
                self.player2.move(-1)
            if keys[pygame.K_DOWN]:
                self.player2.move(1)
    
    def ai_move(self):
        """AI移动逻辑"""
        # 玩家1 AI
        if self.player1_type == PlayerType.AI_RANDOM:
            if random.random() < 0.02:
                direction = random.choice([-1, 1])
                self.player1.move(direction)
        
        elif self.player1_type == PlayerType.AI_RL:
            state = self.rl_agent1.get_state(self.ball, self.player1, self.player2)
            action = self.rl_agent1.get_action(state, training=self.training_mode)
            if action != 0:
                self.player1.move(action)
        
        # 玩家2 AI
        if self.player2_type == PlayerType.AI_RANDOM:
            if random.random() < 0.02:
                direction = random.choice([-1, 1])
                self.player2.move(direction)
        
        elif self.player2_type == PlayerType.AI_RL:
            state = self.rl_agent2.get_state(self.ball, self.player2, self.player1)
            action = self.rl_agent2.get_action(state, training=self.training_mode)
            if action != 0:
                self.player2.move(action)
    
    def check_collisions(self):
        """检查碰撞"""
        # 球拍碰撞
        if self.ball.rect.colliderect(self.player1.rect) and self.ball.last_hit != 1:
            self.ball.bounce_paddle()
            self.ball.last_hit = 1
            
        if self.ball.rect.colliderect(self.player2.rect) and self.ball.last_hit != 2:
            self.ball.bounce_paddle()
            self.ball.last_hit = 2
    
    def check_score(self):
        """检查得分"""
        # 球员得分逻辑
        if self.ball.rect.left <= 0:
            self.player2.score += 1
            self.ball.reset(1)  # 向玩家2方向发球
            return 2  # 玩家2得分
        elif self.ball.rect.right >= SCREEN_WIDTH:
            self.player1.score += 1
            self.ball.reset(-1)  # 向玩家1方向发球
            return 1  # 玩家1得分
        return 0
    
    def calculate_reward(self, scorer):
        """计算强化学习的奖励"""
        reward1 = 0
        reward2 = 0
        
        if scorer == 1:
            reward1 = 1
            reward2 = -1
        elif scorer == 2:
            reward1 = -1
            reward2 = 1
        
        return reward1, reward2
    
    def update_rl_agents(self, reward1, reward2):
        """更新RL智能体"""
        if self.player1_type == PlayerType.AI_RL:
            current_state = self.rl_agent1.get_state(self.ball, self.player1, self.player2)
            next_state = self.rl_agent1.get_state(self.ball, self.player1, self.player2)
            
            # 存储经验
            if hasattr(self, 'last_state1'):
                self.rl_agent1.remember(self.last_state1, self.last_action1, 
                                       reward1, current_state)
            
            self.last_state1 = current_state
            self.last_action1 = self.rl_agent1.get_action(current_state, training=True)
        
        if self.player2_type == PlayerType.AI_RL:
            current_state = self.rl_agent2.get_state(self.ball, self.player2, self.player1)
            next_state = self.rl_agent2.get_state(self.ball, self.player2, self.player1)
            
            if hasattr(self, 'last_state2'):
                self.rl_agent2.remember(self.last_state2, self.last_action2,
                                       reward2, current_state)
            
            self.last_state2 = current_state
            self.last_action2 = self.rl_agent2.get_action(current_state, training=True)
    
    def draw(self):
        """绘制游戏画面"""
        self.screen.fill(BLACK)
        
        # 绘制中线
        pygame.draw.aaline(self.screen, WHITE, 
                          (SCREEN_WIDTH//2, 0), (SCREEN_WIDTH//2, SCREEN_HEIGHT))
        
        # 绘制球拍
        pygame.draw.rect(self.screen, self.player1.color, self.player1.rect)
        pygame.draw.rect(self.screen, self.player2.color, self.player2.rect)
        
        # 绘制球
        pygame.draw.ellipse(self.screen, WHITE, self.ball.rect)
        
        # 绘制分数
        score_text = self.font.render(f"{self.player1.score} - {self.player2.score}", 
                                      True, WHITE)
        self.screen.blit(score_text, (SCREEN_WIDTH//2 - 50, 20))
        
        # 绘制玩家类型标识
        p1_text = self.get_player_type_text(self.player1_type)
        p2_text = self.get_player_type_text(self.player2_type)
        
        self.screen.blit(self.small_font.render(p1_text, True, BLUE), (50, 20))
        self.screen.blit(self.small_font.render(p2_text, True, RED), 
                        (SCREEN_WIDTH - 150, 20))
        
        # 训练模式提示
        if self.training_mode:
            train_text = self.small_font.render(f"训练模式 - 轮次: {self.episode_count}", 
                                               True, GREEN)
            self.screen.blit(train_text, (SCREEN_WIDTH//2 - 100, 50))
        
        pygame.display.flip()
    
    def get_player_type_text(self, player_type):
        """获取玩家类型文本"""
        if player_type == PlayerType.HUMAN:
            return "人类"
        elif player_type == PlayerType.AI_RANDOM:
            return "随机AI"
        else:
            return "强化学习AI"
    
    def reset_game(self):
        """重置游戏"""
        self.ball = Ball(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2)
        self.player1.rect.centery = SCREEN_HEIGHT // 2
        self.player2.rect.centery = SCREEN_HEIGHT // 2
        
        if self.training_mode:
            self.episode_count += 1
            self.episode_reward = 0
            
            # 定期保存模型
            if self.episode_count % 100 == 0:
                self.save_ai_models()
    
    def save_ai_models(self):
        """保存AI模型"""
        self.rl_agent1.save_model("agent1_model.pkl")
        self.rl_agent2.save_model("agent2_model.pkl")
        print(f"模型已保存 (轮次: {self.episode_count})")
    
    def load_ai_models(self):
        """加载AI模型"""
        self.rl_agent1.load_model("agent1_model.pkl")
        self.rl_agent2.load_model("agent2_model.pkl")
        print("模型已加载")
    
    def run(self):
        """游戏主循环"""
        while self.running:
            if self.game_state == "menu":
                if not self.handle_menu():
                    self.running = False
            
            elif self.game_state == "playing":
                for event in pygame.event.get():
                    if event.type == pygame.QUIT:
                        self.running = False
                    if event.type == pygame.KEYDOWN:
                        if event.key == pygame.K_ESCAPE:
                            # 返回菜单
                            self.game_state = "menu"
                            if self.training_mode:
                                self.save_ai_models()
                                self.training_mode = False
                            self.reset_game()
                
                # 处理输入
                self.handle_input()
                
                # AI移动
                self.ai_move()
                
                # 移动球
                self.ball.move()
                
                # 墙壁反弹
                self.ball.bounce_wall()
                
                # 碰撞检测
                self.check_collisions()
                
                # 检查得分
                scorer = self.check_score()
                if scorer != 0:
                    reward1, reward2 = self.calculate_reward(scorer)
                    self.update_rl_agents(reward1, reward2)
                    
                    # 训练模式下进行学习
                    if self.training_mode:
                        if self.player1_type == PlayerType.AI_RL:
                            self.rl_agent1.learn()
                        if self.player2_type == PlayerType.AI_RL:
                            self.rl_agent2.learn()
                    
                    # 重置游戏
                    self.reset_game()
                    
                    # 检查游戏结束
                    if self.player1.score >= 11 or self.player2.score >= 11:
                        self.game_state = "game_over"
                        self.winner = 1 if self.player1.score >= 11 else 2
                
                # 绘制画面
                self.draw()
                
                # 控制游戏速度
                self.clock.tick(FPS)
            
            elif self.game_state == "game_over":
                self.screen.fill(BLACK)
                
                if self.winner == 1:
                    text = self.font.render("玩家1获胜!", True, BLUE)
                else:
                    text = self.font.render("玩家2获胜!", True, RED)
                
                self.screen.blit(text, (SCREEN_WIDTH//2 - 100, SCREEN_HEIGHT//2 - 50))
                
                restart_text = self.small_font.render("按任意键返回菜单", True, WHITE)
                self.screen.blit(restart_text, (SCREEN_WIDTH//2 - 100, SCREEN_HEIGHT//2 + 50))
                
                pygame.display.flip()
                
                for event in pygame.event.get():
                    if event.type == pygame.QUIT:
                        self.running = False
                    if event.type == pygame.KEYDOWN:
                        if event.key == pygame.K_ESCAPE:
                            self.running = False
                        else:
                            self.reset_game()
                            self.game_state = "menu"
        
        # 退出前保存模型
        if self.training_mode:
            self.save_ai_models()
        
        pygame.quit()

# 运行游戏
if __name__ == "__main__":
    game = PingPongGame()
    game.run()