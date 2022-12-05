import 'package:desing_app/src/theme/theme_changer.dart';
import 'package:desing_app/src/widgets/slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final List< Widget > slides = [
      SvgPicture.asset( 'assets/svgs/slide1.svg' ),
      SvgPicture.asset( 'assets/svgs/slide2.svg' ),
      SvgPicture.asset( 'assets/svgs/slide3.svg' ),
      SvgPicture.asset( 'assets/svgs/slide4.svg' ),
      SvgPicture.asset( 'assets/svgs/slide5.svg' ),
      const Center(child: Text('other widget')),
      Container(
        width: 200,
        height: 200,
        color: Colors.blueGrey,
      )
    ];
    bool isLarge;
    if ( MediaQuery.of(context).size.height > 500 ) {
      isLarge = true;
    } else {
      isLarge = false;
    }
    final children = [
      Expanded(
        child: _MySlideShow(slides: slides)
      ),
      Expanded(
        child: _MySlideShow(slides: slides)
      ),
    ];
    return Scaffold(
      body: isLarge 
      ? Column( children: children,)
      : Row( children: children,)
    );
  }
}

class _MySlideShow extends StatelessWidget {
  const _MySlideShow({
    Key? key,
    required this.slides,
  }) : super(key: key);

  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final appTheme = themeChanger.currentTheme;
    return SlideShow(
      // dotsUp: true,
      primaryBullet: 18,
      secondaryBullet: 12,
      primaryColor: themeChanger.darkTheme ? appTheme.colorScheme.secondary : const Color(0xffFF5A7E),
      secondaryColor: Colors.black45,
      slides: slides,
    );
  }
}