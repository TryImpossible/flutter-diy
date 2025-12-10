import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/source/line_info.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:analyzer_plugin/plugin/assist_mixin.dart';
import 'package:analyzer_plugin/plugin/plugin.dart';
import 'package:analyzer_plugin/protocol/protocol_common.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart';
import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:app_analyzer_plugin/src/flutter_utils.dart';
import 'package:app_analyzer_plugin/src/logger.dart';
import 'package:analyzer_plugin/utilities/change_builder/change_builder_core.dart';
import 'package:analyzer_plugin/utilities/change_builder/change_builder_dart.dart';

final _logger = AppAnalyzerPluginLogger.create('app_analyzer_plugin');

class AppAnalyzerPlugin extends ServerPlugin {
  AppAnalyzerPlugin({required super.resourceProvider});

  @override
  List<String> get fileGlobsToAnalyze => <String>['**/*.dart'];

  @override
  String get name => 'App Analyzer Plugin';

  @override
  String get version => '1.0.0';

  final Map<String, List<AnalysisError>> _errorMap = <String, List<AnalysisError>>{};

  @override
  Future<void> analyzeFile({required AnalysisContext analysisContext, required String path}) async {
    if (!path.endsWith('.dart')) {
      return Future.value();
    }
    AppAnalyzerPluginLogger.init(analysisContext.contextRoot.root.path);

    // final bool isAnalyzed = analysisContext.contextRoot.isAnalyzed(path);
    // if (!isAnalyzed) {
    //   return Future.value();
    // }
    if (!path.endsWith('first_page.dart')) {
      return Future.value();
    }

    try {
      // _logger.info('root: ${analysisContext.contextRoot.root.path}');
      // _logger.info('excludedPaths: ${analysisContext.contextRoot.excludedPaths}');
      // _logger.info('includedPaths: ${analysisContext.contextRoot.includedPaths}');
      // _logger.info('optionsFile: ${analysisContext.contextRoot.optionsFile?.path}');
      // _logger.info('packagesFile: ${analysisContext.contextRoot.packagesFile?.path}');
      // _logger.info('workspace: ${analysisContext.contextRoot.workspace.root}');

      // _logger.info('path: $path');
      final ResolvedUnitResult result = await getResolvedUnitResult(path);
      // _logger.info('ResolvedUnitResult.exists: ${result.exists}');
      // _logger.info('ResolvedUnitResult.content:\n ${result.content}');
      // _logger.info('ResolvedUnitResult.uri: ${result.uri}');
      // _logger.info('ResolvedUnitResult.exists: ${result.exists}');
      // _logger.info('ResolvedUnitResult.runtimeType: ${result.runtimeType.toString()}');
      // _logger.info('ResolvedUnitResult.errors: ${result.errors}');
      // _logger.info('ResolvedUnitResult.path: ${result.path}');
      //
      // _logger.info('ResolvedUnitResult.lineInfo.lineCount: ${result.lineInfo.lineCount}');
      //
      // _logger.info(
      //     'ResolvedUnitResult.session.analysisContext.contextRoot.root.path: ${result.session.analysisContext.contextRoot.root.path}');

      final MyVisitor visitor = MyVisitor();
      result.unit.visitChildren(visitor);
      if (visitor.issues.isNotEmpty) {
        final List<AnalysisError> errors = <AnalysisError>[];
        for (Pair<int, int> issue in visitor.issues) {
          final int offset = issue.first;
          final int length = issue.last;
          final CharacterLocation startLocation = result.unit.lineInfo.getLocation(offset);
          final AnalysisError error = AnalysisError(
            AnalysisErrorSeverity.ERROR,
            AnalysisErrorType.LINT,
            Location(result.path, offset, length, startLocation.lineNumber, startLocation.columnNumber),
            '类必须以HM为前缀命名',
            '类命名规则',
            hasFix: true,
          );
          errors.add(error);
          _errorMap[result.path] = errors;
          channel.sendNotification(AnalysisErrorsParams(result.path, errors).toNotification());
        }
        _logger.info('ResolvedUnitResult.errors: ${errors.toString()}');
      }

      // final WidgetDepthVisitor widgetDepthVisitor = WidgetDepthVisitor();
      // result.unit.visitChildren(widgetDepthVisitor);
      // if (widgetDepthVisitor.issues.isNotEmpty) {
      //   final List<AnalysisError> errors = <AnalysisError>[];
      //   for (Pair<int, int> issue in widgetDepthVisitor.issues) {
      //     final int offset = issue.first;
      //     final int length = issue.last;
      //     final CharacterLocation location = result.unit.lineInfo.getLocation(offset);
      //     final AnalysisError error = AnalysisError(
      //       AnalysisErrorSeverity.ERROR,
      //       AnalysisErrorType.LINT,
      //       Location(result.path, offset, length, location.lineNumber, location.columnNumber),
      //       'Widget嵌套超过3层请提取',
      //       'Widget嵌套规则',
      //     );
      //     errors.add(error);
      //     channel.sendNotification(AnalysisErrorsParams(result.path, errors).toNotification());
      //   }
      // }
    } on Exception catch (e, stackTrace) {
      channel.sendNotification(
        PluginErrorParams(
          false,
          e.toString(),
          stackTrace.toString(),
        ).toNotification(),
      );
    }

    return Future.value();
  }

