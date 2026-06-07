import 'package:flutter/material.dart';

void main() {
  runApp(const InnovationHelloApp());
}

class InnovationHelloApp extends StatelessWidget {
  const InnovationHelloApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter学习打卡',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFB7C5),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Comic Sans MS',
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

class _HelloHomePageState extends State<HelloHomePage> {
  int completedTasks = 0;

  void finishOneTask() {
    setState(() {
      completedTasks += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🎀 创新实验第14周',
          style: TextStyle(
            fontFamily: 'Comic Sans MS',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: const Color(0xFFFFD6E0),
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFF0F3),
                Color(0xFFFFE6EC),
                Color(0xFFF3E8FF),
                Color(0xFFEDE4FF),
              ],
            ),
          ),
          child: Stack(
          children: [
            Positioned(top: 80, left: 20, child: CloudIcon()),
            Positioned(top: 150, right: 30, child: HeartIcon()),
            Positioned(bottom: 200, left: 40, child: BunnyIcon()),
            Positioned(bottom: 150, right: 20, child: CatIcon()),
            Positioned(top: 200, left: 60, child: StarIcon()),
            Positioned(bottom: 300, right: 50, child: CloudIconSmall()),
            
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SparkleIcon(color: Color(0xFFFFB7C5)),
                        Icon(
                          Icons.star,
                          size: 90,
                          color: Color(0xFFFFB7C5),
                        ),
                        SparkleIcon(color: Color(0xFFC4B5FD)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Hello Flutter!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comic Sans MS',
                        letterSpacing: 2,
                        color: Color(0xFFE11D48),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '我已完成第14周入门任务啦～',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF9333EA),
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Comic Sans MS',
                      ),
                    ),
                    const SizedBox(height: 28),
                    
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFB7C5).withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                        border: Border.all(
                          color: Color(0xFFFFB7C5).withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            '姓名：徐冬琴',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE11D48),
                              fontFamily: 'Comic Sans MS',
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '学号后四位：062 | 小组：第5组',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF6B7280),
                              fontFamily: 'Comic Sans MS',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                    
                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFFFE4E9),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFB7C5).withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 3,
                          ),
                        ],
                        border: Border.all(
                          color: Color(0xFFFFB7C5).withOpacity(0.5),
                          width: 3,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '$completedTasks',
                            style: const TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE11D48),
                              fontFamily: 'Comic Sans MS',
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            '学习打卡次数',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF9333EA),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Comic Sans MS',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFC4B5FD).withOpacity(0.15),
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Text(
                        '"每一天的努力，都是未来的礼物！"',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF5B4A67),
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Comic Sans MS',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, size: 24, color: Color(0xFFFFD700)),
                        Icon(Icons.star, size: 24, color: Color(0xFFFFD700)),
                        Icon(Icons.star, size: 24, color: Color(0xFFFFD700)),
                        Icon(Icons.star, size: 24, color: Color(0xFFFFD700)),
                        Icon(Icons.star, size: 24, color: Color(0xFFFFD700)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: finishOneTask,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFFB7C5), Color(0xFFF9A8D4), Color(0xFFC4B5FD)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFFFB7C5).withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.white, size: 26),
              SizedBox(width: 12),
              Text(
                '今日学习打卡',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontFamily: 'Comic Sans MS',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class CloudIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.cloud,
      size: 40,
      color: Color(0xFFFFB7C5),
    );
  }
}

class CloudIconSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.cloud,
      size: 25,
      color: Color(0xFFC4B5FD),
    );
  }
}

class HeartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.favorite,
      size: 28,
      color: Color(0xFFFF6B8A),
    );
  }
}

class StarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star,
      size: 22,
      color: Color(0xFFFFD700),
    );
  }
}

class SparkleIcon extends StatelessWidget {
  final Color color;
  const SparkleIcon({super.key, required this.color});
  
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      size: 35,
      color: color,
    );
  }
}

class BunnyIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      '🐰',
      style: TextStyle(fontSize: 35),
    );
  }
}

class CatIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      '🐱',
      style: TextStyle(fontSize: 32),
    );
  }
}
