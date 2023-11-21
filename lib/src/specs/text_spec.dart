import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../attributes/scalar_attribute.dart';
import '../attributes/strut_style_attribute.dart';
import '../attributes/text_style_attribute.dart';
import '../directives/directive.dart';
import '../factory/mix_provider_data.dart';

class TextRecipe extends StyleRecipe<TextRecipe> {
  final TextOverflow? overflow;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final int? maxLines;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final TextStyle? style;
  final TextDirection? textDirection;
  final bool? softWrap;

  final List<TextDirective> directives;
  const TextRecipe({
    required this.overflow,
    this.strutStyle,
    this.textAlign,
    this.textScaleFactor,
    this.maxLines,
    this.style,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.textDirection,
    this.softWrap,
    this.directives = const [],
  });

  static TextRecipe resolve(MixData mix) {
    return TextRecipe(
      overflow: mix.attributeOfType<TextOverflowAttribute>()?.resolve(mix),
      strutStyle: mix.attributeOfType<StrutStyleAttribute>()?.resolve(mix),
      textAlign: mix.attributeOfType<TextAlignAttribute>()?.resolve(mix),
      textScaleFactor:
          mix.attributeOfType<TextScaleFactorAttribute>()?.resolve(mix),
      maxLines: mix.attributeOfType<MaxLinesAttribute>()?.resolve(mix),
      style: mix.attributeOfType<TextStyleAttribute>()?.resolve(mix),
      textWidthBasis:
          mix.attributeOfType<TextWidthBasisAttribute>()?.resolve(mix),
      textHeightBehavior:
          mix.attributeOfType<TextHeightBehaviorAttribute>()?.resolve(mix),
      textDirection:
          mix.attributeOfType<TextDirectionAttribute>()?.resolve(mix),
      softWrap: mix.attributeOfType<SoftWrapAttribute>()?.resolve(mix),
      directives: mix.attributeOfType<TextDirectiveAttribute>()?.resolve(mix),
    );
  }

  String applyTextDirectives(String? text) {
    if (text == null) return '';

    String modifiedText = text;
    for (final directive in directives) {
      modifiedText = directive.modify(modifiedText);
    }

    return modifiedText;
  }

  @override
  TextRecipe lerp(TextRecipe other, double t) {
    // Define a helper method for snapping

    return TextRecipe(
      overflow: snap(overflow, other.overflow, t),
      strutStyle: snap(strutStyle, other.strutStyle, t),
      textAlign: snap(textAlign, other.textAlign, t),
      textScaleFactor:
          genericNumLerp(textScaleFactor, other.textScaleFactor, t),
      maxLines: snap(maxLines, other.maxLines, t),
      style: TextStyle.lerp(style, other.style, t),
      textWidthBasis: snap(textWidthBasis, other.textWidthBasis, t),
      textHeightBehavior: snap(textHeightBehavior, other.textHeightBehavior, t),
      textDirection: snap(textDirection, other.textDirection, t),
      softWrap: snap(softWrap, other.softWrap, t),
      directives: snap(directives, other.directives, t),
    );
  }

  @override
  TextRecipe copyWith({
    bool? softWrap,
    TextOverflow? overflow,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    double? textScaleFactor,
    int? maxLines,
    TextStyle? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    List<TextDirective>? directives,
    TextDirection? textDirection,
  }) {
    return TextRecipe(
      overflow: overflow ?? this.overflow,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      style: style ?? this.style,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      textDirection: textDirection ?? this.textDirection,
      softWrap: softWrap ?? this.softWrap,
      directives: directives ?? this.directives,
    );
  }

  @override
  List<Object?> get props => [
        softWrap,
        overflow,
        strutStyle,
        textAlign,
        textScaleFactor,
        maxLines,
        textWidthBasis,
        textHeightBehavior,
        style,
        directives,
        textDirection,
      ];
}
