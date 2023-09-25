import 'package:app/custom/app_sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverLayoutBuilderPage extends StatelessWidget {
  const SliverLayoutBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(fontSize: 16);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverLayoutBuilder'),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverLayoutBuilder(
            builder: (BuildContext context, SliverConstraints constraints) {
              return SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: 280,
                  color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'screen size: ${MediaQuery.sizeOf(context)}',
                        style: textStyle,
                      ),
                      Text(
                        'axisDirection: ${constraints.axisDirection}',
                        style: textStyle,
                      ),
                      Text(
                        'growthDirection: ${constraints.growthDirection}',
                        style: textStyle,
                      ),
                      Text(
                        'userScrollDirection: ${constraints.userScrollDirection}',
                        style: textStyle,
                      ),
                      Text(
                        'scrollOffset: ${constraints.scrollOffset}',
                        style: textStyle,
                      ),
                      Text(
                        'precedingScrollExtent: ${constraints.precedingScrollExtent}',
                        style: textStyle,
                      ),
                      Text(
                        'overlap: ${constraints.overlap}',
                        style: textStyle,
                      ),
                      Text(
                        'remainingPaintExtent: ${constraints.remainingPaintExtent}',
                        style: textStyle,
                      ),
                      Text(
                        'crossAxisExtent: ${constraints.crossAxisExtent}',
                        style: textStyle,
                      ),
                      Text(
                        'crossAxisDirection: ${constraints.crossAxisDirection}',
                        style: textStyle,
                      ),
                      Text(
                        'viewportMainAxisExtent: ${constraints.viewportMainAxisExtent}',
                        style: textStyle,
                      ),
                      Text(
                        'remainingCacheExtent: ${constraints.remainingCacheExtent}',
                        style: textStyle,
                      ),
                      Text(
                        'cacheOrigin: ${constraints.cacheOrigin}',
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          AppSliverHeader(
            pinned: true,
            collapsedHeight: 70,
            expandedHeight: 70,
            builder: (_, __, ___) {
              return Container(height: 70, color: Colors.black);
            },
          ),
          SliverLayoutBuilder(
            builder: (_, SliverConstraints constraints) {
              // debugPrint('SliverConstraints  = $constraints');
              Color color = Colors.green;
              if (constraints.userScrollDirection == ScrollDirection.forward) {
                color = Colors.blue;
              } else if (constraints.userScrollDirection ==
                  ScrollDirection.idle) {
                color = Colors.green;
              } else {
                color = Colors.cyan;
              }

              return AppSliverHeader(
                pinned: true,
                collapsedHeight: 280,
                expandedHeight: 280,
                builder: (_, __, ___) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    height: 280,
                    color: color,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'screen size: ${MediaQuery.sizeOf(context)}',
                          style: textStyle,
                        ),
                        Text(
                          'axisDirection: ${constraints.axisDirection}',
                          style: textStyle,
                        ),
                        Text(
                          'growthDirection: ${constraints.growthDirection}',
                          style: textStyle,
                        ),
                        Text(
                          'userScrollDirection: ${constraints.userScrollDirection}',
                          style: textStyle,
                        ),
                        Text(
                          'scrollOffset: ${constraints.scrollOffset}',
                          style: textStyle,
                        ),
                        Text(
                          'precedingScrollExtent: ${constraints.precedingScrollExtent}',
                          style: textStyle,
                        ),
                        Text(
                          'overlap: ${constraints.overlap}',
                          style: textStyle,
                        ),
                        Text(
                          'remainingPaintExtent: ${constraints.remainingPaintExtent}',
                          style: textStyle,
                        ),
                        Text(
                          'crossAxisExtent: ${constraints.crossAxisExtent}',
                          style: textStyle,
                        ),
                        Text(
                          'crossAxisDirection: ${constraints.crossAxisDirection}',
                          style: textStyle,
                        ),
                        Text(
                          'viewportMainAxisExtent: ${constraints.viewportMainAxisExtent}',
                          style: textStyle,
                        ),
                        Text(
                          'remainingCacheExtent: ${constraints.remainingCacheExtent}',
                          style: textStyle,
                        ),
                        Text(
                          'cacheOrigin: ${constraints.cacheOrigin}',
                          style: textStyle,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  child: Container(
                    height: 50,
                    color: Colors.primaries[(index % Colors.primaries.length)],
                  ),
                );
              },
              childCount: 80,
            ),
          ),
        ],
      ),
    );
  }
}
