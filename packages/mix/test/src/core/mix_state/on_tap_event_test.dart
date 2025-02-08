import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/context_finder.dart';
import '../../../helpers/testing_utils.dart';

extension _WidgetTesterX on WidgetTester {
  OnTapEventProvider findPressEventWidget() {
    return findWidgetOfType();
  }
}

class _Counter {
  int value = 0;

  void increment() {
    value++;
  }
}

Future<TestGesture> _setupPressableWidgetWithInitialTests(
  WidgetTester tester,
  _Counter onPressCounter, [
  _Counter? onLongPressCounter,
]) async {
  await tester.pumpMaterialApp(
    PressableBox(
      onLongPress: () {
        onLongPressCounter?.increment();
      },
      onPress: onPressCounter.increment,
      child: Text('$onPressCounter'),
    ),
  );

  // Initial state should be idle
  expect(tester.findPressEventWidget().event, isNull);

  // Press down on the PressableBox
  final gesture = await tester.press(find.byType(PressableBox));

  await tester.pumpAndSettle();
  expect(tester.findPressEventWidget().event, OnTapEvent.down);

  return gesture;
}

void main() {
  testWidgets(
    'Pressable should transition through (onTapDown and onTapUp) states correctly',
    (tester) async {
      final counter = _Counter();
      final gesture =
          await _setupPressableWidgetWithInitialTests(tester, counter);

      // Release the press
      await gesture.up();
      await tester.pumpAndSettle();
      expect(tester.findPressEventWidget().event, OnTapEvent.up);

      expect(counter.value, equals(1));

      await tester.pump(const Duration(milliseconds: 300));
      expect(tester.findPressEventWidget().event, isNull);
    },
  );

  testWidgets(
    'Pressable should transition through (onTapDown and cancel) states correctly',
    (tester) async {
      final counter = _Counter();
      final gesture =
          await _setupPressableWidgetWithInitialTests(tester, counter);

      // Cancel the press
      await gesture.cancel();
      await tester.pumpAndSettle();

      await tester.pump(const Duration(milliseconds: 300));
      expect(tester.findPressEventWidget().event, isNull);

      expect(counter.value, equals(0));
    },
  );

  testWidgets(
    'Pressable should handle long press state transitions and maintain correct state',
    (tester) async {
      final counter = _Counter();
      final longPressCounter = _Counter();

      await _setupPressableWidgetWithInitialTests(
        tester,
        counter,
        longPressCounter,
      );

      // Long press on the PressableBox
      await tester.longPress(find.byType(PressableBox));
      await tester.pumpAndSettle();

      expect(tester.findPressEventWidget().event, OnTapEvent.down);

      BuildContext context = tester.element(find.byType(Text));
      final isLongPressed = $on.longPress.when(context);
      final isPressed = $on.press.when(context);

      expect(isLongPressed, isTrue);
      expect(isPressed, isTrue);
      expect(counter.value, equals(0));
      expect(longPressCounter.value, equals(1));
    },
  );
}
