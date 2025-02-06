import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remix/remix.dart';

void main() {
  group('Scaffold', () {
    testWidgets('renders header and body', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(800, 600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        RemixApp(
          home: Scaffold(
            header: const SizedBox(
              key: Key('header'),
              height: 100,
              child: Center(child: Text('Header')),
            ),
            body: Container(
              key: const Key('body'),
              child: const Center(child: Text('Body')),
            ),
          ),
        ),
      );

      final headerFinder = find.byKey(const Key('header'));
      expect(headerFinder, findsOneWidget);

      final Size headerSize = tester.getSize(headerFinder);
      expect(headerSize, const Size(800, 100));

      final bodyFinder = find.byKey(const Key('body'));
      expect(bodyFinder, findsOneWidget);

      final Size bodySize = tester.getSize(bodyFinder);
      expect(bodySize, const Size(800, 500));

      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Body'), findsOneWidget);
    });

    testWidgets('ListView scrolls correctly', (WidgetTester tester) async {
      // Build our custom scaffold with a ListView as its body.
      await tester.pumpWidget(
        RemixApp(
          home: Scaffold(
            header: const SizedBox(
              key: Key('header'),
              height: 100,
              child: Center(child: Text('Header')),
            ),
            body: ListView.builder(
              key: const Key('listView'),
              itemCount: 300,
              itemBuilder: (context, index) {
                return Text('Item $index');
              },
            ),
          ),
        ),
      );

      // Verify the first item is visible.
      expect(find.text('Item 0'), findsOneWidget);

      // Scroll down the ListView.
      await tester.drag(
          find.byKey(const Key('listView')), const Offset(0, -700));
      await tester.pumpAndSettle();

      // Verify that an item further down is now visible.
      expect(find.text('Item 80'), findsOneWidget);
    });

    testWidgets('PageView swipes correctly', (WidgetTester tester) async {
      // Build our custom scaffold with a PageView as its body.
      await tester.pumpWidget(
        RemixApp(
          home: Scaffold(
            header: Container(
              key: const Key('header'),
              height: 100,
              color: m.Colors.green,
              child: const Center(child: Text('Header')),
            ),
            body: PageView(
              key: const Key('pageView'),
              children: [
                Container(
                  key: const Key('page_1'),
                  color: m.Colors.red,
                  child: const Center(child: Text('Page 1')),
                ),
                Container(
                  key: const Key('page_2'),
                  color: m.Colors.blue,
                  child: const Center(child: Text('Page 2')),
                ),
                Container(
                  key: const Key('page_3'),
                  color: m.Colors.yellow,
                  child: const Center(child: Text('Page 3')),
                ),
              ],
            ),
          ),
        ),
      );

      // Initially, Page 1 should be visible.
      expect(find.text('Page 1'), findsOneWidget);

      // Swipe left to show Page 2.
      await tester.drag(
          find.byKey(const Key('pageView')), const Offset(-400, 0));
      await tester.pumpAndSettle();
      expect(find.text('Page 2'), findsOneWidget);

      // Swipe left again to show Page 3.
      await tester.drag(
          find.byKey(const Key('pageView')), const Offset(-400, 0));
      await tester.pumpAndSettle();
      expect(find.text('Page 3'), findsOneWidget);
    });

    testWidgets('responsive layout test', (WidgetTester tester) async {
      // For example, set a custom window size.
      tester.view.physicalSize = const Size(200, 200);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        RemixApp(
          home: Scaffold(
            header: Container(
              key: const Key('header'),
              height: 100,
              color: m.Colors.green,
              child: const Center(child: Text('Header')),
            ),
            body: Container(
              key: const Key('body'),
              color: m.Colors.blue,
              child: const Center(child: Text('Body')),
            ),
          ),
        ),
      );

      // Verify that the Scaffold adapts to the window size.
      final Size scaffoldSize = tester.getSize(find.byType(Scaffold));
      expect(scaffoldSize.width, 200);
      expect(scaffoldSize.height, 200);

      // Verify header height is exactly 100
      final Size headerSize = tester.getSize(find.byKey(const Key('header')));
      expect(headerSize.height, 100);
    });
  });
}
