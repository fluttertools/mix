import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../attributes/alignment_attribute.dart';
import '../../attributes/clip_behavior_attribute.dart';
import '../../attributes/constraints/constraints_attribute.dart';
import '../../attributes/decoration/decoration_attribute.dart';
import '../../attributes/spacing_attribute.dart';
import '../../attributes/transform_attribute.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'container_mixture.dart';

class ContainerMixtureAttribute extends ResolvableAttribute<ContainerMixture> {
  final AlignmentGeometryAttribute? alignment;
  final PaddingAttribute? padding;
  final MarginAttribute? margin;
  final BoxConstraintsAttribute? constraints;
  final DecorationAttribute? decoration;
  final TransformAttribute? transform;
  final ClipBehaviorAttribute? clipBehavior;

  const ContainerMixtureAttribute({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.transform,
    this.clipBehavior,
  });

  @override
  ContainerMixture resolve(MixData mix) {
    return ContainerMixture(
      alignment: getValue<AlignmentGeometryAttribute, AlignmentGeometry>(
        mix,
        alignment,
      ),
      padding: getResolved<PaddingAttribute, EdgeInsetsGeometry>(mix, padding),
      margin: getResolved<MarginAttribute, EdgeInsetsGeometry>(mix, margin),
      constraints: getResolved<BoxConstraintsAttribute, BoxConstraints>(
        mix,
        constraints,
      ),
      decoration: getResolved<DecorationAttribute, Decoration>(
        mix,
        decoration,
      ),
      transform: getValue<TransformAttribute, Matrix4>(mix, transform),
      clipBehavior: getValue<ClipBehaviorAttribute, Clip>(mix, clipBehavior),
    );
  }

  @override
  ContainerMixtureAttribute merge(covariant ContainerMixtureAttribute? other) {
    if (other == null) return this;

    return ContainerMixtureAttribute(
      alignment: alignment ?? other.alignment,
      padding: padding ?? other.padding,
      margin: margin ?? other.margin,
      constraints: constraints ?? other.constraints,
      decoration: decoration ?? other.decoration,
      transform: transform ?? other.transform,
      clipBehavior: clipBehavior ?? other.clipBehavior,
    );
  }

  @override
  List<Object?> get props => [
        alignment,
        padding,
        margin,
        constraints,
        decoration,
        transform,
        clipBehavior,
      ];
}
