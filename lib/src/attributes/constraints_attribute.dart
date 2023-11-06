import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

@immutable
abstract class ConstraintsAttribute<T extends Constraints>
    extends VisualAttribute<T> {
  const ConstraintsAttribute();

  @override
  ConstraintsAttribute merge(covariant ConstraintsAttribute? other);

  @override
  T resolve(MixData mix);
}

@immutable
class BoxConstraintsAttribute extends ConstraintsAttribute<BoxConstraints> {
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  const BoxConstraintsAttribute({
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });

  @override
  BoxConstraintsAttribute merge(covariant BoxConstraintsAttribute? other) {
    if (other == null) return this;

    return BoxConstraintsAttribute(
      minWidth: other.minWidth ?? minWidth,
      maxWidth: other.maxWidth ?? maxWidth,
      minHeight: other.minHeight ?? minHeight,
      maxHeight: other.maxHeight ?? maxHeight,
    );
  }

  @override
  BoxConstraints resolve(MixData mix) {
    return BoxConstraints(
      minWidth: minWidth ?? 0,
      maxWidth: maxWidth ?? double.infinity,
      minHeight: minHeight ?? 0,
      maxHeight: maxHeight ?? double.infinity,
    );
  }

  @override
  get props => [minWidth, maxWidth, minHeight, maxHeight];
}
