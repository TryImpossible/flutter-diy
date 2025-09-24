import 'package:analyzer_exploration/annotation.dart';

@Annotation()
class MyDataClass {
  MyDataClass(this.id);
  final String id;
}

class SomeOtherClass {}
