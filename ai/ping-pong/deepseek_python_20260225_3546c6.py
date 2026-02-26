import pygame
import numpy as np
import random
from enum import Enum
import pickle
import os
import platform

# 初始化Pygame
pygame.init()

# 获取中文字体
def get_chinese_font():
    system = platform.system()
    font_paths = []
    
    if system == 'Windows':
        font_paths = [
            'C:/Windows/Fonts/simhei.ttf',
            'C:/Windows/Fonts/msyh.ttc',
        ]
    elif system == 'Darwin':
        font_paths = [
            '/System/Library/Fonts/PingFang.ttc',
            '/System/Library/Fonts/STHeiti Light.ttc',
        ]
    else:
        font_paths = [
            '/usr/share/fonts/truetype/wqy/wqy-microhei.ttc',
        ]
    
    for font_path in font_paths:
        if os.path.exists(font_path):
            try:
                return pygame.font.Font(font_path, 36), pygame.font.Font(font_path, 24)
            except:
                continue
    
    return pygame.font.Font(None, 36), pygame.font.Font(None, 24)

CHINESE_FONT_36, CHINESE_FONT_24 = get_chinese_font()

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
        self.last_hit = None
        
    def move(self):
        self.rect.x += self.speed_x
        self.rect.y += self.speed_y
        
    def bounce_wall(self):
        if self.rect.top <= 0 or self.rect.bottom >= SCREEN_HEIGHT:
            self.speed_y *= -1
            return True
        return False
    
    def bounce_paddle(self):
        self.speed_x *= -1.1
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
        self.rect.y += direction * PADDLE_SPEED
        if self.rect.top < 0:
            self.rect.top = 0
        if self.rect.bottom > SCREEN_HEIGHT:
            self.rect.bottom = SCREEN_HEIGHT

