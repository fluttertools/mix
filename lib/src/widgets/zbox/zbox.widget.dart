import 'package:flutter/widgets.dart';

import '../../attributes/common/common.props.dart';
import '../../mixer/mix_factory.dart';
import '../../variants/variant.dart';
import '../box/box.props.dart';
import '../box/box.widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'zbox.props.dart';

// ZBox widget, a custom Box widget that has a Stack as a child. It combines
// the features of a Box widget with a Stack widget, allowing developers to
// create complex and responsive layouts.
class ZBox extends MixWidget {
  final List<Widget> children;

  const ZBox({
    MixFactory? mix,
    Key? key,
    bool? inherit,
    List<Variant>? variants,
    this.children = const <Widget>[],
  }) : super(
          mix,
          variants: variants,
          inherit: inherit,
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return MixContextBuilder(
      mix: mix,
      inherit: inherit,
      variants: variants,
      builder: (context, mixContext) {
        final zProps = ZBoxProps.fromContext(context);
        final boxProps = BoxProps.fromContext(context);
        final commonProps = CommonProps.fromContext(context);

        return BoxMixedWidget(
          boxProps: boxProps,
          commonProps: commonProps,
          child: Stack(
            alignment: zProps.alignment,
            clipBehavior: zProps.clipBehavior,
            fit: zProps.fit,
            children: children,
          ),
        );
      },
    );
  }
}
