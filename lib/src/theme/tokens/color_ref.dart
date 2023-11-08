import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import 'mix_token.dart';

// class ColorSwatchRef extends ColorSwatch<int> implements TokenRef<ColorSwatch> {
//   @override
//   final String name;

//   const ColorSwatchRef(this.name) : super(0, const {});

//   get props => [name];
//   @override
//   ColorSwatch resolve(MixData mix) => mix.resolver.colorSwatch(this);
// }

class ColorRef extends Color implements ResolvableTokenRef<Color> {
  @override
  final String name;

  const ColorRef(this.name) : super(0);

  @override
  Color resolve(MixData mix) => mix.resolver.colorToken(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorRef && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

typedef MixColorTokens = MixTokenMap<ColorRef, Color>;
