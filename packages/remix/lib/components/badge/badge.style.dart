// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/badge/badge.variants.dart';
import 'package:remix/components/badge/badge_spec.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _badge = BadgeSpecUtility.self;
final _container = _badge.container;
final _label = _badge.label;

Style get _baseStyle => Style(
      _container.borderRadius(99),
      _label.style.fontWeight(FontWeight.w500),
    );

Style get _solidVariant => Style(
      _container.color($rx.accent9()),
      _label.style.color($rx.neutral1()),
    );

Style get _softVariant => Style(
      _container.color($rx.accent3A()),
      _label.style.color($rx.accent11A()),
    );

Style get _surfaceVariant => Style(
      _container.color($rx.accent2A()),
      _label.style.color($rx.accent11A()),
    );

Style get _outlineVariant => Style(
      _container.color(Colors.transparent),
      _container.border.width(1),
      _container.border.color($rx.accent8A()),
      _label.style.color($rx.accent11A()),
    );

final _smallVariant = Style(
  _container.padding.vertical($rx.space1()),
  _container.padding.horizontal($rx.space2()),
  _label.style.as($rx.text1()),
);

final _mediumVariant = Style(
  _container.padding.vertical($rx.space1()),
  _container.padding.horizontal($rx.space3()),
  _label.style.as($rx.text2()),
);

final _largeVariant = Style(
  _container.padding.vertical($rx.space2()),
  _container.padding.horizontal($rx.space4()),
  _label.style.as($rx.text3()),
);

Style buildDefaultBadgeStyle() {
  return Style(
    _baseStyle(),

    /// Size Variants
    BadgeSize.small(_smallVariant()),
    BadgeSize.medium(_mediumVariant()),
    BadgeSize.large(_largeVariant()),

    // Type variants
    BadgeVariant.solid(_solidVariant()),
    BadgeVariant.soft(_softVariant()),
    BadgeVariant.surface(_surfaceVariant()),
    BadgeVariant.outline(_outlineVariant()),
  );
}
