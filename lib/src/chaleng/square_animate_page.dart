import 'package:flutter/material.dart';


class SquareAnimatePage extends StatelessWidget {
  const SquareAnimatePage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _SquareAnimated()
        ),
    );
  }
}

class _SquareAnimated extends StatefulWidget {
  const _SquareAnimated({
    Key? key,
  }) : super(key: key);

  @override
  State<_SquareAnimated> createState() => _SquareAnimatedState();
}

class _SquareAnimatedState extends State<_SquareAnimated> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> moveRight;
  late Animation<double> moveUp;
  late Animation<double> moveLeft;
  late Animation<double> moveDown;
  // bounceout
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration( milliseconds: 4500));
    moveRight = Tween( begin: 0.0, end: 150.0).animate(
      CurvedAnimation(parent: controller , curve: const Interval( 0, 0.25, curve: Curves.bounceOut ))
    );
    moveUp= Tween( begin: 0.0, end: -150.0).animate(
      CurvedAnimation(parent: controller , curve: const Interval( 0.25, 0.50, curve: Curves.bounceOut ))
    );
    moveLeft= Tween( begin: 0.0, end: -150.0).animate(
      CurvedAnimation(parent: controller , curve: const Interval( 0.50, 0.75, curve: Curves.bounceOut ))
    );
    moveDown= Tween( begin: 0.0, end: 150.0).animate(
      CurvedAnimation(parent: controller , curve: const Interval( 0.75, 1, curve: Curves.bounceOut ))
    );
    controller.addListener(() {
      if ( controller.status == AnimationStatus.completed ) {
        controller.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: const _Rectangulo(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset( moveRight.value + moveLeft.value, moveUp.value + moveDown.value),
          child: child,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
const _Rectangulo({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}