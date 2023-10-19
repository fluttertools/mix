import 'dart:ui';

import 'package:flutter/material.dart';

import '../../attributes/alignment/alignment_geometry.attribute.dart';
import '../../attributes/box_constraints/box_constraints.attribute.dart';
import '../../attributes/color/background_color.attribute.dart';
import '../../attributes/decoration/decoration.attribute.dart';
import '../../attributes/enum/clip.attribute.dart';
import '../../attributes/size/height.attribute.dart';
import '../../attributes/size/width.attribute.dart';
import '../../attributes/space/margin_attribute.dart';
import '../../attributes/space/padding.attribute.dart';
import '../../attributes/style_attribute.dart';
import '../../attributes/transform/matrix4.attribute.dart';
import '../../factory/mix_provider_data.dart';

class ContainerAttributes extends SpecAttribute<ContainerSpec> {
  final AlignmentGeometryAttribute? alignment;
  final PaddingAttribute? padding;
  final MarginAttribute? margin;
  final BoxConstraintsAttribute? constraints;
  final DecorationAttribute? decoration;
  final WidthAttribute? width;
  final HeightAttribute? height;
  final Matrix4Attribute? transform;
  final BackgroundColorAttribute? color;
  final ClipAttribute? clipBehavior;

  const ContainerAttributes({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.width,
    this.height,
    this.transform,
    this.color,
    this.clipBehavior,
  });

  @override
  ContainerAttributes merge(ContainerAttributes? other) {
    if (other == null) return this;

    return ContainerAttributes(
      alignment: mergeProp(alignment, other.alignment),
      padding: mergeProp(padding, other.padding),
      margin: mergeProp(margin, other.margin),
      constraints: mergeProp(constraints, other.constraints),
      decoration: mergeProp(decoration, other.decoration),
      width: mergeProp(width, other.width),
      height: mergeProp(height, other.height),
      transform: mergeProp(transform, other.transform),
      color: mergeProp(color, other.color),
      clipBehavior: mergeProp(clipBehavior, other.clipBehavior),
    );
  }

  @override
  ContainerSpec resolve(MixData mix) {
    return ContainerSpec(
      alignment: resolveAttribute(alignment, mix),
      padding: resolveAttribute(padding, mix),
      margin: resolveAttribute(margin, mix),
      constraints: resolveAttribute(constraints, mix),
      decoration: resolveAttribute(decoration, mix),
      width: resolveAttribute(width, mix),
      height: resolveAttribute(height, mix),
      transform: resolveAttribute(transform, mix),
      color: resolveAttribute(color, mix),
      clipBehavior: resolveAttribute(clipBehavior, mix),
    );
  }

  @override
  List<Object?> get props => [
        alignment,
        padding,
        margin,
        constraints,
        decoration,
        width,
        height,
        transform,
        color,
        clipBehavior,
      ];
}

class ContainerSpec extends Spec<ContainerSpec> {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final Matrix4? transform;
  final Color? color;
  final Clip? clipBehavior;

  const ContainerSpec({
    required this.alignment,
    required this.padding,
    required this.margin,
    required this.constraints,
    required this.decoration,
    required this.width,
    required this.height,
    required this.transform,
    required this.color,
    required this.clipBehavior,
  });

  @override
  ContainerSpec copyWith({
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    double? width,
    double? height,
    Matrix4? transform,
    Color? color,
    Clip? clipBehavior,
  }) {
    return ContainerSpec(
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      constraints: constraints ?? this.constraints,
      decoration: decoration ?? this.decoration,
      width: width ?? this.width,
      height: height ?? this.height,
      transform: transform ?? this.transform,
      color: color ?? this.color,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  ContainerSpec lerp(ContainerSpec other, double t) {
    return ContainerSpec(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
      margin: EdgeInsetsGeometry.lerp(margin, other.margin, t),
      constraints: BoxConstraints.lerp(constraints, other.constraints, t),
      decoration: Decoration.lerp(decoration, other.decoration, t),
      width: lerpDouble(width, other.width, t),
      height: lerpDouble(height, other.height, t),
      transform: Matrix4Tween(begin: transform, end: other.transform).lerp(t),
      color: Color.lerp(color, other.color, t),
      clipBehavior: t < 0.5 ? clipBehavior : other.clipBehavior,
    );
  }

  @override
  get props => [
        alignment,
        padding,
        margin,
        constraints,
        decoration,
        width,
        height,
        transform,
        color,
        clipBehavior,
      ];
}
