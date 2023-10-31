import 'package:flutter/material.dart';

import '../../../factory/mix_provider_data.dart';
import '../decorator.dart';

const aspectRataion = _aspectRatio;

AspectRatioDecorator _aspectRatio(double aspectRatio) {
  return AspectRatioDecorator(aspectRatio: aspectRatio);
}

class AspectRatioDecorator extends Decorator<double> {
  final double _aspectRatio;
  const AspectRatioDecorator({required double aspectRatio})
      : _aspectRatio = aspectRatio;

  @override
  AspectRatioDecorator merge(AspectRatioDecorator other) {
    return AspectRatioDecorator(aspectRatio: other._aspectRatio);
  }

  @override
  double resolve(MixData mix) => _aspectRatio;

  @override
  get props => [_aspectRatio];

  @override
  Widget build(Widget child, MixData mix) {
    final aspectRatio = resolve(mix);

    return AspectRatio(aspectRatio: aspectRatio, child: child);
  }
}