class RLAgent:
    def __init__(self, player_num):
        self.player_num = player_num
        self.q_table = {}
        
        # 动态调整的学习参数
        self.learning_rate = 0.3  # 提高学习率
        self.discount_factor = 0.9
        self.epsilon = 0.3  # 初始探索率
        
        self.actions = [-1, 0, 1]
        
        # 训练统计
        self.last_state = None
        self.last_action = None
        self.memory = []
        self.total_games = 0
        self.wins = 0
        self.consecutive_hits = 0  # 连续击球次数
        
        # 极端动作探索策略
        self.extreme_action_prob = 0.4  # 40%的概率使用极端动作
        
    def get_state(self, ball, paddle, opponent_paddle):
        """增强的状态表示"""
        # 球的位置和速度
        ball_x = int(ball.rect.x / 40)
        ball_y = int(ball.rect.y / 30)
        ball_speed_x = int(ball.speed_x * 2)
        ball_speed_y = int(ball.speed_y * 2)
        
        # 球拍位置
        paddle_y = int(paddle.rect.y / 30)
        opponent_y = int(opponent_paddle.rect.y / 30)
        
        # 球到球拍的距离（水平方向）
        if self.player_num == 1:
            distance_to_ball = int((ball.rect.x - paddle.rect.x) / 30)
        else:
            distance_to_ball = int((paddle.rect.x - ball.rect.x) / 30)
        
        # 预测球的落点（简单预测）
        if ball.speed_x != 0:
            time_to_reach = abs((paddle.rect.x - ball.rect.x) / ball.speed_x)
            predicted_y = ball.rect.y + ball.speed_y * time_to_reach
            predicted_y = max(0, min(SCREEN_HEIGHT, predicted_y))
            predicted_y = int(predicted_y / 30)
        else:
            predicted_y = ball_y
        
        return (ball_x, ball_y, ball_speed_x, ball_speed_y, 
                paddle_y, opponent_y, distance_to_ball, predicted_y)
    
    def get_action(self, state, training=True, phase='exploration'):
        """增强的动作选择策略"""
        if state not in self.q_table:
            self.q_table[state] = {a: 0 for a in self.actions}
        
        if training:
            if phase == 'exploration':
                # 探索阶段：使用极端动作优先策略
                if random.random() < self.extreme_action_prob:
                    # 优先使用极端动作（上或下）
                    return random.choice([-1, 1])
                elif random.random() < self.epsilon:
                    # 随机探索
                    return random.choice(self.actions)
            elif phase == 'exploitation':
                # 利用阶段：减少探索
                if random.random() < self.epsilon * 0.5:
                    return random.choice(self.actions)
        
        # 利用：选择Q值最大的动作
        return max(self.actions, key=lambda a: self.q_table[state][a])
    
    def remember(self, state, action, reward, next_state):
        """存储经验（只存储重要的经验）"""
        # 只存储奖励绝对值大于0.1的经验
        if abs(reward) > 0.1:
            self.memory.append((state, action, reward, next_state))
        
        # 限制记忆大小
        if len(self.memory) > 1000:
            self.memory = self.memory[-1000:]
    
    def learn(self, batch_size=50):
        """批量学习"""
        if len(self.memory) < batch_size:
            return
        
        # 随机选择一批经验进行学习
        batch = random.sample(self.memory, batch_size)
        
        for state, action, reward, next_state in batch:
            if state not in self.q_table:
                self.q_table[state] = {a: 0 for a in self.actions}
            if next_state not in self.q_table:
                self.q_table[next_state] = {a: 0 for a in self.actions}
            
            # Q-learning更新
            current_q = self.q_table[state][action]
            max_next_q = max(self.q_table[next_state].values())
            new_q = current_q + self.learning_rate * (reward + self.discount_factor * max_next_q - current_q)
            self.q_table[state][action] = new_q
    
    def update_consecutive_hits(self, hit_success):
        """更新连续击球次数并调整奖励"""
        if hit_success:
            self.consecutive_hits += 1
            # 连续击球奖励递增
            return 0.1 * (1 + self.consecutive_hits * 0.1)
        else:
            self.consecutive_hits = 0
            return 0
    
    def save_model(self, filename):
        """保存模型"""
        with open(filename, 'wb') as f:
            pickle.dump({
                'q_table': self.q_table,
                'total_games': self.total_games,
                'wins': self.wins
            }, f)
    
    def load_model(self, filename):
        """加载模型"""
        if os.path.exists(filename):
            with open(filename, 'rb') as f:
                data = pickle.load(f)
                self.q_table = data['q_table']
                self.total_games = data.get('total_games', 0)
                self.wins = data.get('wins', 0)

