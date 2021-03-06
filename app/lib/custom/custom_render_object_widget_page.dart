import 'package:app/custom/custom_render_object_widget.dart';
import 'package:flutter/material.dart';

class CustomRenderObjectWidgetPage extends StatefulWidget {
  const CustomRenderObjectWidgetPage({Key? key}) : super(key: key);

  @override
  State<CustomRenderObjectWidgetPage> createState() =>
      _CustomRenderObjectWidgetPageState();
}

class _CustomRenderObjectWidgetPageState
    extends State<CustomRenderObjectWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('通过 RenderObject 自定义 Widget'),
      ),
      body: Container(
        color: Colors.black12,
        child: const CustomRenderObjectWidget(),
      ),
    );
  }
}
