import 'package:flutter/material.dart';

class SliverExample01Page extends StatelessWidget {
  const SliverExample01Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid和List的混合使用'),
      ),
      body: CustomScrollView(
        slivers: [
          _buildTitle('SliverGrid'),
          SliverGrid(
            delegate: SliverChildListDelegate.fixed(
              Colors.primaries
                  .asMap()
                  .entries
                  .map((MapEntry<int, Color> mapEntry) => Container(
                        color: mapEntry.value,
                        alignment: Alignment.center,
                        child: _buildNum(mapEntry.key.toString()),
                      ))
                  .toList(),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
          ),
          _buildTitle('SliverGrid.count'),
          SliverGrid.count(
              crossAxisCount: 3,
              children: Colors.primaries
                  .asMap()
                  .entries
                  .map((MapEntry<int, Color> mapEntry) => Container(
                        color: mapEntry.value,
                        alignment: Alignment.center,
                        child: _buildNum(mapEntry.key.toString()),
                      ))
                  .toList()),
          _buildTitle('SliverGrid.extent'),
          SliverGrid.extent(
            maxCrossAxisExtent: 100,
            childAspectRatio: 0.5,
            children: Colors.primaries
                .asMap()
                .entries
                .map((MapEntry<int, Color> mapEntry) => Container(
                      color: mapEntry.value,
                      alignment: Alignment.center,
                      child: _buildNum(mapEntry.key.toString()),
                    ))
                .toList(),
          ),
          _buildTitle('SliverList'),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              Colors.primaries
                  .asMap()
                  .entries
                  .map((MapEntry<int, Color> mapEntry) => Container(
                        color: mapEntry.value,
                        alignment: Alignment.center,
                        child: _buildNum(mapEntry.key.toString()),
                      ))
                  .toList(),
            ),
          ),
          _buildTitle('SliverFixedExtentList'),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.primaries[index],
                  child: _buildNum(
                    index.toString(),
                  ),
                );
              },
              childCount: Colors.primaries.length,
            ),
            itemExtent: 100,
          ),
          _buildTitle('SliverAnimatedList'),
          SliverAnimatedList(
            itemBuilder: (
              BuildContext context,
              int index,
              Animation<double> animation,
            ) {
              return AnimatedOpacity(
                duration: kThemeAnimationDuration,
                opacity: animation.value,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.primaries[index],
                  height: 100,
                  child: _buildNum(
                    index.toString(),
                  ),
                ),
              );
            },
            initialItemCount: Colors.primaries.length,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildNum(String num) {
    return Text(
      num,
      style: const TextStyle(
        fontSize: 21,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
