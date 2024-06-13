import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

// ignore: avoid-importing-entrypoint-exports
import '../../../mix.dart';

part 'gradient_dto.g.dart';

/// Represents a base Data transfer object of [Gradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[Gradient]
@immutable
sealed class GradientDto<T extends Gradient> extends Dto<T> {
  final List<double>? stops;
  final List<ColorDto>? colors;
  final GradientTransform? transform;
  const GradientDto({this.stops, this.colors, this.transform});

  S _exhaustiveMerge<F extends GradientDto, S extends GradientDto>(F a, S b) {
    if (a.runtimeType == b.runtimeType) return a.merge(b);

    return switch (b) {
      (LinearGradientDto g) => asLinearGradient().merge(g) as S,
      (RadialGradientDto g) => asRadialGradient().merge(g) as S,
      (SweepGradientDto g) => asSweepGradient().merge(g) as S,
    };
  }

  GradientDto tryToMerge(GradientDto? other) {
    if (other == null) return this;

    return runtimeType == other.runtimeType
        ? merge(other)
        : _exhaustiveMerge(this, other);
  }

  LinearGradientDto asLinearGradient() {
    return LinearGradientDto(
      transform: transform,
      colors: colors,
      stops: stops,
    );
  }

  RadialGradientDto asRadialGradient() {
    return RadialGradientDto(
      transform: transform,
      colors: colors,
      stops: stops,
    );
  }

  SweepGradientDto asSweepGradient() {
    return SweepGradientDto(
      transform: transform,
      colors: colors,
      stops: stops,
    );
  }
}

/// Represents a Data transfer object of [LinearGradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[LinearGradient]

@MixableDto()
final class LinearGradientDto extends GradientDto<LinearGradient>
    with _$LinearGradientDto {
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final TileMode? tileMode;

  const LinearGradientDto({
    this.begin,
    this.end,
    this.tileMode,
    super.transform,
    super.colors,
    super.stops,
  });
}

/// Represents a Data transfer object of [RadialGradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[RadialGradient]
@MixableDto()
final class RadialGradientDto extends GradientDto<RadialGradient>
    with _$RadialGradientDto {
  final AlignmentGeometry? center;
  final double? radius;

  // focalRadius
  final TileMode? tileMode;
  final AlignmentGeometry? focal;

  final double? focalRadius;

  const RadialGradientDto({
    this.center,
    this.radius,
    this.tileMode,
    this.focal,
    this.focalRadius,
    super.transform,
    super.colors,
    super.stops,
  });
}

/// Represents a Data transfer object of [SweepGradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[SweepGradient]

@MixableDto()
final class SweepGradientDto extends GradientDto<SweepGradient>
    with _$SweepGradientDto {
  final AlignmentGeometry? center;
  final double? startAngle;
  final double? endAngle;

  final TileMode? tileMode;

  const SweepGradientDto({
    this.center,
    this.startAngle,
    this.endAngle,
    this.tileMode,
    super.transform,
    super.colors,
    super.stops,
  });
}

extension GradientExt on Gradient {
  // toDto
  GradientDto toDto() {
    if (this is LinearGradient) return (this as LinearGradient).toDto();
    if (this is RadialGradient) return (this as RadialGradient).toDto();
    if (this is SweepGradient) return (this as SweepGradient).toDto();

    throw UnimplementedError();
  }
}

/// A utility class for working with gradients.
///
/// This class provides convenient methods for creating different types of gradients,
/// such as radial gradients, linear gradients, and sweep gradients.
/// It also provides a method for converting a generic [Gradient] object to a specific type [T].
///
/// Accepts a [builder] function that takes a [GradientDto] and returns an object of type [T].
final class GradientUtility<T extends Attribute>
    extends MixUtility<T, GradientDto> {
  late final radial = RadialGradientUtility(builder);
  late final linear = LinearGradientUtility(builder);
  late final sweep = SweepGradientUtility(builder);

  GradientUtility(super.builder);

  /// Converts a [Gradient] object to the specific type [T].
  ///
  /// Throws an [UnimplementedError] if the given gradient type is not supported.
  T as(Gradient gradient) {
    if (gradient is RadialGradient) {
      return radial.as(gradient);
    } else if (gradient is LinearGradient) {
      return linear.as(gradient);
    } else if (gradient is SweepGradient) {
      return sweep.as(gradient);
    }
    throw UnimplementedError(
      'Cannot create $T from gradient of type ${gradient.runtimeType}',
    );
  }
}
