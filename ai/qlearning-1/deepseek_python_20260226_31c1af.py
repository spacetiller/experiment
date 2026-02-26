import pygame
import numpy as np
import random
import pickle
import os
from enum import Enum
import time
import sys
import io

# 修复控制台中文输出
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

# 初始化Pygame
pygame.init()

# 游戏常量
GRID_SIZE = 20
CELL_SIZE = 30
WINDOW_WIDTH = GRID_SIZE * CELL_SIZE
WINDOW_HEIGHT = GRID_SIZE * CELL_SIZE
FPS = 30

# 颜色定义
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
BROWN = (139, 69, 19)
YELLOW = (255, 255, 0)
RED = (255, 0, 0)
BLUE = (0, 0, 255)
GREEN = (0, 255, 0)
GRAY = (128, 128, 128)
ORANGE = (255, 165, 0)
PURPLE = (128, 0, 128)

# 方向定义
UP = 0
DOWN = 1
LEFT = 2
RIGHT = 3
DIRECTIONS = [(0, -1), (0, 1), (-1, 0), (1, 0)]

# 尝试加载中文字体
def get_chinese_font(size):
    """获取中文字体，如果失败则使用默认字体"""
    font_paths = [
        # Windows 字体
        'C:/Windows/Fonts/simhei.ttf',
        'C:/Windows/Fonts/msyh.ttc',
        'C:/Windows/Fonts/simsun.ttc',
        # macOS 字体
        '/System/Library/Fonts/PingFang.ttc',
        '/System/Library/Fonts/STHeiti Light.ttc',
        # Linux 字体
        '/usr/share/fonts/truetype/wqy/wqy-microhei.ttc',
        '/usr/share/fonts/truetype/arphic/uming.ttc'
    ]
    
    for font_path in font_paths:
        if os.path.exists(font_path):
            try:
                return pygame.font.Font(font_path, size)
            except:
                continue
    
    # 如果都失败，使用默认字体
    print("警告：未找到中文字体，将使用默认字体")
    return pygame.font.Font(None, size)

class GameMode(Enum):
    MENU = 0
    AI_PLAY = 1
    HUMAN_PLAY = 2
    TRAINING = 3

class Rat:
    """老鼠角色"""
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.start_x = x
        self.start_y = y
        self.path = [(x, y)]
        self.rewards = 0
        
    def reset(self):
        self.x = self.start_x
        self.y = self.start_y
        self.path = [(self.start_x, self.start_y)]
        self.rewards = 0
    
    def move(self, direction):
        dx, dy = DIRECTIONS[direction]
        new_x = self.x + dx
        new_y = self.y + dy
        
        # 检查边界
        if 0 <= new_x < GRID_SIZE and 0 <= new_y < GRID_SIZE:
            self.x = new_x
            self.y = new_y
            self.path.append((new_x, new_y))
            return True
        return False

class Cheese:
    """奶酪"""
    def __init__(self, x, y, is_special=False):
        self.x = x
        self.y = y
        self.is_special = is_special
        self.collected = False
    
    def get_value(self):
        return 3 if self.is_special else 1
    
    def reset(self):
        self.collected = False

class Cat:
    """猫"""
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
    def check_collision(self, rat_x, rat_y):
        return self.x == rat_x and self.y == rat_y

