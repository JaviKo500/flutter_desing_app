import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FatButton extends StatelessWidget {
  final IconData icon;
  final String title; 
  final Color color1; 
  final Color color2;
  final Function()? onPressed;
  const FatButton ({
    Key? key,
    required this.title,
    required this.onPressed,
    this.icon = FontAwesomeIcons.carBurst,
    this.color1 =const Color(0xff6989F5),
    this.color2 =const Color(0xff906EF5),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          _FatButtonBackground(
            icon: icon,
            color1: color1,
            color2: color2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 145, width: 40,),
              FaIcon( icon, size: 40, color: Colors.white,),
              SizedBox(width: 20,),
              Expanded(child: Text(title, style: TextStyle( color: Colors.white, fontSize: 18),)),
              FaIcon( FontAwesomeIcons.chevronRight, color: Colors.white,),
              SizedBox(width: 40,),
    
            ],
          )
        ],
      ),
    );
  }
}

class _FatButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color color1; 
  final Color color2;
  const _FatButtonBackground({
    Key? key,
    this.icon = FontAwesomeIcons.carBurst,
    this.color1 =const Color(0xff6989F5),
    this.color2 =const Color(0xff906EF5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow( 
            color: Colors.black.withOpacity(0.2), 
            offset: const Offset(4,6),
            blurRadius: 10
          )
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            color1,
            color2
          ]
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon( icon, size: 150, color: Colors.white.withOpacity(0.2),),
            )
          ],
        ),
      ),

    );
  }
}