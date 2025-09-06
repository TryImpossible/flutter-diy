import 'package:ffi_plugin/ffi_plugin.dart' as ffi_plugin;
import 'package:flutter/material.dart';

class FFIPage extends StatefulWidget {
  const FFIPage({super.key});

  @override
  State<FFIPage> createState() => _FFIPageState();
}

class _FFIPageState extends State<FFIPage> {
  late int _sumResult;
  late Future<int> _sumAsyncResult;
  late int _subtractResult;

  @override
  void initState() {
    super.initState();
    _sumResult = ffi_plugin.sum(1, 2);
    _sumAsyncResult = ffi_plugin.sumAsync(3, 4);
    _subtractResult = ffi_plugin.subtract(2, 1);
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return Scaffold(
      appBar: AppBar(title: const Text('FFI使用')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              'This calls a native function through FFI that is shipped as source in the package. '
              'The native code is built as part of the Flutter Runner build.',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            spacerSmall,
            Text(
              'sum(1, 2) = $_sumResult',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            spacerSmall,
            FutureBuilder<int>(
              future: _sumAsyncResult,
              builder: (BuildContext context, AsyncSnapshot<int> value) {
                final displayValue = (value.hasData) ? value.data : 'loading';
                return Text(
                  'await sumAsync(3, 4) = $displayValue',
                  style: textStyle,
                  textAlign: TextAlign.center,
                );
              },
            ),
            spacerSmall,
            Text(
              'subtract(2, 1) = $_subtractResult',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            spacerSmall,
            Text(
              "reverse('dart') = '${ffi_plugin.reverse('dart')}'",
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
