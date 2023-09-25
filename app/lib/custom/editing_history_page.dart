import 'dart:async';

import 'package:flutter/material.dart';

class EditingHistoryPage extends StatefulWidget {
  const EditingHistoryPage({super.key});

  @override
  State<EditingHistoryPage> createState() => _EditingHistoryPageState();
}

class _EditingHistoryPageState extends State<EditingHistoryPage> {
  final TextEditingController _controller = TextEditingController();
  final EditingHistoryController _historyController =
      EditingHistoryController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _historyController.push(EditingModel(value: _controller.text));
    });
    _historyController.currentValue.listen((EditingModel model) {
      _controller.value = TextEditingValue(
        text: model.value,
        selection: TextSelection.fromPosition(
          TextPosition(offset: model.value.length),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EditingHistory')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(controller: _controller, autofocus: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  StreamBuilder<bool>(
                    stream: _historyController.canUndo,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<bool> snapshot,
                    ) {
                      return IconButton(
                        onPressed: snapshot.data == true
                            ? _historyController.undo
                            : null,
                        icon: const Icon(Icons.undo),
                      );
                    },
                  ),
                  StreamBuilder<bool>(
                    stream: _historyController.canRedo,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<bool> snapshot,
                    ) {
                      return IconButton(
                        onPressed: snapshot.data == true
                            ? _historyController.redo
                            : null,
                        icon: const Icon(Icons.redo),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
class EditingModel {
  const EditingModel({required this.value});

  final String value;

  @override
  bool operator ==(Object other) {
    return other is EditingModel && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return value;
  }
}

typedef EditingHistoryController = UndoHistoryController<EditingModel>;

class UndoHistoryController<T> {
  UndoHistoryController() {
    _throttledPush = _throttle<T>(
      duration: _kThrottleDuration,
      function: (T currentValue) {
        _stack.push(currentValue);
        _canUndo.add(_stack.canUndo);
        _canRedo.add(_stack.canRedo);
      },
    );
  }

  /// 节流时间
  static const Duration _kThrottleDuration = Duration(milliseconds: 250);

  final _UndoStack<T> _stack = _UndoStack<T>();
  late final _Throttled<T> _throttledPush;
  Timer? _throttleTimer;
  bool _duringTrigger = false;

  T? _lastValue;

  /// 当前值（stream）
  Stream<T> get currentValue => _currentValue.stream;
  final StreamController<T> _currentValue = StreamController<T>.broadcast();

  /// 能否撤销（stream）
  Stream<bool> get canUndo => _canUndo.stream;
  final StreamController<bool> _canUndo = StreamController<bool>.broadcast();

  /// 能否重做（stream）
  Stream<bool> get canRedo => _canRedo.stream;
  final StreamController<bool> _canRedo = StreamController<bool>.broadcast();

  /// 更新
  void _update(T? nextValue) {
    if (nextValue == null) {
      return;
    }
    if (nextValue == _lastValue) {
      return;
    }
    _lastValue = nextValue;
    _duringTrigger = true;
    try {
      _currentValue.add(nextValue);
      _canUndo.add(_stack.canUndo);
      _canRedo.add(_stack.canRedo);
    } finally {
      _duringTrigger = false;
    }
  }

  /// 添加
  void push(T value) {
    if (value == _lastValue) {
      return;
    }

    if (_duringTrigger) {
      return;
    }

    _lastValue = value;

    _throttleTimer = _throttledPush(value);
  }

  /// 撤销
  void undo() {
    if (_stack.currentValue == null) {
      return;
    }
    if (_throttleTimer?.isActive ?? false) {
      _throttleTimer?.cancel(); // Cancel ongoing push, if any.
      _update(_stack.currentValue);
    } else {
      _update(_stack.undo());
    }
  }

  /// 重做
  void redo() {
    _update(_stack.redo());
  }

  dispose() {
    _throttleTimer?.cancel();
    _currentValue.close();
    _canUndo.close();
    _canRedo.close();
  }
}

/// 一种支持撤销和重做的数据结构
class _UndoStack<T> {
  _UndoStack();

  final List<T> _list = <T>[];

  // 当前值的索引，如果列表为空，则为-1。
  int _index = -1;

  /// 返回栈的当前值
  T? get currentValue => _list.isEmpty ? null : _list[_index];

  bool get canUndo => _list.isNotEmpty && _index > 0;

  bool get canRedo => _list.isNotEmpty && _index < _list.length - 1;

  /// 向栈中添加新的值
  ///
  /// 添加相同的对象不会创建多个
  void push(T value) {
    if (_list.isEmpty) {
      _index = 0;
      _list.add(value);
      return;
    }

    assert(_index < _list.length && _index >= 0);

    if (value == currentValue) {
      return;
    }

    // 如果栈中有任何操作已撤消，在添加新状态之前会删除那些不相关的状态。
    if (_index != _list.length - 1) {
      _list.removeRange(_index + 1, _list.length);
    }
    if (_list.length > 5) {
      _list.removeAt(0);
    }
    _list.add(value);
    _index = _list.length - 1;
    print('barry: $_list');
  }

  /// 返回撤销操作后的当前值
  ///
  /// 撤消操作会将当前值移动到上次push的值（如果有的话）。
  ///
  /// 如何栈为空，则返回null
  T? undo() {
    if (_list.isEmpty) {
      return null;
    }

    assert(_index < _list.length && _index >= 0);

    if (_index != 0) {
      _index = _index - 1;
    }

    return currentValue;
  }

  /// 返回重做操作后的当前值
  ///
  /// 重做操作将当前值移动到上次撤销的值（如何有的话）
  ///
  /// 如何栈为空，则返回null
  T? redo() {
    if (_list.isEmpty) {
      return null;
    }

    assert(_index < _list.length && _index >= 0);

    if (_index < _list.length - 1) {
      _index = _index + 1;
    }

    return currentValue;
  }

  /// 从栈中删除所有内容
  void clear() {
    _list.clear();
    _index = -1;
  }

  @override
  String toString() {
    return '_UndoStack $_list';
  }
}

/// A function that can be throttled with the throttle function.
typedef _Throttleable<T> = void Function(T currentArg);

/// A function that has been throttled by [_throttle].
typedef _Throttled<T> = Timer Function(T currentArg);

/// 节流函数
/// 仅适用于只接受一个参数并返回void的函数
/// [duration] 间隔时间
/// [function] 函数
_Throttled<T> _throttle<T>({
  required Duration duration,
  required _Throttleable<T> function,
}) {
  Timer? timer;
  late T arg;

  return (T currentArg) {
    arg = currentArg;
    if (timer != null && timer!.isActive) {
      return timer!;
    }
    timer = Timer(duration, () {
      function(arg);
      timer = null;
    });
    return timer!;
  };
}
