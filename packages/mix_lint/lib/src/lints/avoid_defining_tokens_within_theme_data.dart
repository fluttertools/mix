import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../utils/extensions/instance_creation_expression.dart';
import '../utils/type_checker.dart';

class AvoidDefiningTokensWithinThemeData extends DartLintRule {
  static const _code = LintCode(
    name: 'mix_avoid_defining_tokens_within_theme_data',
    problemMessage:
        'Ensure that Tokens instances are not created directly inside MixThemeData constructors.',
    correctionMessage:
        'Instantiate Tokens outside of MixThemeData constructors.',
  );

  const AvoidDefiningTokensWithinThemeData() : super(code: _code);

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addInstanceCreationExpression((node) {
      final type = node.staticType;
      if (type == null || //
          !mixTokenChecker.isAssignableFromType(type)) return;

      if (!node.isDecendentOf(mixThemeDataChecker)) return;

      reporter.atNode(node, _code);
    });
  }
}
