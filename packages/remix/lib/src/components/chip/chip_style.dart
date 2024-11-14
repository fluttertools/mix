part of 'chip.dart';

class ChipStyle extends SpecStyle<ChipSpecUtility> {
  const ChipStyle();

  @override
  Style makeStyle(SpecConfiguration<ChipSpecUtility> spec) {
    final $ = spec.utilities;

    final iconStyle = [
      $.icon.chain
        ..size(18)
        ..color.black(),
    ];

    final labelStyle = [
      $.label.chain
        ..textHeightBehavior.heightToFirstAscent.off()
        ..textHeightBehavior.heightToLastDescent.on()
        ..style.fontSize(14)
        ..style.height(1.5)
        ..style.color.black()
        ..style.fontWeight.w600(),
    ];

    final flexContainerStyle = [
      $.flexContainer.chain
        ..borderRadius(6)
        ..color.white()
        ..border.all.width(1)
        ..border.color.grey.shade200()
        ..padding.vertical(8)
        ..padding.horizontal(12)
        ..flex.mainAxisAlignment.center()
        ..flex.crossAxisAlignment.center()
        ..flex.mainAxisSize.min()
        ..flex.gap(8),
      spec.on.selected($.flexContainer.color.grey.shade200()),
    ];

    final disabledStyle = spec.on.disabled(
      $.label.style.color.grey.shade600(),
      $.icon.color.grey.shade600(),
      spec.on.selected($.flexContainer.color.grey.shade300()),
    );

    return Style.create([
      ...flexContainerStyle,
      ...iconStyle,
      ...labelStyle,
      ...flexContainerStyle,
      disabledStyle,
    ]);
  }
}

class ChipDarkStyle extends ChipStyle {
  const ChipDarkStyle();

  @override
  Style makeStyle(SpecConfiguration<ChipSpecUtility> spec) {
    final $ = spec.utilities;

    final flexContainerStyle = [
      $.flexContainer.chain
        ..border.all.color.grey.shade900()
        ..color.black(),
      $.icon.color.white(),
      spec.on.selected($.flexContainer.color.grey.shade900()),
      spec.on.disabled(
        $.label.style.color.grey.shade600(),
        $.icon.color.grey.shade600(),
        $.flexContainer.color.black(),
        spec.on.selected($.flexContainer.color.grey.shade900()),
      ),
    ];

    final labelStyle = $.label.chain..style.color.white();

    return Style.create([
      super.makeStyle(spec).call(),
      ...flexContainerStyle,
      labelStyle,
    ]);
  }
}