  @override
  Future<EditGetFixesResult> handleEditGetFixes(EditGetFixesParams parameters) async {
    final String file = parameters.file;
    if (_errorMap.containsKey(file)) {
      final AnalysisContext context = _analysisContextCollection.contextFor(file);
      final ResolvedUnitResult result = await getResolvedUnitResult(file);
      final List<AnalysisError> errors = _errorMap[file]!;
      final List<AnalysisErrorFixes> sourceChanges = <AnalysisErrorFixes>[];
      _logger.info('parameters: ${parameters}');
      for (final AnalysisError error in errors) {
        final int start = error.location.offset;
        final int end = error.location.offset + error.location.length;
        if (error.code == '类命名规则' && start <= parameters.offset && parameters.offset <= end) {
          final ChangeBuilder changeBuilder = ChangeBuilder(session: context.currentSession);
          final String name = result.content.substring(start, end);
          _logger.info('error: ${error}');
          _logger.info('content: ${result.content}');
          _logger.info('name: $name');
          await changeBuilder.addDartFileEdit(file, (DartFileEditBuilder dartFileEditBuilder) {
            final String replace = 'HM$name';
            final RegExp regExp = RegExp(name);
            for (final Match match in regExp.allMatches(result.content)) {
              dartFileEditBuilder.addSimpleReplacement(
                SourceRange(match.start, match.end - match.start),
                replace,
              );
            }
            dartFileEditBuilder.format(SourceRange(0, result.unit.length));
          });
          final SourceChange sourceChange = changeBuilder.sourceChange;
          sourceChange.message = '添加HM前缀';
          sourceChanges.add(
            AnalysisErrorFixes(
              error,
              fixes: <PrioritizedSourceChange>[PrioritizedSourceChange(10, sourceChange)],
            ),
          );
        }
      }
      _errorMap.remove(file);
      return EditGetFixesResult(sourceChanges);
    }
    return EditGetFixesResult(const <AnalysisErrorFixes>[]);
  }

  late AnalysisContextCollection _analysisContextCollection;

  @override
  Future<void> afterNewContextCollection({required AnalysisContextCollection contextCollection}) {
    _analysisContextCollection = contextCollection;
    return super.afterNewContextCollection(contextCollection: contextCollection);
  }
}

