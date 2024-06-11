// ignore_for_file: non_constant_identifier_names

import 'package:code_builder/code_builder.dart';
import 'package:mix_builder/src/helpers/builder_utils.dart';
import 'package:mix_builder/src/helpers/field_info.dart';
import 'package:mix_builder/src/helpers/lerp_method_builders.dart';

import 'mix_property.dart';
import 'types.dart';

Method GetterSelfBuilder({
  required String className,
}) {
  return Method((builder) {
    builder
      ..name = ParameterInfo.internalRefPrefix
      ..type = MethodType.getter
      ..returns = refer(className)
      ..lambda = true
      ..body = Code('this as $className');
  });
}

Method MethodResolveBuilder({
  required String resolveToType,
  required List<ParameterInfo> fields,
  bool isInternalRef = false,
}) {
  return Method((builder) {
    builder
      ..name = 'resolve'
      ..annotations.add(refer('override'))
      ..returns = refer(resolveToType)
      ..requiredParameters.add(Parameter((b) => b
        ..name = 'mix'
        ..type = MixTypes.foundation.mixData));
    builder.body = Code('''
      return $resolveToType(
        ${fields.map((field) {
      final propName = field.name;
      final fieldName = isInternalRef ? field.asInternalRef : field.name;

      if (field.hasDto) {
        if (field.isListType) {
          return '$propName: $fieldName?.map((e) => e.resolve(mix)).toList()';
        } else {
          if (field.dtoType?.symbol == 'AnimatedDataDto') {
            return '$propName: $fieldName?.resolve(mix) ?? mix.animation';
          }
          return '$propName: $fieldName?.resolve(mix)';
        }
      }

      return '$propName: $fieldName';
    }).join(', ')},
      );
    ''');
  });
}

Method MethodMergeBuilder({
  required String className,
  required List<ParameterInfo> fields,
  bool isInternalRef = false,
}) {
  final fieldStatements = fields.map((field) {
    final propName = field.name;
    final fieldName = isInternalRef ? field.asInternalRef : field.name;
    if (field.hasDto) {
      if (field.isListType) {
        return Code(
          '$propName: Dto.mergeList($fieldName, other.$fieldName),',
        );
      } else {
        return Code(
          '$propName: $fieldName?.merge(other.$fieldName) ?? other.$fieldName,',
        );
      }
    } else {
      if (field.isListType) {
        return Code('$propName: $fieldName?? other.$fieldName,');
      } else {
        return Code('$propName: other.$fieldName ?? $fieldName,');
      }
    }
  });
  return Method((b) {
    b.annotations.add(refer('override'));
    b.name = 'merge';
    b.returns = refer(className);
    b.requiredParameters.add(Parameter((b) {
      b.name = 'other';
      b.type = refer('$className?');
    }));
    b.body = Block.of([
      Code('if (other == null) return this;'),
      Code(''),
      Code('return $className('),
      Block.of(fieldStatements),
      Code(');'),
    ]);
  });
}

Method MethodCopyWithBuilder({
  required String className,
  required List<ParameterInfo> fields,
  bool isInternalRef = false,
}) {
  final fieldStatements = fields.map((field) {
    final fieldName =
        isInternalRef ? field.asInternalRef : 'this.${field.name}';
    return Code('${field.name}: ${field.name} ?? $fieldName,');
  });
  return Method((builder) {
    builder.docs.addAll([
      '/// Creates a copy of this [$className] but with the given fields',
      '/// replaced with the new values.',
    ]);
    builder.annotations.add(refer('override'));
    builder.name = 'copyWith';
    builder.returns = refer(className);
    builder.optionalParameters.addAll(fields.methodParams);
    builder.body = Block.of([
      Code('return $className('),
      Block.of(fieldStatements),
      Code(');'),
    ]);
  });
}

Method MethodToStringBuilder({
  required String className,
  required List<ParameterInfo> fields,
  bool isInternalRef = false,
}) {
  final fieldStatements = fields.map((field) {
    final fieldName = isInternalRef ? field.asInternalRef : field.name;
    return Code('${field.name}: $fieldName,');
  });
  return Method((builder) {
    builder.annotations.add(refer('override'));
    builder.name = 'toString';
    builder.returns = refer('String');
    builder.body = Block.of([
      Code('return \'$className('),
      Block.of(fieldStatements),
      Code(');'),
    ]);
  });
}

List<Method> MethodLerpHelpers(SpecDefinitionContext context) {
  final methods = <Method>[];

  if (context.hasReference(LerpMethodsHelper.lerpDoubleRef)) {
    methods.add(LerpMethodsHelper.lerpDouble);
  }

  if (context.hasReference(LerpMethodsHelper.lerpStrutStyleRef)) {
    methods.add(LerpMethodsHelper.lerpStrutStyle);
    if (!context.hasReference(LerpMethodsHelper.lerpDoubleRef)) {
      methods.add(LerpMethodsHelper.lerpDouble);
    }
  }

  if (context.hasReference(LerpMethodsHelper.lerpTextStyleRef)) {
    methods.add(LerpMethodsHelper.lerpTextStyle);
  }

  return methods;
}

