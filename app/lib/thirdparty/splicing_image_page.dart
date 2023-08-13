import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

/// 点9图
class NinePatchImage extends StatelessWidget {
  const NinePatchImage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height * 2;
    return SingleChildScrollView(
      child: Image.asset(
        'assets/images/splicing_background.png',
        width: width,
        height: height,
        centerSlice: const Rect.fromLTRB(
          2,
          (1000 - 250) / 2,
          750 - 2,
          1000 - ((1000 - 250) / 2),
        ),
        // repeat: ImageRepeat.repeat,
      ),
    );
  }
}

class SplicingImagePage extends StatefulWidget {
  const SplicingImagePage({super.key});

  @override
  State<SplicingImagePage> createState() => _SplicingImagePageState();
}

class _SplicingImagePageState extends State<SplicingImagePage> {
  Uint8List? _headerImageBytes;
  Uint8List? _bodyImageBytes;
  Uint8List? _footerImageBytes;

  @override
  void initState() {
    super.initState();
    test();
  }

  void test() async {
    final ByteData bytes =
        await rootBundle.load('assets/images/splicing_background.png'); // 加载文件
    final img.Image? image =
        img.decodeImage(bytes.buffer.asUint8List()); // 解码图像
    if (image != null) {
      img.Image croppedImage = img.copyCrop(
        image,
        x: 0,
        y: 0,
        width: 750,
        height: ((1000 - 250) / 2).ceil(),
      ); // 在这里我们裁剪图像
      _headerImageBytes = img.encodePng(croppedImage);
      croppedImage = img.copyCrop(
        image,
        x: 0,
        y: ((1000 - 250) / 2).ceil(),
        width: 750,
        height: 250,
      ); // 在这里我们裁剪图像
      _bodyImageBytes = img.encodePng(croppedImage);
      croppedImage = img.copyCrop(
        image,
        x: 0,
        y: ((1000 - 250) / 2).ceil() + 250,
        width: 750,
        height: (1000 - ((1000 - 250) / 2).ceil() + 250),
      ); // 在这里我们裁剪图像
      _footerImageBytes = img.encodePng(croppedImage);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    if (_headerImageBytes != null) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.memory(
              _headerImageBytes!,
              width: width,
            ),
            RepaintBoundary(
              child: Image.memory(
                _bodyImageBytes!,
                width: width,
                height: height * 3,
                repeat: ImageRepeat.repeatY,
                alignment: Alignment.topCenter,
                // fit: BoxFit.fitHeight,
                // centerSlice: Rect.fromLTRB(0, 10, 750, 250 - 10),
                // centerSlice: Rect.fromLTWH(750 / 2, 250 / 2, 30, 30),
                // centerSlice: Rect.fromCircle(
                //   center: Offset(750 / 2, 250 / 2),
                //   radius: 10,
                // ),
              ),
            ),
            Image.memory(
              _footerImageBytes!,
              width: width,
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