class QLearningAgent:
    """Q-learning强化学习智能体"""
    def __init__(self, learning_rate=0.1, discount_factor=0.95, epsilon=0.3):
        self.q_table = {}
        self.lr = learning_rate
        self.gamma = discount_factor
        self.epsilon = epsilon
        self.actions = [UP, DOWN, LEFT, RIGHT]
        
        # 训练统计
        self.episodes = 0
        self.total_rewards = []
        self.success_rate = []
        
    def get_state(self, rat, cheeses, cat):
        """将游戏状态转换为离散状态"""
        # 老鼠位置
        rat_pos = (rat.x, rat.y)
        
        # 最近的普通奶酪
        normal_cheese_pos = None
        min_normal_dist = float('inf')
        
        # 特殊奶酪位置
        special_cheese_pos = None
        min_special_dist = float('inf')
        
        for cheese in cheeses:
            if not cheese.collected:
                dist = abs(rat.x - cheese.x) + abs(rat.y - cheese.y)
                if cheese.is_special:
                    if dist < min_special_dist:
                        min_special_dist = dist
                        special_cheese_pos = (cheese.x, cheese.y)
                else:
                    if dist < min_normal_dist:
                        min_normal_dist = dist
                        normal_cheese_pos = (cheese.x, cheese.y)
        
        # 猫的位置
        cat_pos = (cat.x, cat.y)
        
        # 简化状态空间：使用相对位置
        state = (
            rat_pos[0], rat_pos[1],
            normal_cheese_pos[0] if normal_cheese_pos else -1,
            normal_cheese_pos[1] if normal_cheese_pos else -1,
            special_cheese_pos[0] if special_cheese_pos else -1,
            special_cheese_pos[1] if special_cheese_pos else -1,
            cat_pos[0], cat_pos[1]
        )
        
        return state
    
    def get_action(self, state, training=True):
        """选择动作"""
        if state not in self.q_table:
            self.q_table[state] = {a: 0 for a in self.actions}
        
        if training and random.random() < self.epsilon:
            return random.choice(self.actions)
        
        return max(self.actions, key=lambda a: self.q_table[state][a])
    
    def update(self, state, action, reward, next_state):
        """更新Q表"""
        if state not in self.q_table:
            self.q_table[state] = {a: 0 for a in self.actions}
        if next_state not in self.q_table:
            self.q_table[next_state] = {a: 0 for a in self.actions}
        
        current_q = self.q_table[state][action]
        max_next_q = max(self.q_table[next_state].values())
        
        new_q = current_q + self.lr * (reward + self.gamma * max_next_q - current_q)
        self.q_table[state][action] = new_q
    
    def save_model(self, filename):
        """保存模型"""
        with open(filename, 'wb') as f:
            pickle.dump({
                'q_table': self.q_table,
                'episodes': self.episodes,
                'total_rewards': self.total_rewards
            }, f)
        print(f"模型已保存到 {filename}")
    
    def load_model(self, filename):
        """加载模型"""
        if os.path.exists(filename):
            try:
                with open(filename, 'rb') as f:
                    data = pickle.load(f)
                    self.q_table = data['q_table']
                    self.episodes = data.get('episodes', 0)
                    self.total_rewards = data.get('total_rewards', [])
                print(f"模型已加载，已训练 {self.episodes} 次")
                return True
            except Exception as e:
                print(f"加载模型失败: {e}")
                return False
        return False

