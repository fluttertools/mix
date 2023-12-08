import 'package:flutter/material.dart';

import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/strut_style/strut_style_dto.dart';
import '../../attributes/strut_style/strut_style_util.dart';
import '../../attributes/text_style/text_style_dto.dart';
import '../../attributes/text_style/text_style_util.dart';
import '../../core/attribute.dart';
import '../../core/attributes_map.dart';
import '../../core/directive.dart';
import '../../core/extensions/values_ext.dart';
import '../../helpers/string_ext.dart';
import 'text_attribute.dart';

const text = TextUtility();

class TextUtility extends SpecUtility<TextSpecAttribute> {
  const TextUtility();

  TextSpecAttribute _only({
    TextOverflow? overflow,
    StrutStyleDto? strutStyle,
    TextAlign? textAlign,
    double? textScaleFactor,
    int? maxLines,
    TextStyleDto? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    TextDirection? textDirection,
    bool? softWrap,
    MixableMap<TextDirective>? directives,
  }) {
    return TextSpecAttribute(
      overflow: overflow,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      style: style,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      textDirection: textDirection,
      softWrap: softWrap,
      directives: directives,
    );
  }

  TextOverflowUtility<TextSpecAttribute> get overflow {
    return TextOverflowUtility((overflow) => _only(overflow: overflow));
  }

  StrutStyleUtility<TextSpecAttribute> get strutStyle {
    return StrutStyleUtility((strutStyle) => _only(strutStyle: strutStyle));
  }

  TextAlignUtility<TextSpecAttribute> get textAlign {
    return TextAlignUtility((textAlign) => _only(textAlign: textAlign));
  }

  IntUtility<TextSpecAttribute> get maxLines {
    return IntUtility((maxLines) => _only(maxLines: maxLines));
  }

  TextStyleUtility<TextSpecAttribute> get style {
    return TextStyleUtility((style) => _only(style: style));
  }

  TextWidthBasisUtility<TextSpecAttribute> get textWidthBasis {
    return TextWidthBasisUtility(
      (textWidthBasis) => _only(textWidthBasis: textWidthBasis),
    );
  }

  TextHeightBehaviorUtility<TextSpecAttribute> get textHeightBehavior {
    return TextHeightBehaviorUtility(
      (textHeightBehavior) => _only(textHeightBehavior: textHeightBehavior),
    );
  }

  TextDirectionUtility<TextSpecAttribute> get textDirection {
    return TextDirectionUtility(
      (textDirection) => _only(textDirection: textDirection),
    );
  }

  BoolUtility<TextSpecAttribute> get softWrap {
    return BoolUtility((softWrap) => _only(softWrap: softWrap));
  }

  DoubleUtility<TextSpecAttribute> get textScaleFactor {
    return DoubleUtility(
      (textScaleFactor) => _only(textScaleFactor: textScaleFactor),
    );
  }

  TextSpecAttribute directive(ModifyTextDataDirective directive) {
    return _only(directives: [directive]);
  }

  TextSpecAttribute call({
    TextOverflow? overflow,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    double? textScaleFactor,
    int? maxLines,
    TextStyle? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    TextDirection? textDirection,
    bool? softWrap,
    List<TextDirective>? directives,
  }) {
    return _only(
      overflow: overflow,
      strutStyle: strutStyle?.toDto(),
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      style: style?.toDto(),
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      textDirection: textDirection,
      softWrap: softWrap,
      directives: directives == null ? null : MixableMap(directives),
    );
  }
}

mixin TextDirectiveUtilityMixin<T extends StyleAttribute>
    on SpecUtility<TextSpecAttribute> {
  TextSpecAttribute capitalize() => _addModifier(_capitalize);
  TextSpecAttribute uppercase() => _addModifier(_uppercase);
  TextSpecAttribute lowercase() => _addModifier(_lowercase);
  TextSpecAttribute titleCase() => _addModifier(_titleCase);
  TextSpecAttribute sentenceCase() => _addModifier(_sentenceCase);

  TextSpecAttribute _addModifier(Modifier<String> modifier) =>
      TextSpecAttribute(directives: [
        ModifyTextDataDirective([modifier]),
      ]);
}

String _capitalize(String value) => value.capitalize();
String _uppercase(String value) => value.toUpperCase();
String _lowercase(String value) => value.toLowerCase();
String _titleCase(String value) => value.titleCase();
String _sentenceCase(String value) => value.sentenceCase();
