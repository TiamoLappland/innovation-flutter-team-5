import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(const InnovationHelloApp());
}

class InnovationHelloApp extends StatelessWidget {
  const InnovationHelloApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '🎨 Flutter 创意空间',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE91E63)),
        useMaterial3: true,
      ),
      home: const HelloHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HelloHomePage extends StatefulWidget {
  const HelloHomePage({super.key});
  @override
  State<HelloHomePage> createState() => _HelloHomePageState();
}

class _HelloHomePageState extends State<HelloHomePage> with TickerProviderStateMixin {
  int completedTasks = 0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void finishOneTask() {
    setState(() {
      _isAnimating = true;
      _animationController.forward().then((_) {
        _animationController.reverse();
        completedTasks += 1;
        setState(() => _isAnimating = false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🎀 创新实验第14周',
          style: TextStyle(fontFamily: 'Georgia', fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFE91E63),
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.pinkAccent.withOpacity(0.5),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFEBEE),
              Color(0xFFFFCDD2),
              Color(0xFFE1BEE7),
              Color(0xFFD1C4E9),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 动画图标
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: const Icon(
                    Icons.sparkles,
                    size: 100,
                    color: Color(0xFFE91E63),
                  ),
                ),
                const SizedBox(height: 20),
                // 艺术字标题
                const Text(
                  '🌟 Hello Flutter! 🌟',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Arial Black',
                    letterSpacing: 2,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: [Color(0xFFE91E63), Color(0xFF9C27B0), Color(0xFF2196F3)],
                      ).createShader(const Rect.fromLTWH(0, 0, 400, 40)),
                  ),
                ),
                const SizedBox(height: 8),
                // 副标题
                const Text(
                  '我已完成第14周入门任务！✓',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF7C4DFF),
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 24),
                // 个人信息卡片
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    border: Border.all(
                      color: const Color(0xFFE91E63).withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: const [
                      Text(
                        '姓名：张三',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE91E63),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '学号后四位：1234 | 小组：第5组',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // 计数器动画卡片
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFE91E63),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFE91E63).withOpacity(0.6),
                        blurRadius: _isAnimating ? 25 : 15,
                        spreadRadius: _isAnimating ? 10 : 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$completedTasks',
                        style: const TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontFamily: 'Arial Black',
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '学习打卡次数',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // 励志语录
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '💪 "每一天的努力，都是未来的礼物！"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF5D4037),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                // 装饰星星
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 20, color: Colors.amber),
                    Icon(Icons.star, size: 20, color: Colors.amber),
                    Icon(Icons.star, size: 20, color: Colors.amber),
                    Icon(Icons.star, size: 20, color: Colors.amber),
                    Icon(Icons.star, size: 20, color: Colors.amber),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // 个性化按钮
      floatingActionButton: GestureDetector(
        onTap: finishOneTask,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFE91E63), Color(0xFF9C27B0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE91E63).withOpacity(0.5),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.white, size: 24),
              SizedBox(width: 10),
              Text(
                '今日学习打卡 ✨',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