class RatGame:
    """游戏主类"""
    def __init__(self):
        self.screen = pygame.display.set_mode((WINDOW_WIDTH, WINDOW_HEIGHT))
        pygame.display.set_caption("Rat Cheese Game")
        self.clock = pygame.time.Clock()
        
        # 获取中文字体
        self.font = get_chinese_font(24)
        self.big_font = get_chinese_font(36)
        self.small_font = get_chinese_font(18)
        
        # 游戏模式
        self.mode = GameMode.MENU
        self.selected_option = 0
        
        # 创建游戏对象
        self.reset_game()
        
        # 创建AI智能体
        self.agent = QLearningAgent()
        
        # 加载已训练的模型
        self.agent.load_model("rat_agent_model.pkl")
        
        # 训练参数
        self.training_episodes = 0
        self.target_training = 1000
        
        # AI移动计时
        self.last_ai_move = time.time()
        self.ai_move_interval = 1.0  # 每秒1格
        
        # 菜单选项（使用英文确保显示）
        self.menu_options = [
            "1. Start AI Game (Trained)",
            "2. Start Human Game",
            "3. Train AI (1000 episodes)",
            "4. Continue Training (500 episodes)",
            "5. View Training Statistics",
            "6. Exit"
        ]
        
        # 中文提示（用于显示，但要有备选）
        self.chinese_texts = {
            'score': "得分",
            'steps': "步数",
            'remaining': "剩余奶酪",
            'mode': "模式",
            'catched': "被猫抓住了！",
            'success': "收获成功！获得",
            'cheese': "个奶酪",
            'no_steps': "步数用尽！",
            'training_complete': "训练完成！",
            'training_progress': "训练进度"
        }
    
    def reset_game(self):
        """重置游戏"""
        # 创建老鼠（出发点在左上角）
        self.rat = Rat(0, 0)
        
        # 创建奶酪
        self.cheeses = []
        
        # 普通奶酪（随机位置）
        for _ in range(5):
            while True:
                x = random.randint(5, 15)
                y = random.randint(5, 15)
                if not any(c.x == x and c.y == y for c in self.cheeses):
                    self.cheeses.append(Cheese(x, y, False))
                    break
        
        # 特殊奶酪（在猫那一行）
        cat_row = 10
        for x in [5, 10, 15]:
            self.cheeses.append(Cheese(x, cat_row, True))
        
        # 创建猫（在中间行）
        self.cat = Cat(10, 10)
        
        # 游戏状态
        self.game_over = False
        self.message = ""
        self.steps = 0
        self.max_steps = 100
    
    def draw_grid(self):
        """绘制网格"""
        for x in range(0, WINDOW_WIDTH, CELL_SIZE):
            pygame.draw.line(self.screen, GRAY, (x, 0), (x, WINDOW_HEIGHT), 1)
        for y in range(0, WINDOW_HEIGHT, CELL_SIZE):
            pygame.draw.line(self.screen, GRAY, (0, y), (WINDOW_WIDTH, y), 1)
    
    def draw_game(self):
        """绘制游戏画面"""
        self.screen.fill(WHITE)
        self.draw_grid()
        
        # 绘制猫
        cat_rect = pygame.Rect(self.cat.x * CELL_SIZE, self.cat.y * CELL_SIZE, 
                               CELL_SIZE, CELL_SIZE)
        pygame.draw.rect(self.screen, RED, cat_rect)
        cat_text = self.small_font.render("Cat", True, WHITE)
        cat_text_rect = cat_text.get_rect(center=cat_rect.center)
        self.screen.blit(cat_text, cat_text_rect)
        
        # 绘制奶酪
        for cheese in self.cheeses:
            if not cheese.collected:
                color = ORANGE if cheese.is_special else YELLOW
                cheese_rect = pygame.Rect(cheese.x * CELL_SIZE, cheese.y * CELL_SIZE,
                                         CELL_SIZE, CELL_SIZE)
                pygame.draw.rect(self.screen, color, cheese_rect)
                cheese_text = self.small_font.render("3" if cheese.is_special else "1", True, BLACK)
                cheese_text_rect = cheese_text.get_rect(center=cheese_rect.center)
                self.screen.blit(cheese_text, cheese_text_rect)
        
        # 绘制老鼠路径
        if len(self.rat.path) > 1:
            for i in range(len(self.rat.path) - 1):
                start = self.rat.path[i]
                end = self.rat.path[i + 1]
                start_pos = (start[0] * CELL_SIZE + CELL_SIZE//2, 
                            start[1] * CELL_SIZE + CELL_SIZE//2)
                end_pos = (end[0] * CELL_SIZE + CELL_SIZE//2, 
                          end[1] * CELL_SIZE + CELL_SIZE//2)
                pygame.draw.line(self.screen, BLUE, start_pos, end_pos, 2)
        
        # 绘制老鼠
        rat_rect = pygame.Rect(self.rat.x * CELL_SIZE, self.rat.y * CELL_SIZE,
                              CELL_SIZE, CELL_SIZE)
        pygame.draw.rect(self.screen, BROWN, rat_rect)
        rat_text = self.small_font.render("Rat", True, WHITE)
        rat_text_rect = rat_text.get_rect(center=rat_rect.center)
        self.screen.blit(rat_text, rat_text_rect)
        
        # 绘制信息（使用英文确保显示）
        mode_text = "AI Mode" if self.mode == GameMode.AI_PLAY else "Human Mode"
        info_texts = [
            f"Score: {self.rat.rewards}",
            f"Steps: {self.steps}/{self.max_steps}",
            f"Cheese left: {sum(1 for c in self.cheeses if not c.collected)}",
            f"Mode: {mode_text}"
        ]
        
        y_offset = 10
        for text in info_texts:
            text_surface = self.font.render(text, True, BLACK)
            self.screen.blit(text_surface, (10, y_offset))
            y_offset += 25
        
        # 显示消息
        if self.message:
            msg_surface = self.big_font.render(self.message, True, RED)
            msg_rect = msg_surface.get_rect(center=(WINDOW_WIDTH//2, WINDOW_HEIGHT//2))
            self.screen.blit(msg_surface, msg_rect)
        
        pygame.display.flip()
    
    def draw_menu(self):
        """绘制菜单"""
        self.screen.fill(WHITE)
        
        # 标题（使用英文确保显示）
        title = self.big_font.render("Rat Cheese Game - Q-Learning", True, PURPLE)
        title_rect = title.get_rect(center=(WINDOW_WIDTH//2, 50))
        self.screen.blit(title, title_rect)
        
        # 训练统计（使用英文）
        if self.agent.episodes > 0:
            avg_reward = sum(self.agent.total_rewards[-100:]) / min(100, len(self.agent.total_rewards)) if self.agent.total_rewards else 0
            stats = [
                f"Training episodes: {self.agent.episodes}",
                f"Avg reward (last 100): {avg_reward:.2f}",
                f"Q-table size: {len(self.agent.q_table)}",
                f"Epsilon: {self.agent.epsilon:.2f}"
            ]
            y_offset = 120
            for stat in stats:
                stat_surface = self.font.render(stat, True, BLUE)
                self.screen.blit(stat_surface, (50, y_offset))
                y_offset += 25
        
        # 菜单选项
        y_offset = 250
        for i, option in enumerate(self.menu_options):
            color = GREEN if i == self.selected_option else BLACK
            option_surface = self.font.render(option, True, color)
            option_rect = option_surface.get_rect(center=(WINDOW_WIDTH//2, y_offset))
            self.screen.blit(option_surface, option_rect)
            y_offset += 40
        
        # 操作提示（使用英文）
        tips = [
            "Controls:",
            "  ↑/↓ - Select option",
            "  Enter - Confirm",
            "  In game:",
            "    Human mode: Arrow keys to move",
            "    AI mode: Auto move (1 step/sec)",
            "    ESC - Return to menu"
        ]
        
        y_offset = 450
        for tip in tips:
            tip_surface = self.small_font.render(tip, True, GRAY)
            self.screen.blit(tip_surface, (50, y_offset))
            y_offset += 20
        
        pygame.display.flip()
    
    def handle_menu_input(self):
        """处理菜单输入"""
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                return False
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_UP:
                    self.selected_option = (self.selected_option - 1) % len(self.menu_options)
                elif event.key == pygame.K_DOWN:
                    self.selected_option = (self.selected_option + 1) % len(self.menu_options)
                elif event.key == pygame.K_RETURN:
                    self.execute_menu_option()
        return True
    
    def execute_menu_option(self):
        """执行菜单选项"""
        if self.selected_option == 0:  # AI自动游戏
            self.mode = GameMode.AI_PLAY
            self.reset_game()
            self.last_ai_move = time.time()
            print("开始AI自动游戏")
        elif self.selected_option == 1:  # 人类游戏
            self.mode = GameMode.HUMAN_PLAY
            self.reset_game()
            print("开始人类游戏")
        elif self.selected_option == 2:  # 训练AI
            self.mode = GameMode.TRAINING
            self.training_episodes = 0
            self.target_training = 1000
            print("开始训练AI (1000次)")
        elif self.selected_option == 3:  # 继续训练
            self.mode = GameMode.TRAINING
            self.training_episodes = 0
            self.target_training = 500
            print("继续训练AI (500次)")
        elif self.selected_option == 4:  # 查看统计
            self.show_stats()
        elif self.selected_option == 5:  # 退出
            self.agent.save_model("rat_agent_model.pkl")
            pygame.quit()
            sys.exit()
    
    def show_stats(self):
        """显示详细统计"""
        waiting = True
        while waiting:
            self.screen.fill(WHITE)
            
            stats = [
                "Training Statistics",
                f"Total episodes: {self.agent.episodes}",
                f"Q-table size: {len(self.agent.q_table)}",
                f"Epsilon: {self.agent.epsilon:.3f}",
                f"Learning rate: {self.agent.lr}",
                f"Discount factor: {self.agent.gamma}",
                "",
                "Recent scores:"
            ]
            
            if self.agent.total_rewards:
                recent = self.agent.total_rewards[-10:]
                for i, reward in enumerate(recent):
                    stats.append(f"  {i+1}: {reward:.1f}")
                
                if len(self.agent.total_rewards) >= 10:
                    avg = sum(recent) / len(recent)
                    stats.append(f"Average: {avg:.2f}")
            
            stats.append("")
            stats.append("Press any key to return")
            
            y_offset = 50
            for stat in stats:
                color = PURPLE if stat == "Training Statistics" else BLACK
                stat_surface = self.font.render(stat, True, color)
                self.screen.blit(stat_surface, (50, y_offset))
                y_offset += 25
            
            pygame.display.flip()
            
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    self.agent.save_model("rat_agent_model.pkl")
                    pygame.quit()
                    sys.exit()
                if event.type == pygame.KEYDOWN:
                    waiting = False
    
    def train_episode(self):
        """训练一局"""
        self.reset_game()
        total_reward = 0
        steps = 0
        
        while steps < self.max_steps and not self.game_over:
            # 获取当前状态
            state = self.agent.get_state(self.rat, self.cheeses, self.cat)
            
            # 选择动作
            action = self.agent.get_action(state, training=True)
            
            # 执行动作
            self.rat.move(action)
            steps += 1
            
            # 计算奖励
            reward = -0.1  # 每步微小惩罚
            
            # 检查奶酪
            for cheese in self.cheeses:
                if not cheese.collected and cheese.x == self.rat.x and cheese.y == self.rat.y:
                    cheese.collected = True
                    reward += cheese.get_value()
                    self.rat.rewards += cheese.get_value()
            
            # 检查猫
            if self.cat.check_collision(self.rat.x, self.rat.y):
                reward -= 10
                self.game_over = True
                self.message = "Catched!"
            
            # 检查是否回到出发点
            if self.rat.x == self.rat.start_x and self.rat.y == self.rat.start_y:
                collected_cheese = sum(1 for c in self.cheeses if c.collected)
                if collected_cheese > 0:
                    reward += 5
                    self.message = f"Success! Got {collected_cheese} cheese"
                else:
                    reward -= 1
                    self.message = "No cheese collected"
                self.game_over = True
            
            # 获取下一状态
            next_state = self.agent.get_state(self.rat, self.cheeses, self.cat)
            
            # 更新Q表
            self.agent.update(state, action, reward, next_state)
            
            total_reward += reward
        
        # 记录训练结果
        self.agent.episodes += 1
        self.agent.total_rewards.append(total_reward)
        
        # 动态调整探索率
        if self.agent.episodes > 500:
            self.agent.epsilon = max(0.05, self.agent.epsilon * 0.995)
    
    def ai_move(self):
        """AI移动（每秒一格）"""
        current_time = time.time()
        if current_time - self.last_ai_move >= self.ai_move_interval:
            state = self.agent.get_state(self.rat, self.cheeses, self.cat)
            action = self.agent.get_action(state, training=False)
            self.rat.move(action)
            self.last_ai_move = current_time
            return True
        return False
    
    def check_game_state(self):
        """检查游戏状态"""
        # 检查奶酪
        for cheese in self.cheeses:
            if not cheese.collected and cheese.x == self.rat.x and cheese.y == self.rat.y:
                cheese.collected = True
                self.rat.rewards += cheese.get_value()
        
        # 检查猫
        if self.cat.check_collision(self.rat.x, self.rat.y):
            self.game_over = True
            self.message = "Catched!"
        
        # 检查回到出发点
        if self.rat.x == self.rat.start_x and self.rat.y == self.rat.start_y:
            collected_cheese = sum(1 for c in self.cheeses if c.collected)
            self.message = f"Success! Got {collected_cheese} cheese"
            self.game_over = True
        
        # 检查步数限制
        if self.steps >= self.max_steps:
            self.game_over = True
            self.message = "No steps left!"
    
    def run(self):
        """游戏主循环"""
        running = True
        
        while running:
            if self.mode == GameMode.MENU:
                if not self.handle_menu_input():
                    running = False
                self.draw_menu()
            
            elif self.mode == GameMode.TRAINING:
                # 快速训练
                for _ in range(10):
                    if self.training_episodes < self.target_training:
                        self.train_episode()
                        self.training_episodes += 1
                        
                        if self.training_episodes % 100 == 0:
                            print(f"Training progress: {self.training_episodes}/{self.target_training}")
                    else:
                        self.agent.save_model("rat_agent_model.pkl")
                        print("Training complete!")
                        self.mode = GameMode.MENU
                        break
                
                # 处理事件
                for event in pygame.event.get():
                    if event.type == pygame.QUIT:
                        running = False
            
            elif self.mode == GameMode.AI_PLAY:
                # AI自动游戏
                for event in pygame.event.get():
                    if event.type == pygame.QUIT:
                        running = False
                    if event.type == pygame.KEYDOWN:
                        if event.key == pygame.K_ESCAPE:
                            self.mode = GameMode.MENU
                
                if not self.game_over:
                    if self.ai_move():
                        self.steps += 1
                        self.check_game_state()
                
                self.draw_game()
                self.clock.tick(FPS)
            
            elif self.mode == GameMode.HUMAN_PLAY:
                # 人类游戏
                for event in pygame.event.get():
                    if event.type == pygame.QUIT:
                        running = False
                    if event.type == pygame.KEYDOWN:
                        if event.key == pygame.K_ESCAPE:
                            self.mode = GameMode.MENU
                        elif not self.game_over:
                            if event.key == pygame.K_UP:
                                self.rat.move(UP)
                                self.steps += 1
                            elif event.key == pygame.K_DOWN:
                                self.rat.move(DOWN)
                                self.steps += 1
                            elif event.key == pygame.K_LEFT:
                                self.rat.move(LEFT)
                                self.steps += 1
                            elif event.key == pygame.K_RIGHT:
                                self.rat.move(RIGHT)
                                self.steps += 1
                            self.check_game_state()
                
                self.draw_game()
                pygame.display.flip()
                self.clock.tick(FPS)
        
        # 退出前保存模型
        self.agent.save_model("rat_agent_model.pkl")
        pygame.quit()

# 运行游戏
if __name__ == "__main__":
    game = RatGame()
    game.run()