Method MethodLerpBuilder({
  required String className,
  required List<ParameterInfo> fields,
  required DartEmitter emitter,
  bool isInternalRef = false,
}) {
  final lerpStatements = fields.map((f) {
    final fieldName = isInternalRef ? f.asInternalRef : f.name;
    final lerpExpression = getLerpExpression(fieldName, f.type);
    return Code('${f.name}: ${lerpExpression.accept(emitter)},');
  });

  final thisRef = isInternalRef ? ParameterInfo.internalRefPrefix : 'this';

  return Method((builder) {
    builder.annotations.add(refer('override'));
    builder.name = 'lerp';
    builder.returns = refer(className);
    builder.requiredParameters.add(Parameter((builder) {
      builder.name = 'other';
      builder.type = refer('$className?');
    }));
    builder.requiredParameters.add(Parameter((builder) {
      builder.name = 't';
      builder.type = refer('double');
    }));
    builder.body = Block.of([
      Code('if (other == null) return $thisRef;'),
      Code(''),
      Code('return $className('),
      Block.of(lerpStatements),
      Code(');'),
    ]);
  });
}

Method MethodOnlyBuilder({
  required String className,
  required List<ParameterInfo> fields,
}) {
  final fieldStatements = fields.map((e) {
    final fieldName = e.name;

    return Code('${fieldName}: $fieldName,');
  });
  return Method((b) {
    b.annotations.add(refer('override'));
    b.name = 'only';
    b.returns = refer('T');
    b.docs.add('/// Returns a new [$className] with the specified properties.');
    b.optionalParameters.addAll(fields.methodDtoParams);
    b.body = Block.of([
      Code('return builder($className('),
      Block.of(fieldStatements),
      Code('),);'),
    ]);
  });
}

Method GetterPropsBuilder({
  required String className,
  required List<ParameterInfo> fields,
  bool isInternalRef = false,
}) {
  final fieldStatements = fields.map((field) {
    final fieldName = isInternalRef ? field.asInternalRef : field.name;
    return Code('$fieldName,');
  });
  return Method((builder) {
    builder.docs.addAll([
      '/// The list of properties that constitute the state of this [$className].',
      '///',
      '/// This property is used by the [==] operator and the [hashCode] getter to',
      '/// compare two [$className] instances for equality.',
    ]);
    builder.annotations.add(refer('override'));
    builder.name = 'props';
    builder.type = MethodType.getter;
    builder.returns = refer('List<Object?>');
    builder.body = Block.of([
      Code('return ['),
      Block.of(fieldStatements),
      Code('];'),
    ]);
  });
}

Method MethodEqualityOperatorBuilder({
  required String className,
  required List<ParameterInfo> fields,
  required DartEmitter emitter,
  bool isInternalRef = false,
}) {
  final equalityChecks = fields.map((field) {
    final fieldType = field.type;

    if (fieldType.startsWith('List<')) {
      final listEqualsRef = FlutterTypes.foundation.listEquals([
        refer(field.name),
        refer('other.${field.name}'),
      ]);

      return listEqualsRef.accept(emitter);

      // return 'listEquals(other.${field.name}, ${field.name})';
    } else if (fieldType.startsWith('Map<')) {
      final mapEqualsRef = FlutterTypes.foundation.mapEquals([
        refer(field.name),
        refer('other.${field.name}'),
      ]);

      return mapEqualsRef.accept(emitter);
      // return 'mapEquals(other.${field.name}, ${field.name})';
    } else if (fieldType.startsWith('Set<')) {
      final setEqualsRef = FlutterTypes.foundation.setEquals([
        refer(field.name),
        refer('other.${field.name}'),
      ]);

      return setEqualsRef.accept(emitter);
      // return 'setEquals(other.${field.name}, ${field.name})';
    }

    return 'other.${field.name} == ${field.name}';
  }).join(' && ');

  return Method((b) => b
    ..name = 'operator =='
    ..annotations.add(refer('override'))
    ..returns = refer('bool')
    ..requiredParameters.add(Parameter((b) => b
      ..name = 'other'
      ..type = refer('Object')))
    ..body = Code('''
          if (identical(this, other)) return true;

          return other is $className && $equalityChecks;
        '''));
}

Method GetterHashcodeBuilder({
  required List<ParameterInfo> fields,
  bool isInternalRef = false,
}) {
  final fieldStatements = fields.map((field) {
    final fieldName = isInternalRef ? field.asInternalRef : field.name;
    return Code('$fieldName.hashCode');
  });
  return Method(
    (b) => b
      ..name = 'hashCode'
      ..annotations.add(refer('override'))
      ..returns = refer('int')
      ..type = MethodType.getter
      ..body = Block.of([
        Code('return '),
        // Add the hashCode using ^
        Code(fieldStatements.join(' ^ ')),
        Code(';'),
      ]),
  );
}

Method StaticMethodOfBuilder({
  required String specName,
  required String mixinName,
}) {
  return Method((builder) {
    builder.docs.addAll([
      '/// Retrieves the [$specName] from the nearest [Mix] ancestor.',
      '///',
      '/// If no ancestor is found, returns [$specName].',
    ]);
    builder.name = 'of';
    builder.returns = refer(specName);
    builder.static = true;
    builder.requiredParameters.add(Parameter((b) {
      b.name = 'context';
      b.type = refer('BuildContext');
    }));
    builder.body = Code('''
      return $mixinName.from(Mix.of(context));
    ''');
  });
}

Method StaticMethodFromBuilder({
  required String specName,
  required String attributeName,
}) {
  return Method((builder) {
    builder.docs.addAll(['/// Retrieves the [$specName] from a MixData.']);
    builder.name = 'from';
    builder.returns = refer(specName);
    builder.static = true;
    builder.requiredParameters.add(
      Parameter((builder) {
        builder.name = 'mix';
        builder.type = MixTypes.foundation.mixData;
      }),
    );
    builder.body = Code('''
        return mix.attributeOf<$attributeName>()?.resolve(mix) ?? const $specName();
      ''');
  });
}
