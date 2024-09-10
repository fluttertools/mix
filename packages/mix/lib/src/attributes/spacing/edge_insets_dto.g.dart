// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edge_insets_dto.dart';

// **************************************************************************
// MixableDtoGenerator
// **************************************************************************

mixin _$EdgeInsetsDto on Dto<EdgeInsets> {
  /// Merges the properties of this [EdgeInsetsDto] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [EdgeInsetsDto] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  EdgeInsetsDto merge(EdgeInsetsDto? other) {
    if (other == null) return _$this;

    return EdgeInsetsDto(
      top: other.top ?? _$this.top,
      bottom: other.bottom ?? _$this.bottom,
      left: other.left ?? _$this.left,
      right: other.right ?? _$this.right,
    );
  }

  /// The list of properties that constitute the state of this [EdgeInsetsDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [EdgeInsetsDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.top,
        _$this.bottom,
        _$this.left,
        _$this.right,
      ];

  EdgeInsetsDto get _$this => this as EdgeInsetsDto;

  /// Converts this [EdgeInsetsDto] to a map.
  ///
  /// The map contains all the fields of this [EdgeInsetsDto].
  Map<String, dynamic> toMap() {
    return {
      "top": _$this.top,
      "bottom": _$this.bottom,
      "left": _$this.left,
      "right": _$this.right,
    };
  }
}

/// Utility class for configuring [EdgeInsets] properties.
///
/// This class provides methods to set individual properties of a [EdgeInsets].
/// Use the methods of this class to configure specific properties of a [EdgeInsets].
class EdgeInsetsUtility<T extends Attribute>
    extends DtoUtility<T, EdgeInsetsDto, EdgeInsets> {
  /// Utility for defining [EdgeInsetsDto.top]
  late final top = DoubleUtility((v) => only(top: v));

  /// Utility for defining [EdgeInsetsDto.bottom]
  late final bottom = DoubleUtility((v) => only(bottom: v));

  /// Utility for defining [EdgeInsetsDto.left]
  late final left = DoubleUtility((v) => only(left: v));

  /// Utility for defining [EdgeInsetsDto.right]
  late final right = DoubleUtility((v) => only(right: v));

  /// Creates an [Attribute] instance using the [EdgeInsetsDto.all] constructor.
  T all(double value) => builder(EdgeInsetsDto.all(value));

  /// Creates an [Attribute] instance using the [EdgeInsetsDto.none] constructor.
  T none() => builder(const EdgeInsetsDto.none());

  EdgeInsetsUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [EdgeInsetsDto] with the specified properties.
  @override
  T only({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return builder(EdgeInsetsDto(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    ));
  }

  T call({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return only(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }
}

extension EdgeInsetsMixExt on EdgeInsets {
  EdgeInsetsDto toDto() {
    return EdgeInsetsDto(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }
}

extension ListEdgeInsetsMixExt on List<EdgeInsets> {
  List<EdgeInsetsDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

mixin _$EdgeInsetsDirectionalDto on Dto<EdgeInsetsDirectional> {
  /// Merges the properties of this [EdgeInsetsDirectionalDto] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [EdgeInsetsDirectionalDto] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  EdgeInsetsDirectionalDto merge(EdgeInsetsDirectionalDto? other) {
    if (other == null) return _$this;

    return EdgeInsetsDirectionalDto(
      top: other.top ?? _$this.top,
      bottom: other.bottom ?? _$this.bottom,
      start: other.start ?? _$this.start,
      end: other.end ?? _$this.end,
    );
  }

  /// The list of properties that constitute the state of this [EdgeInsetsDirectionalDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [EdgeInsetsDirectionalDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.top,
        _$this.bottom,
        _$this.start,
        _$this.end,
      ];

  EdgeInsetsDirectionalDto get _$this => this as EdgeInsetsDirectionalDto;

  /// Converts this [EdgeInsetsDirectionalDto] to a map.
  ///
  /// The map contains all the fields of this [EdgeInsetsDirectionalDto].
  Map<String, dynamic> toMap() {
    return {
      "top": _$this.top,
      "bottom": _$this.bottom,
      "start": _$this.start,
      "end": _$this.end,
    };
  }
}

/// Utility class for configuring [EdgeInsetsDirectional] properties.
///
/// This class provides methods to set individual properties of a [EdgeInsetsDirectional].
/// Use the methods of this class to configure specific properties of a [EdgeInsetsDirectional].
class EdgeInsetsDirectionalUtility<T extends Attribute>
    extends DtoUtility<T, EdgeInsetsDirectionalDto, EdgeInsetsDirectional> {
  /// Utility for defining [EdgeInsetsDirectionalDto.top]
  late final top = DoubleUtility((v) => only(top: v));

  /// Utility for defining [EdgeInsetsDirectionalDto.bottom]
  late final bottom = DoubleUtility((v) => only(bottom: v));

  /// Utility for defining [EdgeInsetsDirectionalDto.start]
  late final start = DoubleUtility((v) => only(start: v));

  /// Utility for defining [EdgeInsetsDirectionalDto.end]
  late final end = DoubleUtility((v) => only(end: v));

  /// Creates an [Attribute] instance using the [EdgeInsetsDirectionalDto.all] constructor.
  T all(double value) => builder(EdgeInsetsDirectionalDto.all(value));

  /// Creates an [Attribute] instance using the [EdgeInsetsDirectionalDto.none] constructor.
  T none() => builder(const EdgeInsetsDirectionalDto.none());

  EdgeInsetsDirectionalUtility(super.builder)
      : super(valueToDto: (v) => v.toDto());

  /// Returns a new [EdgeInsetsDirectionalDto] with the specified properties.
  @override
  T only({
    double? top,
    double? bottom,
    double? start,
    double? end,
  }) {
    return builder(EdgeInsetsDirectionalDto(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
    ));
  }

  T call({
    double? top,
    double? bottom,
    double? start,
    double? end,
  }) {
    return only(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
    );
  }
}

extension EdgeInsetsDirectionalMixExt on EdgeInsetsDirectional {
  EdgeInsetsDirectionalDto toDto() {
    return EdgeInsetsDirectionalDto(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
    );
  }
}

extension ListEdgeInsetsDirectionalMixExt on List<EdgeInsetsDirectional> {
  List<EdgeInsetsDirectionalDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
