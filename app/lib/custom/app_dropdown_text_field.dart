import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDropdownTextFieldController {
  AppDropdownTextFieldController({this.initialValue});

  final String? initialValue;

  _AppDropdownTextFieldState? _state;

  void _bindState(_AppDropdownTextFieldState state) {
    assert(_state == null, "DropdownTextFieldState Can't be null");
    _state = state;
  }

  void _unbindState() {
    _state = null;
  }

  void showMenu() => _state?._showMenu();

  void dismissMenu() => _state?._dismissMenu();
}

class AppDropdownTextField extends StatefulWidget {
  const AppDropdownTextField({
    Key? key,
    this.controller,
    this.decoration = const InputDecoration(),
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.style,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.inputFormatters,
    this.enabled,
    required this.items,
    this.initialValue,
  }) : super(key: key);

  final AppDropdownTextFieldController? controller;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final List<DropdownMenuItem<String>> items;
  final String? initialValue;

  @override
  _AppDropdownTextFieldState createState() => _AppDropdownTextFieldState();
}

class _AppDropdownTextFieldState extends State<AppDropdownTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  late List<DropdownMenuItem<String>> _items;

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    widget.controller?._bindState(this);
    initData();
  }

  @override
  void dispose() {
    widget.controller?._unbindState();
    super.dispose();
  }

  void initData() {
    _controller = TextEditingController(
      text: widget.initialValue ?? widget.controller?.initialValue,
    );
    _items = _processItem();

    _focusNode = FocusNode()
      ..addListener(() {
        if (_focusNode.hasFocus) {
          _showMenu();
        } else {
          _dismissMenu();
        }
      });
  }

  List<DropdownMenuItem<String>> _processItem() {
    if (_controller.text.isNotEmpty) {
      return widget.items
          .where((DropdownMenuItem<String> item) =>
              (item.value ?? '').contains(_controller.text))
          .toList();
    } else {
      return widget.items;
    }
  }

  void _showMenu() {
    _overlayEntry = this._buildOverlayEntry();
    Overlay.of(context)?.insert(_overlayEntry!);
  }

  void _dismissMenu() {
    _overlayEntry?.remove();
  }

  /// 不跟随滚动版本
  // OverlayEntry _buildOverlayEntry() {
  //   RenderBox renderBox = context.findRenderObject() as RenderBox;
  //   var size = renderBox.size;
  //
  //   return OverlayEntry(builder: (BuildContext context) {
  //     return Positioned(
  //       width: size.width,
  //       child: CompositedTransformFollower(
  //         link: this._layerLink,
  //         showWhenUnlinked: false,
  //         offset: Offset(0.0, size.height + 5.0),
  //         child: Material(
  //           elevation: 4.0,
  //           child: ListView(
  //             padding: EdgeInsets.zero,
  //             shrinkWrap: true,
  //             children: <Widget>[
  //               ListTile(
  //                 title: Text('Syria'),
  //                 onTap: () {
  //                   print('Syria Tapped');
  //                 },
  //               ),
  //               ListTile(
  //                 title: Text('Lebanon'),
  //                 onTap: () {
  //                   print('Lebanon Tapped');
  //                 },
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  // }

  OverlayEntry _buildOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    // var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(builder: (BuildContext context) {
      return Positioned(
        // left: offset.dx,
        // top: offset.dy + size.height + 5.0,
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: true,
          offset: Offset(0.0, size.height + 3.0),
          child: Material(
            elevation: 3.0,
            child: SizedBox(
              height: 210,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _controller.text = _items[index].value ?? '';
                      widget.onChanged?.call(_controller.text);
                    },
                    child: _items[index],
                  );
                },
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        decoration: widget.decoration,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        style: widget.style,
        textAlign: widget.textAlign,
        onChanged: (String value) {
          widget.onChanged?.call(value);
          _items = _processItem();
          setState(() {});
        },
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
      ),
    );
  }
}
