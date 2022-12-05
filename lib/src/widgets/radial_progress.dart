import 'dart:math';

import 'package:flutter/material.dart';


class RadialProgress extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBorderWidth;
  final double secondaryBorderWidth;
  const RadialProgress ({
    Key? key, 
    required this.percentage,
    this.primaryColor = Colors.blueAccent,
    this.secondaryColor = Colors.grey,
    this.primaryBorderWidth = 10,
    this.secondaryBorderWidth = 4
  }) : super(key: key);

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double afterPercentage;
  @override
  void initState() {
    afterPercentage = widget.percentage;
    controller = AnimationController(vsync: this, duration: const Duration( milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    controller.forward( from: 0 );

    final diffAnimate = widget.percentage - afterPercentage;
    afterPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller, 
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress(
              percentage: ( widget.percentage - diffAnimate ) + ( diffAnimate * controller.value ),
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
              primaryBorderWidth: widget.primaryBorderWidth,
              secondaryBorderWidth: widget.secondaryBorderWidth,
            ),
          )
        );
      },
    );
  }
}
class _MyRadialProgress extends CustomPainter {
  final double percentage;
  final double primaryBorderWidth;
  final double secondaryBorderWidth;
  final Color primaryColor;
  final Color secondaryColor;
  _MyRadialProgress( {  
    required this.percentage, 
    required this.primaryBorderWidth, 
    required this.secondaryBorderWidth, 
    required this.primaryColor,
    required this.secondaryColor,
  } );
  @override
  void paint(Canvas canvas, Size size) {
    const Gradient gradient = LinearGradient(colors: [
      Color(0xffC012FF),
      Color(0xff6D05E8),
      Colors.redAccent
    ]); 
    final Rect rect = Rect.fromCircle(
      center: const Offset(0,0), 
      radius: 180
    );
    // * circle painted
    final  paint = Paint()
      ..strokeWidth = secondaryBorderWidth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;
    final center = Offset( size.width * 0.5, size.height * 0.5 );
    final radius = min( size.width * 0.5 , size.height * 0.5 );
    canvas.drawCircle( center , radius, paint);

    // * arc painted
    final  paintArc = Paint()
      ..strokeWidth = primaryBorderWidth
      ..strokeCap = StrokeCap.round
      // ..color = primaryColor
      ..shader = gradient.createShader( rect )
      ..style = PaintingStyle.stroke;
    
    double arcAngle = 2 * pi * (percentage  / 100); 

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius), 
      ( -pi / 2 ), 
      arcAngle, 
      false, 
      paintArc
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}