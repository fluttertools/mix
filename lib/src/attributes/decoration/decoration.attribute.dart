// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/rendering.dart';

import '../resolvable_attribute.dart';

abstract class DecorationAttribute<T extends Decoration>
    extends ResolvableAttribute<T> {
  const DecorationAttribute();

  @override
  DecorationAttribute<T> merge(covariant DecorationAttribute<T>? other);
}
