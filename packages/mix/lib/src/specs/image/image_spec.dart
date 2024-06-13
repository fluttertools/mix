// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports,
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/annotations.dart';
import 'package:mix/mix.dart';

part 'image_spec.g.dart';

@MixableSpec()
final class ImageSpec extends Spec<ImageSpec> with _$ImageSpec {
  final double? width, height;
  final Color? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Rect? centerSlice;
  final FilterQuality? filterQuality;
  final BlendMode? colorBlendMode;

  static const of = _$ImageSpec.of;

  static const from = _$ImageSpec.from;

  const ImageSpec({
    this.width,
    this.height,
    this.color,
    this.repeat,
    this.fit,
    this.alignment,
    this.centerSlice,
    this.filterQuality,
    this.colorBlendMode,
    super.animated,
  });
}
