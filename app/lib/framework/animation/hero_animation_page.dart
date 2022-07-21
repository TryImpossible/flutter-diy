import 'package:flutter/material.dart';

class HeroAnimationPage extends StatelessWidget {
  const HeroAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            InkWell(
              child: Hero(
                tag: "avatar",
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/lufei.jpeg",
                    width: 100.0,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder:
                      (BuildContext context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: const _TargetActivity(),
                    );
                  },
                ));
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text('点击头像'),
            ),
          ],
        ),
      ),
    );
  }
}

class _TargetActivity extends StatelessWidget {
  const _TargetActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: 'avatar',
          child: Image.asset("assets/images/lufei.jpeg"),
        ),
      ),
    );
  }
}
