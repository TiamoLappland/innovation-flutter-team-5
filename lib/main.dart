import 'package:flutter/material.dart';

// ============================================================
//  创新实验 第14周 — 任务清单 App
//  个人 Flutter HelloWorld 个性化修改
// ============================================================

// --------------- 任务数据模型 ---------------
class TaskItem {
  String title;
  bool isCompleted;

  TaskItem({required this.title, this.isCompleted = false});
}

// --------------- 入口 ---------------
void main() {
  runApp(const InnovationHelloApp());
}

// --------------- MaterialApp 外壳 ---------------
class InnovationHelloApp extends StatelessWidget {
  const InnovationHelloApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '创新实验 Flutter 首页',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const HelloHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// --------------- 主页 ---------------
class HelloHomePage extends StatefulWidget {
  const HelloHomePage({super.key});
  @override
  State<HelloHomePage> createState() => _HelloHomePageState();
}

class _HelloHomePageState extends State<HelloHomePage> {
  // ---- 默认任务（来源于第14周讲义"必做个性化修改"）----
  final List<TaskItem> _tasks = [
    TaskItem(title: '修改 AppBar 标题为个性化标题'),
    TaskItem(title: '修改页面说明文字'),
    TaskItem(title: '修改按钮提示文案'),
    TaskItem(title: '修改计数含义（如"已完成任务次数"）'),
    TaskItem(title: '修改主题颜色'),
    TaskItem(title: '增加姓名、学号后四位或小组编号'),
    TaskItem(title: '增加一个图标'),
    TaskItem(title: '调整文字大小、卡片、间距或页面布局'),
    TaskItem(title: '页面运行无红屏 ✅'),
    TaskItem(title: '点击按钮后数字或文字有可见变化 ✅'),
    TaskItem(title: '保存运行截图'),
    TaskItem(title: 'GitHub 有提交记录'),
  ];

  // ---- 计算属性 ----
  int get _completedCount => _tasks.where((t) => t.isCompleted).length;
  int get _totalCount => _tasks.length;
  double get _progress =>
      _totalCount > 0 ? _completedCount / _totalCount : 0;

  // ---- 切换完成状态 ----
  void _toggleTask(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  // ---- 添加新任务 ----
  void _addTask() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('添加新任务'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '请输入任务内容',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isNotEmpty) {
                setState(() {
                  _tasks.add(TaskItem(title: text));
                });
                Navigator.pop(ctx);
              }
            },
            child: const Text('添加'),
          ),
        ],
      ),
    );
  }

  // ---- 清除已完成任务 ----
  void _clearCompleted() {
    if (_completedCount == 0) return;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('清除已完成任务'),
        content: Text('确定要删除所有已完成的 $_completedCount 条任务吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                _tasks.removeWhere((t) => t.isCompleted);
              });
              Navigator.pop(ctx);
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('确定删除'),
          ),
        ],
      ),
    );
  }

  // ========================================
  //  Build
  // ========================================
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      // ========== AppBar ==========
      appBar: AppBar(
        title: const Text(
          '创新实验 Flutter 首页',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorScheme.inversePrimary,
        actions: [
          if (_completedCount > 0)
            IconButton(
              icon: const Icon(Icons.auto_delete_outlined),
              tooltip: '清除已完成',
              onPressed: _clearCompleted,
            ),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: '添加任务',
            onPressed: _addTask,
          ),
        ],
      ),

      // ========== Body ==========
      body: Column(
        children: [
          // ---- 顶部进度卡片 ----
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withAlpha(100),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                // 火箭图标（修改点①）
                const Icon(Icons.rocket_launch,
                    size: 48, color: Colors.indigo),
                const SizedBox(height: 12),

                // 进度文字
                Text(
                  '已完成任务次数：$_completedCount / $_totalCount',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),

                // 进度条
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: _progress,
                    minHeight: 10,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _progress >= 1.0 ? Colors.green : Colors.indigo,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // 百分比
                Text(
                  '${(_progress * 100).toStringAsFixed(0)}%',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),

          // ---- 页面说明（修改点②）----
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              '我正在完成第 14 周 Flutter 入门任务',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
          ),

          // ---- 个人信息（修改点③）----
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              '👤 姓名：请填写姓名  ｜  小组：第 5 组',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const Divider(indent: 16, endIndent: 16),

          // ---- 任务列表 ----
          Expanded(
            child: _tasks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.task_alt,
                            size: 64, color: colorScheme.outline),
                        const SizedBox(height: 16),
                        Text(
                          '暂无任务，点击右下角 + 添加',
                          style: TextStyle(color: colorScheme.outline),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 80),
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      final task = _tasks[index];
                      final isDone = task.isCompleted;
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        elevation: isDone ? 0 : 1,
                        color: isDone
                            ? colorScheme.surfaceContainerLow
                            : null,
                        child: ListTile(
                          leading: Checkbox(
                            value: isDone,
                            onChanged: (_) => _toggleTask(index),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          title: Text(
                            task.title,
                            style: TextStyle(
                              decoration: isDone
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: isDone
                                  ? colorScheme.outline
                                  : null,
                            ),
                          ),
                          trailing: isDone
                              ? Icon(Icons.check_circle,
                                  color: Colors.green[400], size: 22)
                              : null,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
