import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavBar({
    super.key,
    required this.titleText,
    this.menuText,
    this.onMenuTap,
  });

  final String titleText;
  final String? menuText;
  final VoidCallback? onMenuTap;

  @override
  Size get preferredSize => const Size.fromHeight(44);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      actions: _buildActions(),
    );
  }

  List<Widget>? _buildActions() {
    if (menuText == null || menuText!.isEmpty) {
      return null;
    }
    return <Widget>[
      TextButton(
        onPressed: onMenuTap,
        child: Text(menuText!),
      ),
    ];
  }
}
