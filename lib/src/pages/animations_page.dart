import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class AnimationsPage extends StatelessWidget {

const AnimationsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado()
     ),
   );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> moveRight;
  late Animation<double> enlarge;
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4500 ));
    rotation = Tween(begin: 0.0, end: (2.0 * pi)).animate(
      CurvedAnimation(
        parent: controller, curve: Curves.easeOut
      )
    );
    opacity = Tween( begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller, curve: const Interval( 0, 0.25, curve: Curves.easeOut )
      )
    );

    opacityOut = Tween( begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller, curve: const Interval( 0.75, 1.0, curve: Curves.easeOut )
      )
    );

    moveRight = Tween( begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: controller, curve: Curves.easeOut
      )
    );

    enlarge = Tween( begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: controller, curve: Curves.easeOut
      )
    );

    controller.addListener(() {
      if (kDebugMode) {
        // print('status: ${controller.status}');
      }
      if ( controller.status == AnimationStatus.completed) {
        // controller.repeat();
        controller.reverse();
        // controller.reset();
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
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset:  Offset( moveRight.value, 0 ),
          child: Transform.rotate(angle: rotation.value, 
            child: Opacity(
              opacity:  opacity.value - opacityOut.value,
              child: Transform.scale(
                scale: enlarge.value,
                child: child
              ),
            )
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
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
