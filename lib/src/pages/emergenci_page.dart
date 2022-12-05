import 'package:animate_do/animate_do.dart';
import 'package:desing_app/src/widgets/fat_button.dart';
import 'package:desing_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class EmergencyPage extends StatelessWidget {
  const EmergencyPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
    ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
    ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
    ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
    ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
    ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
    ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
    ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
    ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
    ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
    ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
    ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
    ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
  ];
    List< Widget > itemsMap = items.map((item) => FadeInLeft(
      child: FatButton(
        title: item.text, 
        onPressed: () => print(item.text),
        icon: item.icon,
        color1: item.color1,
        color2: item.color2,
      ),
    )).toList();

    bool isLarge;
    if ( MediaQuery.of(context).size.height > 550 ) {
      isLarge = true;
    } else {
      isLarge = false;
    }
    return Scaffold(
      // backgroundColor: Colors.redAccent,
      // body: _PageHeader(),
      // body: _FatButtonTemp()
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: isLarge ? 220 : 10),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: isLarge ?  80:  5,),
                ...itemsMap
              ],
            ),
          ),
          if( isLarge )
            const _PageHeader(),
        ],
      ),
    );
  }
}

class ItemBoton {

  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.text, this.color1, this.color2 );
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(),
        Positioned(
          top: 30,
          right: 0,
          child: RawMaterialButton(
            onPressed: () {
              
            },
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            child: const FaIcon(FontAwesomeIcons.ellipsisVertical, color: Colors.white,)
          ),
        )
      ],
    );
  }
}