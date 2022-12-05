
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HeaderSquare extends StatelessWidget {

const HeaderSquare({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );  
  }
}

class HeaderRounderBorder extends StatelessWidget {

const HeaderRounderBorder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
      color: const Color(0xff615AAB),
        borderRadius: BorderRadius.only( 
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
        )
      ),
    );  
  }
}

class HeaderDiagonalSquare extends StatelessWidget {

const HeaderDiagonalSquare({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalHeader() ,
      ),
    );  
  }
}
class _HeaderDiagonalHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 2;
    final path = Path();
    path.moveTo(0, size.height * 0.35); 
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderTriangleSquare extends StatelessWidget {

const HeaderTriangleSquare({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangleHeader() ,
      ),
    );  
  }
}
class _HeaderTriangleHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 2;
    final path = Path();
    path.moveTo(0, 0); 
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderTriangle2Square extends StatelessWidget {

const HeaderTriangle2Square({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangle2Header() ,
      ),
    );  
  }
}
class _HeaderTriangle2Header extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;
    final path = Path();
    path.moveTo(0, 0); 
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(0, size.height * 0.25);
    // path.lineTo(size.width, size.height);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderCurve extends StatelessWidget {

const HeaderCurve({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurve() ,
      ),
    );  
  }
}
class _HeaderCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;
    final path = Path();
    path.moveTo(0, 0); 
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo((size.width * 0.5), (size.height * 0.39), size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderCurve2 extends StatelessWidget {

const HeaderCurve2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurve2() ,
      ),
    );  
  }
}
class _HeaderCurve2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;
    final path = Path();
    // path.moveTo(0, 0); 
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo((size.width * 0.25), (size.height * 0.30), size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo((size.width * 0.75), (size.height * 0.20), size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}


class HeaderCurve3 extends StatelessWidget {
final Color color;
const HeaderCurve3({Key? key, this.color = Colors.purple}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurve3( color:  color) ,
      ),
    );  
  }
}
class _HeaderCurve3 extends CustomPainter {
  final Color color;

  _HeaderCurve3({ required this.color  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: Offset(150, 50),
      radius: 180
    );
    // const Gradient gradient = LinearGradient(colors: [
    //   Color(0xff6d05fa),
    //   Color(0xffc012ff),
    //   Color(0xff6d05fa),
    // ]);
    // final pencil = Paint()..shader =  gradient.createShader(rect);
    final pencil = Paint()..color =  color;
    pencil.color = color;
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;
    final path = Path();
    // path.moveTo(0, 0); 
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo((size.width * 0.25), (size.height * 0.30), size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo((size.width * 0.75), (size.height * 0.20), size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}


// * medical


class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title; 
  final String subTitle;
  final Color color1; 
  final Color color2; 
  const IconHeader({Key? key,
    this.icon = FontAwesomeIcons.plus,
    this.title = 'Get requested' ,
    this.subTitle = 'Medical assistant',
    this.color1 = const Color(0xff536CF6),
    this.color2 = const Color(0xff66A9F2),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Color whiteColor = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackground( color1: color1, color2: color2,),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(icon, size: 250, color: Colors.white.withOpacity(0.2),),
        ),
        Column(
          children: [
            const SizedBox(height: 80, width: double.infinity,),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: whiteColor
              )
            ),
            const SizedBox(height: 20,),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: whiteColor
              )
            ),
            const SizedBox(height: 20,),
            FaIcon( icon, size: 80, color: Colors.white,)

          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1; 
  final Color color2; 
  const _IconHeaderBackground({
    Key? key,
    this.color1 = const Color(0xff536CF6),
    this.color2 = const Color(0xff66A9F2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only( bottomLeft: Radius.circular(80) ),
        gradient: LinearGradient(
          colors: [
            color1,
            color2
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
   );
  }
}