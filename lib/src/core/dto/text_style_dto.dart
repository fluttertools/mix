import 'dart:ui';

import 'package:flutter/material.dart';

import '../../attributes/data_attributes.dart';
import '../../factory/exports.dart';
import '../../theme/tokens/text_style_ref.dart';
import '../../utils/helper_util.dart';
import '../attribute.dart';
import 'color_dto.dart';
import 'shadow_dto.dart';

class TextStyleData extends Data<TextStyle> {
  final String? fontFamily;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final ColorData? color;
  final ColorData? backgroundColor;
  final List<ShadowData>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final ColorData? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final Locale? locale;
  final String? debugLabel;
  final double? height;
  final Paint? foreground;
  final Paint? background;
  final double? decorationThickness;
  final List<String>? fontFamilyFallback;

  final TextStyleRef? ref;

  const TextStyleData({
    this.background,
    this.backgroundColor,
    this.color,
    this.debugLabel,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.fontFamily,
    this.fontFamilyFallback,
    this.fontFeatures,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.foreground,
    this.height,
    this.letterSpacing,
    this.locale,
    this.shadows,
    this.ref,
    this.textBaseline,
    this.wordSpacing,
  });

  TextStyleAttribute toAttribute() => TextStyleAttribute(this);

  bool isRef() => ref != null;

  @override
  TextStyleData merge(TextStyleData? other) {
    if (other == null) return this;

    assert(
      ref != null || other.ref != null,
      'Cannot merge two different refs',
    );

    return TextStyleData(
      background: other.background ?? background,
      backgroundColor: other.backgroundColor ?? backgroundColor,
      color: other.color ?? color,
      debugLabel: other.debugLabel ?? debugLabel,
      decoration: other.decoration ?? decoration,
      decorationColor: other.decorationColor ?? decorationColor,
      decorationStyle: other.decorationStyle ?? decorationStyle,
      decorationThickness: other.decorationThickness ?? decorationThickness,
      fontFamily: other.fontFamily ?? fontFamily,
      fontFamilyFallback: [
        ...?fontFamilyFallback,
        ...?other.fontFamilyFallback,
      ],
      fontFeatures: other.fontFeatures ?? fontFeatures,
      fontSize: other.fontSize ?? fontSize,
      fontStyle: other.fontStyle ?? fontStyle,
      fontWeight: other.fontWeight ?? fontWeight,
      foreground: other.foreground ?? foreground,
      height: other.height ?? height,
      letterSpacing: other.letterSpacing ?? letterSpacing,
      locale: other.locale ?? locale,
      shadows: mergeMergeableList(shadows, other.shadows),
      ref: other.ref ?? ref,
      textBaseline: other.textBaseline ?? textBaseline,
      wordSpacing: other.wordSpacing ?? wordSpacing,
    );
  }

  @override
  TextStyle resolve(MixData mix) {
    // Load as DTO for consistent merging behavior.
    final textStyle = ref?.resolve(mix);

    return textStyle ??
        TextStyle(
          color: color?.resolve(mix),
          backgroundColor: backgroundColor?.resolve(mix),
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          textBaseline: textBaseline,
          height: height,
          locale: locale,
          foreground: foreground,
          background: background,
          shadows: shadows?.map((e) => e.resolve(mix)).toList(),
          fontFeatures: fontFeatures,
          decoration: decoration,
          decorationColor: decorationColor?.resolve(mix),
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          debugLabel: debugLabel,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
        );
  }

  @override
  get props => [
        fontFamily,
        fontWeight,
        fontStyle,
        fontSize,
        letterSpacing,
        wordSpacing,
        textBaseline,
        color,
        backgroundColor,
        shadows,
        fontFeatures,
        decoration,
        decorationColor,
        decorationStyle,
        debugLabel,
        locale,
        height,
        background,
        foreground,
        decorationThickness,
        fontFamilyFallback,
        ref,
      ];
}