class PingPongGame:
    def __init__(self):
        self.screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
        pygame.display.set_caption("乒乓球游戏 - 强化学习训练")
        self.clock = pygame.time.Clock()
        
        # 使用中文字体
        self.font = CHINESE_FONT_36
        self.small_font = CHINESE_FONT_24
        
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
        self.game_state = "menu"
        self.winner = None
        
        # 训练相关
        self.training_phase = "pre_train"  # pre_train, ready, playing
        self.pre_train_games = 0
        self.target_pre_train = 1000  # 预训练1000局
        self.episode_count = 0
        
        # 加载预训练模型
        self.load_ai_models()
        
    def pre_train_phase(self):
        """快速预训练阶段 - 使用极端动作策略"""
        if self.pre_train_games >= self.target_pre_train:
            self.training_phase = "ready"
            print(f"\n=== 预训练完成！共训练 {self.pre_train_games} 局 ===")
            print("现在可以与训练好的AI对战了！")
            return
        
        # 快速训练（不渲染画面）
        for _ in range(10):  # 每帧训练10局
            self.quick_train_episode()
            self.pre_train_games += 1
            
            if self.pre_train_games % 100 == 0:
                print(f"预训练进度: {self.pre_train_games}/{self.target_pre_train} 局")
                # 每100局保存一次模型
                self.save_ai_models()
    
    def quick_train_episode(self):
        """快速训练一局（无画面渲染）"""
        # 重置游戏
        ball = Ball(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2)
        player1 = Paddle(30, SCREEN_HEIGHT // 2, BLUE, 1)
        player2 = Paddle(SCREEN_WIDTH - 40, SCREEN_HEIGHT // 2, RED, 2)
        
        episode_reward1 = 0
        episode_reward2 = 0
        hit_count1 = 0
        hit_count2 = 0
        
        while player1.score < 11 and player2.score < 11:
            # 获取状态
            state1 = self.rl_agent1.get_state(ball, player1, player2)
            state2 = self.rl_agent2.get_state(ball, player2, player1)
            
            # 选择动作（使用极端动作探索策略）
            action1 = self.rl_agent1.get_action(state1, training=True, phase='exploration')
            action2 = self.rl_agent2.get_action(state2, training=True, phase='exploration')
            
            # 执行动作
            if action1 != 0:
                player1.move(action1)
            if action2 != 0:
                player2.move(action2)
            
            # 移动球
            ball.move()
            ball.bounce_wall()
            
            # 碰撞检测和奖励计算
            hit_success1 = False
            hit_success2 = False
            
            if ball.rect.colliderect(player1.rect) and ball.last_hit != 1:
                ball.bounce_paddle()
                ball.last_hit = 1
                hit_success1 = True
                hit_count1 += 1
                
            if ball.rect.colliderect(player2.rect) and ball.last_hit != 2:
                ball.bounce_paddle()
                ball.last_hit = 2
                hit_success2 = True
                hit_count2 += 1
            
            # 计算奖励
            reward1 = 0
            reward2 = 0
            
            # 击球奖励
            if hit_success1:
                reward1 += self.rl_agent1.update_consecutive_hits(True)
            if hit_success2:
                reward2 += self.rl_agent2.update_consecutive_hits(True)
            
            # 检查得分
            scorer = 0
            if ball.rect.left <= 0:
                player2.score += 1
                scorer = 2
                ball.reset(1)
                hit_count1 = 0
                hit_count2 = 0
            elif ball.rect.right >= SCREEN_WIDTH:
                player1.score += 1
                scorer = 1
                ball.reset(-1)
                hit_count1 = 0
                hit_count2 = 0
            
            # 得分奖励
            if scorer == 1:
                reward1 += 5  # 得分奖励
                reward2 += -2  # 失分惩罚
                self.rl_agent1.wins += 1
            elif scorer == 2:
                reward2 += 5
                reward1 += -2
                self.rl_agent2.wins += 1
            
            # 获取下一状态
            next_state1 = self.rl_agent1.get_state(ball, player1, player2)
            next_state2 = self.rl_agent2.get_state(ball, player2, player1)
            
            # 存储经验
            self.rl_agent1.remember(state1, action1, reward1, next_state1)
            self.rl_agent2.remember(state2, action2, reward2, next_state2)
            
            # 累计奖励
            episode_reward1 += reward1
            episode_reward2 += reward2
        
        # 学习
        self.rl_agent1.learn()
        self.rl_agent2.learn()
        
        # 更新总游戏数
        self.rl_agent1.total_games += 1
        self.rl_agent2.total_games += 1
        
        # 动态调整探索率
        if self.pre_train_games > self.target_pre_train * 0.7:
            self.rl_agent1.epsilon = max(0.05, self.rl_agent1.epsilon * 0.999)
            self.rl_agent2.epsilon = max(0.05, self.rl_agent2.epsilon * 0.999)
    
    def handle_menu(self):
        """处理菜单选择"""
        self.screen.fill(BLACK)
        
        # 标题
        title_rect = self.font.get_rect("乒乓球游戏 - 强化学习训练")
        self.font.render_to(self.screen, (SCREEN_WIDTH//2 - title_rect.width//2, 50), 
                           "乒乓球游戏 - 强化学习训练", WHITE)
        
        # 训练状态
        if self.training_phase == "pre_train":
            progress = f"预训练中: {self.pre_train_games}/{self.target_pre_train} 局"
            self.small_font.render_to(self.screen, (SCREEN_WIDTH//2 - 100, 100), progress, YELLOW)
        elif self.training_phase == "ready":
            ready_text = "预训练完成！AI已准备好！"
            self.small_font.render_to(self.screen, (SCREEN_WIDTH//2 - 80, 100), ready_text, GREEN)
        
        # 选项
        options = [
            "1: 玩家1 人类 vs 玩家2 人类",
            "2: 玩家1 人类 vs 玩家2 训练好的AI",
            "3: 玩家1 训练好的AI vs 玩家2 人类",
            "4: 继续训练AI (1000局)",
            "5: 查看AI训练统计",
            "ESC: 退出"
        ]
        
        for i, option in enumerate(options):
            self.small_font.render_to(self.screen, 
                                     (SCREEN_WIDTH//2 - 200, 150 + i * 30), 
                                     option, WHITE)
        
        # 显示训练统计
        if self.rl_agent1.total_games > 0:
            win_rate1 = (self.rl_agent1.wins / max(1, self.rl_agent1.total_games)) * 100
            win_rate2 = (self.rl_agent2.wins / max(1, self.rl_agent2.total_games)) * 100
            
            stats = [
                f"AI1 训练局数: {self.rl_agent1.total_games}",
                f"AI1 胜率: {win_rate1:.1f}%",
                f"AI2 训练局数: {self.rl_agent2.total_games}",
                f"AI2 胜率: {win_rate2:.1f}%",
                f"AI1 ε: {self.rl_agent1.epsilon:.3f}",
                f"AI2 ε: {self.rl_agent2.epsilon:.3f}"
            ]
            
            for i, stat in enumerate(stats):
                self.small_font.render_to(self.screen, 
                                        (SCREEN_WIDTH//2 - 200, 350 + i * 25), 
                                        stat, GREEN)
        
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
                    self.player2_type = PlayerType.AI_RL
                    self.game_state = "playing"
                elif event.key == pygame.K_3:
                    self.player1_type = PlayerType.AI_RL
                    self.player2_type = PlayerType.HUMAN
                    self.game_state = "playing"
                elif event.key == pygame.K_4:
                    self.target_pre_train += 1000
                    self.training_phase = "pre_train"
                    print(f"继续训练，目标增加到 {self.target_pre_train} 局")
                elif event.key == pygame.K_5:
                    self.show_ai_stats()
                elif event.key == pygame.K_ESCAPE:
                    return False
        return True
    
    def show_ai_stats(self):
        """显示AI详细统计"""
        self.screen.fill(BLACK)
        
        stats = [
            "AI训练统计",
            f"AI1 训练局数: {self.rl_agent1.total_games}",
            f"AI1 获胜局数: {self.rl_agent1.wins}",
            f"AI1 胜率: {(self.rl_agent1.wins/max(1,self.rl_agent1.total_games))*100:.2f}%",
            f"AI1 记忆大小: {len(self.rl_agent1.memory)}",
            f"AI1 Q表大小: {len(self.rl_agent1.q_table)}",
            f"AI1 探索率: {self.rl_agent1.epsilon:.4f}",
            "",
            f"AI2 训练局数: {self.rl_agent2.total_games}",
            f"AI2 获胜局数: {self.rl_agent2.wins}",
            f"AI2 胜率: {(self.rl_agent2.wins/max(1,self.rl_agent2.total_games))*100:.2f}%",
            f"AI2 记忆大小: {len(self.rl_agent2.memory)}",
            f"AI2 Q表大小: {len(self.rl_agent2.q_table)}",
            f"AI2 探索率: {self.rl_agent2.epsilon:.4f}",
            "",
            "按任意键返回菜单"
        ]
        
        for i, stat in enumerate(stats):
            color = WHITE if i == 0 else GREEN
            self.small_font.render_to(self.screen, 
                                    (50, 50 + i * 25), 
                                    stat, color)
        
        pygame.display.flip()
        
        waiting = True
        while waiting:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    self.running = False
                    waiting = False
                if event.type == pygame.KEYDOWN:
                    waiting = False
    
    def handle_input(self):
        keys = pygame.key.get_pressed()
        
        if self.player1_type == PlayerType.HUMAN:
            if keys[pygame.K_w]:
                self.player1.move(-1)
            if keys[pygame.K_s]:
                self.player1.move(1)
        
        if self.player2_type == PlayerType.HUMAN:
            if keys[pygame.K_UP]:
                self.player2.move(-1)
            if keys[pygame.K_DOWN]:
                self.player2.move(1)
    
    def ai_move(self):
        """AI移动逻辑（使用利用阶段策略）"""
        # 玩家1 AI
        if self.player1_type == PlayerType.AI_RL:
            state = self.rl_agent1.get_state(self.ball, self.player1, self.player2)
            action = self.rl_agent1.get_action(state, training=False, phase='exploitation')
            if action != 0:
                self.player1.move(action)
        
        # 玩家2 AI
        if self.player2_type == PlayerType.AI_RL:
            state = self.rl_agent2.get_state(self.ball, self.player2, self.player1)
            action = self.rl_agent2.get_action(state, training=False, phase='exploitation')
            if action != 0:
                self.player2.move(action)
    
    def check_collisions(self):
        if self.ball.rect.colliderect(self.player1.rect) and self.ball.last_hit != 1:
            self.ball.bounce_paddle()
            self.ball.last_hit = 1
            
        if self.ball.rect.colliderect(self.player2.rect) and self.ball.last_hit != 2:
            self.ball.bounce_paddle()
            self.ball.last_hit = 2
    
    def check_score(self):
        if self.ball.rect.left <= 0:
            self.player2.score += 1
            self.ball.reset(1)
            return 2
        elif self.ball.rect.right >= SCREEN_WIDTH:
            self.player1.score += 1
            self.ball.reset(-1)
            return 1
        return 0
    
    def draw(self):
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
        
        # 绘制玩家类型
        p1_text = "人类" if self.player1_type == PlayerType.HUMAN else "强化学习AI"
        p2_text = "人类" if self.player2_type == PlayerType.HUMAN else "强化学习AI"
        
        self.small_font.render_to(self.screen, (50, 20), p1_text, BLUE)
        self.small_font.render_to(self.screen, (SCREEN_WIDTH - 150, 20), p2_text, RED)
        
        pygame.display.flip()
    
    def reset_game(self):
        self.ball = Ball(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2)
        self.player1.rect.centery = SCREEN_HEIGHT // 2
        self.player2.rect.centery = SCREEN_HEIGHT // 2
        self.player1.score = 0
        self.player2.score = 0
    
    def save_ai_models(self):
        self.rl_agent1.save_model("agent1_model.pkl")
        self.rl_agent2.save_model("agent2_model.pkl")
        print(f"模型已保存 (训练局数: {self.rl_agent1.total_games})")
    
    def load_ai_models(self):
        self.rl_agent1.load_model("agent1_model.pkl")
        self.rl_agent2.load_model("agent2_model.pkl")
        if self.rl_agent1.total_games > 0:
            print(f"已加载模型，AI1已训练 {self.rl_agent1.total_games} 局")
            self.pre_train_games = self.rl_agent1.total_games
            if self.pre_train_games >= self.target_pre_train:
                self.training_phase = "ready"
    
    def run(self):
        """游戏主循环"""
        while self.running:
            # 预训练阶段
            if self.training_phase == "pre_train":
                self.pre_train_phase()
                # 在预训练期间也处理事件，避免卡死
                for event in pygame.event.get():
                    if event.type == pygame.QUIT:
                        self.running = False
            
            # 菜单处理
            if self.game_state == "menu":
                if not self.handle_menu():
                    self.running = False
            
            # 游戏进行
            elif self.game_state == "playing":
                for event in pygame.event.get():
                    if event.type == pygame.QUIT:
                        self.running = False
                    if event.type == pygame.KEYDOWN:
                        if event.key == pygame.K_ESCAPE:
                            self.game_state = "menu"
                            self.reset_game()
                
                self.handle_input()
                self.ai_move()
                self.ball.move()
                self.ball.bounce_wall()
                self.check_collisions()
                
                scorer = self.check_score()
                if scorer != 0:
                    if self.player1.score >= 11 or self.player2.score >= 11:
                        self.game_state = "menu"
                        self.reset_game()
                
                self.draw()
                self.clock.tick(FPS)
        
        # 退出前保存模型
        self.save_ai_models()
        pygame.quit()

# 运行游戏
if __name__ == "__main__":
    game = PingPongGame()
    game.run()