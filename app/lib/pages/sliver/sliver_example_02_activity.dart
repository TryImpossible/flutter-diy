import 'package:flutter/material.dart';

class SliverExample02Activity extends StatelessWidget {
  const SliverExample02Activity({
    Key? key,
    required this.type,
  }) : super(key: key);
  final int type;

  String get title {
    switch (type) {
      case 0:
        return 'SliverAppBar的使用';
      case 1:
        return 'SliverAppBar-float效果';
      case 2:
        return 'SliverAppBar-span效果';
      case 3:
        return 'SliverAppBar-pinned效果';
      default:
        return '';
    }
  }

  bool get floating {
    switch (type) {
      case 1:
      case 2:
      case 3:
        return true;
      default:
        return false;
    }
  }

  bool get snap {
    switch (type) {
      case 2:
        return true;
      default:
        return false;
    }
  }

  bool get pinned {
    switch (type) {
      case 0:
      case 3:
        return true;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    /// 另外，floating/snap/pinned这三个属性可以指定SliverAppBar内容滑出屏幕之后的表现形式。
    ///
    /// float：向下滑动时，即使当前CustomScrollView不在顶部，SliverAppBar也会跟着一起向下出现；
    /// snap：当手指放开时，SliverAppBar会根据当前的位置进行调整，始终保持展开或收起的状态；
    /// pinned：不同于float效果，当SliverAppBar内容滑出屏幕时，将始终渲染一个固定在顶部的收起状态组件。
    /// 需要注意的是：snap效果一定要在float为true时才会生效。另外，你也可以将这三者进行组合使用。
    ///

    return Material(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: floating,
            snap: snap,
            pinned: pinned,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title),
              background: Image.asset(
                'assets/images/mingren.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: index.isOdd ? Colors.grey.shade200 : Colors.white,
                  child: Text(
                    index.toString(),
                    style: TextStyle(fontSize: 21, color: Colors.black),
                  ),
                );
              },
              childCount: 50,
            ),
            itemExtent: 50,
          ),
        ],
      ),
    );
  }
}
