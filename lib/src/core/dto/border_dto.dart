import 'package:flutter/material.dart';

import '../../attributes/data_attributes.dart';
import '../../factory/mix_provider_data.dart';
import '../attribute.dart';
import 'color_dto.dart';

class BorderRadiusGeometryData extends Data<BorderRadiusGeometry> {
  final Radius? topLeft;
  final Radius? topRight;
  final Radius? bottomLeft;
  final Radius? bottomRight;

// Directional values
  final Radius? topStart;
  final Radius? topEnd;
  final Radius? bottomStart;
  final Radius? bottomEnd;

  final bool _isDirectional;

  const BorderRadiusGeometryData({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.topStart,
    this.topEnd,
    this.bottomStart,
    this.bottomEnd,
    bool isDirectional = false,
  }) : _isDirectional = isDirectional;

  const BorderRadiusGeometryData.all(
    Radius radius, {
    bool isDirectional = false,
  })  : _isDirectional = isDirectional,
        topLeft = radius,
        topRight = radius,
        bottomLeft = radius,
        bottomRight = radius,
        topStart = radius,
        topEnd = radius,
        bottomStart = radius,
        bottomEnd = radius;

  BorderRadiusGeometryData.horizontal({
    Radius? leftStart,
    Radius? rightEnd,
    bool isDirectional = false,
  })  : _isDirectional = isDirectional,
        topLeft = leftStart,
        topRight = rightEnd,
        bottomLeft = leftStart,
        bottomRight = rightEnd,
        topStart = leftStart,
        topEnd = rightEnd,
        bottomStart = leftStart,
        bottomEnd = rightEnd;

  BorderRadiusGeometryData.vertical({
    Radius? top,
    Radius? bottom,
    bool isDirectional = false,
  })  : _isDirectional = isDirectional,
        topLeft = top,
        topRight = top,
        bottomLeft = bottom,
        bottomRight = bottom,
        topStart = top,
        topEnd = top,
        bottomStart = bottom,
        bottomEnd = bottom;

  BorderRadiusGeometryData.circular(
    double radius, {
    bool isDirectional = false,
  })  : _isDirectional = isDirectional,
        topLeft = Radius.circular(radius),
        topRight = Radius.circular(radius),
        bottomLeft = Radius.circular(radius),
        bottomRight = Radius.circular(radius),
        topStart = Radius.circular(radius),
        topEnd = Radius.circular(radius),
        bottomStart = Radius.circular(radius),
        bottomEnd = Radius.circular(radius);

  bool get isDirectional => _isDirectional;

  BorderRadiusGeometryData toDirectional() => copyWith(isDirectional: true);

  BorderRadiusGeometryAttribute toAttribute() =>
      BorderRadiusGeometryAttribute(this);

  BorderRadiusGeometryData copyWith({
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
    bool? isDirectional,
  }) {
    return BorderRadiusGeometryData(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
      topStart: topStart ?? this.topStart,
      topEnd: topEnd ?? this.topEnd,
      bottomStart: bottomStart ?? this.bottomStart,
      bottomEnd: bottomEnd ?? this.bottomEnd,
      isDirectional: isDirectional ?? _isDirectional,
    );
  }

  @override
  BorderRadiusGeometryData merge(BorderRadiusGeometryData? other) {
    if (other == null) return this;
    if (other._isDirectional != _isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional border radius attributes",
      );
    }

    return BorderRadiusGeometryData(
      topLeft: other.topLeft ?? topLeft,
      topRight: other.topRight ?? topRight,
      bottomLeft: other.bottomLeft ?? bottomLeft,
      bottomRight: other.bottomRight ?? bottomRight,
      topStart: other.topStart ?? topStart,
      topEnd: other.topEnd ?? topEnd,
      bottomStart: other.bottomStart ?? bottomStart,
      bottomEnd: other.bottomEnd ?? bottomEnd,
      isDirectional: other._isDirectional,
    );
  }

  @override
  BorderRadiusGeometry resolve(MixData mix) {
    return _isDirectional
        ? BorderRadiusDirectional.only(
            topStart: topStart ?? Radius.zero,
            topEnd: topEnd ?? Radius.zero,
            bottomStart: bottomStart ?? Radius.zero,
            bottomEnd: bottomEnd ?? Radius.zero,
          )
        : BorderRadius.only(
            topLeft: topLeft ?? Radius.zero,
            topRight: topRight ?? Radius.zero,
            bottomLeft: bottomLeft ?? Radius.zero,
            bottomRight: bottomRight ?? Radius.zero,
          );
  }

  @override
  get props => [
        topLeft,
        topRight,
        bottomLeft,
        bottomRight,
        topStart,
        topEnd,
        bottomStart,
        bottomEnd,
        _isDirectional,
      ];
}

