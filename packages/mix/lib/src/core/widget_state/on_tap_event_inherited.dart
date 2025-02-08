import 'package:flutter/widgets.dart';

enum OnTapEvent {
  up,
  down;
}

class OnTapEventProvider extends InheritedWidget {
  const OnTapEventProvider(this.event, {super.key, required super.child});

  static OnTapEventProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  final OnTapEvent? event;

  @override
  bool updateShouldNotify(OnTapEventProvider oldWidget) {
    return event != oldWidget.event;
  }
}
