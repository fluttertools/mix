import 'package:flutter/material.dart';

import '../../../mix.dart';
import '../../helpers/compare_mixin/compare_mixin.dart';

class StyledContainerDescriptor with CompareMixin {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;

  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Matrix4? transform;
  final Gradient? gradient;

  // Constraints.
  final double? maxHeight;

  final double? minHeight;
  final double? maxWidth;
  final double? minWidth;
  final BoxShape? shape;

  final Color? _color;
  const StyledContainerDescriptor({
    Color? color,
    this.alignment,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.maxHeight,
    this.minHeight,
    this.maxWidth,
    this.minWidth,
    this.shape,
    this.transform,
    this.gradient,
  }) : _color = color;

  factory StyledContainerDescriptor.fromContext(MixData mix) {
    final attributes = mix.attributeOf<StyledContainerAttributes>();

    return StyledContainerDescriptor(
      color: attributes?.color?.resolve(mix),
      alignment: attributes?.alignment,
      padding: attributes?.padding?.resolve(mix),
      margin: attributes?.margin?.resolve(mix),
      width: attributes?.width,
      height: attributes?.height,
      border: attributes?.border?.resolve(mix),
      borderRadius: attributes?.borderRadius?.resolve(mix),
      boxShadow: attributes?.boxShadow?.map((e) => e.resolve(mix)).toList(),
      maxHeight: attributes?.maxHeight,
      minHeight: attributes?.minHeight,
      maxWidth: attributes?.maxWidth,
      minWidth: attributes?.minWidth,
      shape: attributes?.shape,
      transform: attributes?.transform,
      gradient: attributes?.gradient,
    );
  }
  // Color is null decoration exists, color gets added to decoration.
  Color? get color => decoration == null ? _color : null;

  BoxDecoration? get decoration {
    BoxDecoration? boxDecoration;
    if (border != null ||
        borderRadius != null ||
        boxShadow != null ||
        shape != null ||
        gradient != null) {
      boxDecoration = BoxDecoration(
        color: _color,
        border: border,
        boxShadow: boxShadow,
        gradient: gradient,
      );

      // Shape is added separately because it doesn't accept a nullable value.
      if (shape != null) {
        boxDecoration = boxDecoration.copyWith(shape: shape);
      }

      // Border radius is added if no shape exists.
      if (shape == null && borderRadius != null) {
        boxDecoration = boxDecoration.copyWith(borderRadius: borderRadius);
      }

      return boxDecoration;
    }

    return null;
  }

  BoxConstraints? get constraints {
    BoxConstraints? constraints;

    if (minWidth != null ||
        maxWidth != null ||
        minHeight != null ||
        maxHeight != null) {
      constraints = BoxConstraints(
        minWidth: minWidth ?? 0.0,
        maxWidth: maxWidth ?? double.infinity,
        minHeight: minHeight ?? 0.0,
        maxHeight: maxHeight ?? double.infinity,
      );
    }

    return constraints;
  }

  @override
  get props => [
        _color,
        alignment,
        padding,
        margin,
        width,
        height,
        border,
        borderRadius,
        boxShadow,
        maxHeight,
        minHeight,
        maxWidth,
        minWidth,
        shape,
        transform,
        gradient,
      ];
}
