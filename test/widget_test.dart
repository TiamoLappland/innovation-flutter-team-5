import 'package:flutter_test/flutter_test.dart';

import 'package:hello_world/main.dart';

void main() {
  testWidgets('任务清单首页 smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const InnovationHelloApp());

    // 验证 AppBar 标题
    expect(find.text('创新实验 Flutter 首页'), findsOneWidget);

    // 验证页面说明文字
    expect(find.text('我正在完成第 14 周 Flutter 入门任务'), findsOneWidget);

    // 验证 FAB 文案
    expect(find.text('完成一次打卡'), findsOneWidget);

    // 验证进度文字存在
    expect(find.textContaining('已完成任务次数：'), findsOneWidget);
  });
}
