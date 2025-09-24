import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart' hide Directive;
import 'package:args/command_runner.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as path;

/// {@template generate_command}
///
/// `analyzer_exploration generate`
/// A [Command] to exemplify a sub command
/// {@endtemplate}
class GenerateCommand extends Command<int> {
  /// {@macro generate_command}
  GenerateCommand({required Logger logger}) : _logger = logger;

  @override
  String get description => 'A sample sub command that just prints one joke';

  @override
  String get name => 'generate';

  final Logger _logger;

  @override
  Future<int> run() async {
    final binDir = Directory(
      path.dirname(Platform.script.toFilePath()),
    );
    final libDir = Directory(
      path.join(binDir.parent.absolute.path, 'lib'),
    );
    _logger.info(libDir.path);
    final collection = AnalysisContextCollection(
      includedPaths: [libDir.absolute.path],
    );
    assert(collection.contexts.length == 1, 'Totally expected 1 context');
    final context = collection.contexts.first;
    final session = context.currentSession;
    for (var filePath in context.contextRoot.analyzedFiles()) {
      if (!filePath.endsWith('.dart')) {
        continue;
      }
      _logger.info('analyzed $filePath');
      final result = await session.getResolvedUnit(filePath);
      if (result is ResolvedUnitResult) {
        final unit = result.unit;
        for (final declaration in unit.declarations) {
          if (declaration is ClassDeclaration) {
            for (final annotation in declaration.metadata) {
              if (annotation.name.name == 'Annotation') {
                _logger.info(
                  'declaration: ${declaration.name}, metadata: ${annotation.name}',
                );
                final code = _buildRepositoryClass(declaration);
                _logger.info(code);

                // await File(
                //   filePath,
                // ).writeAsString(code, mode: FileMode.append);

                final codePath = path.join(
                  path.dirname(filePath),
                  '${path.basenameWithoutExtension(filePath)}.g.dart',
                );
                await File(codePath).writeAsString(
                  '// GENERATED CODE - DO NOT MODIFY BY HAND\n\n$code',
                );
              }
            }
          }
        }
      }
    }
    return ExitCode.success.code;
  }

  final _dartfmt = DartFormatter(
    languageVersion: DartFormatter.latestLanguageVersion,
  );

  String _buildRepositoryClass(ClassDeclaration kls) {
    final repoClass = Class(
      (b) => b
        ..name = '${kls.name}Repository'
        ..fields.add(
          Field(
            (b) => b
              ..name = '_cache'
              ..modifier = FieldModifier.final$
              // ..type = refer('Map<String, ${kls.name}>')
              ..assignment = Code('<String, ${kls.name}>{}'),
          ),
        )
        ..methods.add(
          Method(
            (m) => m
              ..name = 'getById'
              ..returns = refer(
                '${kls.name}?',
                'package:analyzer_exploration/src/data/models.dart',
              )
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'id'
                    ..type = refer('String'),
                ),
              )
              ..body = const Code('return _cache[id];'),
          ),
        )
        ..methods.add(
          Method(
            (m) => m
              ..name = 'save'
              ..returns = refer('void')
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..name = 'obj'
                    ..type = refer('${kls.name}'),
                ),
              )
              ..body = const Code('_cache[obj.id] = obj;'),
          ),
        ),
    );

    // 组装成一个 Library，并加上 import
    final library = Library(
      (b) => b
        ..directives.add(
          Directive.import('package:analyzer_exploration/src/data/models.dart'),
        )
        ..body.addAll([repoClass]),
    );
    return _dartfmt.format('${library.accept(DartEmitter())}');
  }
}