class MyVisitor extends GeneralizingAstVisitor<void> {
  List<Pair<int, int>> get issues => _issues;
  final List<Pair<int, int>> _issues = <Pair<int, int>>[];

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    final bool isValid = node.name.toString().startsWith('HM');
    if (!isValid) {
      issues.add(Pair(node.name.offset, node.name.length));
    }
    return super.visitClassDeclaration(node);
  }
}

class WidgetDepthVisitor extends GeneralizingAstVisitor<void> {
  List<Pair<int, int>> get issues => _issues;
  final List<Pair<int, int>> _issues = <Pair<int, int>>[];

  @override
  void visitInstanceCreationExpression(InstanceCreationExpression node) {
    _logger.info('node.constructorName: ${node.constructorName}');
    _logger.info('node.keyword: ${node.keyword.toString()}');
    _logger.info('node.argumentList: ${node.argumentList}');
    _logger.info('node.childEntities: ${node.childEntities}');
    if (isWidgetType(node.staticType)) {
      // 如果是widget类型，那么检查是否叶子结点
      final bool leafNode = !hasChildOrChildren(node.argumentList);
      if (leafNode) {
        // 如果是叶子widget，那么检查嵌套的widget深度
        int widgetDepth = getContinuousWidgetDepths(node);
        if (widgetDepth > 3) {
          // 存在widget深度超过3
          issues.add(Pair(node.offset, node.length));
        }
      }
    }

    return super.visitInstanceCreationExpression(node);
  }

  /// 检查是否有child、children、body、home
  bool hasChildOrChildren(ArgumentList node) {
    _logger.info('node.arguments: ${node.arguments}');
    for (final Expression arg in node.arguments) {
      _logger.info('node.arguments.arg: ${arg}');
      _logger.info('node.arguments.arg.runtimeType: ${arg.runtimeType}');
      if (arg is NamedExpression) {
        String name = arg.name.label.name;
        if (name == 'child' || name == 'body' || name == 'home') {
          if (arg.childEntities.any((element) => element is NullLiteral)) {
            return false;
          }
          return true;
        } else if (name == 'children') {
          ListLiteral? list;
          try {
            list = arg.childEntities.firstWhere((element) => element is ListLiteral) as ListLiteral;
            if (list.toSource() == '[]') {
              return false;
            }
          } catch (_) {}
          return true;
        }
      }
    }
    return false;
  }

  int getContinuousWidgetDepths(AstNode? node) {
    int depth = 0;
    while (node != null && node.parent != null) {
      if (node is InstanceCreationExpression) {
        if (isWidgetType(node.staticType)) {
          depth++;
        }
      }
      node = node.parent;
    }
    return depth;
  }
}

void main() {
  String code = '''
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: const Text('FirstPage')),
    // );
    return Container(
      child: Container(
        child: Container(
          child: Container(),
        ),
      ),
    );
  }
}
  ''';
  // code = 'int a = 1; int b = a + 2;';
//   code = '''
// Container(
//   child: Container(
//     child: Container(
//       child: Container(),
//     ),
//   ),
// );
//   ''';
  ParseStringResult result = parseString(content: code);
  CompilationUnit unit = result.unit;
  unit.accept(TestVisitor());
}

class TestVisitor extends GeneralizingAstVisitor<void> {
  @override
  void visitNode(AstNode node) {
    // 计算缩进，美化输出
    int l = 0;
    AstNode? p = node;
    while (p != null && p.parent != null) {
      l++;
      p = p.parent;
    }
    String b = '';
    for (int i = 0; i < l; i++) {
      b += '  ';
    }
    print('${node.runtimeType}->${node.toSource()}');
    if (node is ClassDeclaration) {
      print('node.name: ${node.name.toString()}');
      print('node.offset: ${node.offset}');
      print('node.end: ${node.end}');
      print('node.length: ${node.length}');
      print('node.classKeyword: ${node.classKeyword.toString()}');
      print('node.implementsClause: ${node.implementsClause.toString()}');
    }
    return super.visitNode(node);
  }
}
