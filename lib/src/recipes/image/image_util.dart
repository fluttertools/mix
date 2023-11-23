import 'package:flutter/material.dart';

import '../../attributes/color_attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../../utils/scalar_util.dart';
import 'image_attribute.dart';

const image = ImageUtility();

class ImageUtility<T> {
  const ImageUtility();

  ImageMixAttribute _color(ColorAttribute color) =>
      ImageMixAttribute(color: color);
  ImageMixAttribute _repeat(ImageRepeat repeat) =>
      ImageMixAttribute(repeat: repeat);
  ImageMixAttribute _fit(BoxFit fit) => ImageMixAttribute(fit: fit);

  ColorUtility<ImageMixAttribute> get color => ColorUtility(_color);
  ImageRepeatUtility<ImageMixAttribute> get repeat =>
      ImageRepeatUtility(_repeat);
  BoxFitUtility<ImageMixAttribute> get fit => BoxFitUtility(_fit);

  ImageMixAttribute width(double width) => ImageMixAttribute(width: width);
  ImageMixAttribute height(double height) => ImageMixAttribute(height: height);

  ImageMixAttribute call({
    double? width,
    double? height,
    Color? color,
    ImageRepeat? repeat,
    BoxFit? fit,
  }) {
    return ImageMixAttribute(
      width: width,
      height: height,
      color: color?.toAttribute(),
      repeat: repeat,
      fit: fit,
    );
  }
}
