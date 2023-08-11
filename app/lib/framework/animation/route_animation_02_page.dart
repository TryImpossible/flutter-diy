import 'package:flutter/material.dart';

class RouteAnimation02Page extends StatelessWidget {
  const RouteAnimation02Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        padding: const EdgeInsets.all(4),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: 30,
        itemBuilder: (_, int index) {
          return Builder(builder: (BuildContext context) {
            return InkWell(
              onTap: () => _onTap(context),
              child: Hero(
                tag: index,
                // flightShuttleBuilder: (
                //   BuildContext flightContext,
                //   Animation<double> animation,
                //   HeroFlightDirection flightDirection,
                //   BuildContext fromHeroContext,
                //   BuildContext toHeroContext,
                // ) {
                //   return toHeroContext.widget;
                // },
                // placeholderBuilder: (
                //   BuildContext context,
                //   Size heroSize,
                //   Widget child,
                // ) {
                //   return ColoredBox(color: Colors.green, child: Text('123'));
                // },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Text(index.toString()),
                ),
              ),
            );
          });
        },
      ),
    );
  }

  void _onTap(BuildContext context) {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      Offset position = renderBox.localToGlobal(Offset.zero);
      // debugPrint('top left position: $position');
      position += renderBox.size.center(Offset.zero);
      debugPrint(
          'renderBox position: $position, renderBox size: ${renderBox.size}');

      Navigator.of(context).push(
        _CustomPageRoute(
          position: position,
          builder: (_) {
            return const _TestPage();
          },
        ),
      );
    }
  }
}

class _TestPage extends StatelessWidget {
  const _TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 120),
        child: Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(
              tag: '21',
              flightShuttleBuilder: (
                  BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext,
                  ) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget? child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: fromHeroContext.widget,
                );
              },
              child: _buildBox(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBox(BuildContext context) {
    Widget child = Container(
      width: 120,
      height: 120,
      color: Colors.redAccent,
    );
    final Animation<double>? animation = ModalRoute.of(context)?.animation;
    if (animation != null) {
      final Size size = MediaQuery.of(context).size;
      child = AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0, end: 1).animate(animation),
            alignment: FractionalOffset.fromOffsetAndSize(Offset(147.8, 625.6), size),
            child: child,
          );
        },
        child: child,
      );
    }
    return child;
  }
}

class _CustomPageRoute<T> extends PageRoute<T> {
  _CustomPageRoute({
    super.settings,
    super.fullscreenDialog = false,
    super.allowSnapshotting = true,
    required this.position,
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 800),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor = Colors.transparent,
    this.barrierLabel = '',
    this.maintainState = true,
  });

  final Offset position;

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  Color? barrierColor;

  @override
  String? barrierLabel;

  @override
  bool maintainState;

  @override
  Duration get reverseTransitionDuration => transitionDuration;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    if (animation.status == AnimationStatus.forward) {
      return child;
    } else {
      final Size size = MediaQuery.of(context).size;

      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: <Widget>[
              Transform.translate(
                offset: Tween(begin: Offset.zero, end: Offset.zero)
                    .evaluate(animation),
                child: Transform.scale(
                  alignment: FractionalOffset.fromOffsetAndSize(position, size),
                  scale:
                  Tween<double>(begin: 0.4, end: 1.0).evaluate(animation),
                  child: FadeTransition(
                    opacity:
                    Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            Tween<double>(begin: 0, end: 72)
                                .evaluate(animation),
                          ),
                        ),
                      ),
                      // width: size.width * animation.value,
                      // height: size.height * animation.value,
                      child: child,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        child: child,
      );
    }
  }
}
