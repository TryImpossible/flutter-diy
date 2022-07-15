import 'dart:math';

import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  const ClipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("assets/images/lufei.jpeg", width: 60.0);
    return Scaffold(
      appBar: AppBar(
        title: Text('Clip控件'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              avatar, // 不剪裁
              ClipOval(child: avatar), // 剪裁为圆形
              ClipOval(
                child: Image.asset(
                  "assets/images/lufei.jpeg",
                  width: 120,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                // 剪裁为圆角矩形
                child: avatar,
                borderRadius: BorderRadius.circular(5.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 0.5, // 宽度设为原来宽度一半，另一半会溢出
                    child: avatar,
                  ),
                  Text("你好世界", style: TextStyle(color: Colors.green))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRect(
                    // 将溢出部分剪裁
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5, // 宽度设为原来宽度一半
                      child: avatar,
                    ),
                  ),
                  Text("你好世界", style: TextStyle(color: Colors.green))
                ],
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.primaries[
                      Random.secure().nextInt(10) % Colors.primaries.length],
                ),
                child: ClipRect(
                  clipper: MyClipper(),
                  child: avatar,
                ),
              ),
              ClipPath(
                clipper: _TriangleClipper(),
                child: avatar,
              ),
              ClipPath.shape(
                shape: CircleBorder(
                  side: BorderSide(width: 4, color: Colors.blue),
                ),
                child: avatar,
              ),
              ClipPath.shape(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: avatar,
              ),
              ClipPath.shape(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: avatar,
              ),
              ClipPath.shape(
                shape: StadiumBorder(),
                child: avatar,
              ),
              ClipPath.shape(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: avatar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    /// getClip()是用于获取剪裁区域的接口，由于图片大小是60×60，
    /// 我们返回剪裁区域为Rect.fromLTWH(10.0, 15.0, 40.0, 30.0)，
    /// 即图片中部40×30像素的范围。
    return Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    /// shouldReclip() 接口决定是否重新剪裁。
    /// 如果在应用中，剪裁区域始终不会发生变化时应该返回false，这样就不会触发重新剪裁，避免不必要的性能开销。
    /// 如果剪裁区域会发生变化（比如在对剪裁区域执行一个动画），那么变化后应该返回true来重新执行剪裁
    return false;
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0); //从图片的中间上面坐标
    path.lineTo(0, size.height); //图片的左下角坐标
    path.lineTo(size.width, size.height); //图片的右下角左边
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
