import 'package:app/custom/app_shadow_box.dart';
import 'package:flutter/material.dart';

class ShadowBoxPage extends StatelessWidget {
  const ShadowBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ShadowBox')),
      body: Center(
        child: AppShadowBox(
          distance: 20,
          child: FlutterLogo(
            size: 100,
          ),
        ),
      ),
    );
  }
}