class BoxBorderData extends Data<BoxBorder> {
  final BorderSideData? top;
  final BorderSideData? start;
  final BorderSideData? end;
  final BorderSideData? bottom;
  final BorderSideData? left;
  final BorderSideData? right;

  final bool _isDirectional;

  const BoxBorderData({
    this.top,
    this.start,
    this.end,
    this.bottom,
    this.left,
    this.right,
    bool isDirectional = false,
  }) : _isDirectional = isDirectional;

  const BoxBorderData.fromBorderSide(
    BorderSideData side, {
    bool isDirectional = false,
  })  : _isDirectional = isDirectional,
        top = side,
        right = side,
        bottom = side,
        left = side,
        start = side,
        end = side;

  const BoxBorderData.all(BorderSideData side, {bool isDirectional = false})
      : _isDirectional = isDirectional,
        top = side,
        right = side,
        bottom = side,
        left = side,
        start = side,
        end = side;

  const BoxBorderData.symmetric({
    BorderSideData? vertical,
    BorderSideData? horizontal,
    bool isDirectional = false,
  })  : _isDirectional = isDirectional,
        top = horizontal,
        right = vertical,
        bottom = horizontal,
        left = vertical,
        start = vertical,
        end = vertical;

  bool get isDirectional => _isDirectional;

  BoxBorderAttribute toAttribute() => BoxBorderAttribute(this);

  @override
  BoxBorderData merge(BoxBorderData? other) {
    if (other == null) return this;

    if (other._isDirectional != _isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional box border attributes",
      );
    }

    return BoxBorderData(
      top: other.top ?? top,
      start: other.start ?? start,
      end: other.end ?? end,
      bottom: other.bottom ?? bottom,
      left: other.left ?? left,
      right: other.right ?? right,
    );
  }

  @override
  BoxBorder resolve(MixData mix) {
    return _isDirectional
        ? BorderDirectional(
            top: top?.resolve(mix) ?? BorderSide.none,
            start: start?.resolve(mix) ?? BorderSide.none,
            end: end?.resolve(mix) ?? BorderSide.none,
            bottom: bottom?.resolve(mix) ?? BorderSide.none,
          )
        : Border(
            top: top?.resolve(mix) ?? BorderSide.none,
            right: right?.resolve(mix) ?? BorderSide.none,
            bottom: bottom?.resolve(mix) ?? BorderSide.none,
            left: left?.resolve(mix) ?? BorderSide.none,
          );
  }

  @override
  get props => [top, start, end, bottom, left, right, _isDirectional];
}

class BorderSideData extends Data<BorderSide> {
  final ColorData? color;
  final double? width;
  final BorderStyle? style;
  final double? strokeAlign;

  const BorderSideData({
    this.color,
    this.strokeAlign,
    this.style,
    this.width,
  });

  BorderSideData copyWith({
    ColorData? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return BorderSideData(
      color: color ?? this.color,
      strokeAlign: strokeAlign ?? this.strokeAlign,
      style: style ?? this.style,
      width: width ?? this.width,
    );
  }

  @override
  BorderSideData merge(BorderSideData? other) {
    if (other == null) return this;

    return BorderSideData(
      color: color?.merge(other.color) ?? other.color,
      strokeAlign: other.strokeAlign ?? strokeAlign,
      style: other.style ?? style,
      width: other.width ?? width,
    );
  }

  @override
  BorderSide resolve(MixData mix) {
    const defaultValue = BorderSide();

    return BorderSide(
      color: color?.resolve(mix) ?? defaultValue.color,
      width: width ?? defaultValue.width,
      style: style ?? defaultValue.style,
      strokeAlign: strokeAlign ?? defaultValue.strokeAlign,
    );
  }

  @override
  get props => [color, width, style, strokeAlign];
}
