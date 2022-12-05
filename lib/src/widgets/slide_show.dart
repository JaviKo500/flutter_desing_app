import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SlideShow extends StatelessWidget {
  final List< Widget > slides;
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;
  const SlideShow ({
    Key? key,
    required this.slides,
    this.dotsUp = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 12,
    this.secondaryBullet = 12
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: ( _ ) => _SliderShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (context) {
              Provider.of<_SliderShowModel>(context).primaryColor = primaryColor;
              Provider.of<_SliderShowModel>(context).secondaryColor = secondaryColor;
              Provider.of<_SliderShowModel>(context).primaryBullet = primaryBullet;
              Provider.of<_SliderShowModel>(context).secondaryBullet = secondaryBullet;
              
              return _StructureSliderShow(dotsUp: dotsUp, slides: slides);
            },
          )
        ),
      ),
    );
  }
}

class _StructureSliderShow extends StatelessWidget {
  const _StructureSliderShow({
    Key? key,
    required this.dotsUp,
    required this.slides,
  }) : super(key: key);

  final bool dotsUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if ( dotsUp )
          _Dots( 
            totalSlides: slides.length,
          ),
        Expanded(child: _Slides( slides: slides,)),
        if ( !dotsUp )
          _Dots( 
            totalSlides: slides.length,
          ),
      ],
    );
  }
}


class _Dots extends StatelessWidget {
  final int totalSlides;
  const _Dots({
    Key? key, 
    required this.totalSlides,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate( totalSlides, ( index ) => _Dot(
              index:  index,
            ),
          )
        ));
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({Key? key, 
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sliderModelProvider = Provider.of<_SliderShowModel>(context);
    final Color color;
    final double size;
     if (sliderModelProvider.currentPage >= (index - 0.5 ) 
      && sliderModelProvider.currentPage < (index + 0.5)) {
        color = sliderModelProvider.primaryColor;
        size = sliderModelProvider.primaryBullet;
    } else {
        color = sliderModelProvider.secondaryColor;
        size = sliderModelProvider.secondaryBullet;
    }

    return AnimatedContainer(
      duration: const Duration( milliseconds: 200 ),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration:
          BoxDecoration(
            color: color, 
            shape: BoxShape.circle
      ),
    );
  }
}

// SvgPicture.asset( 'assets/svgs/slide1.svg' )
class _Slides extends StatefulWidget {
  final List< Widget > slides;
  const _Slides({
    Key? key,
    required this.slides
  }) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SliderShowModel>( context, listen: false).currentPage = pageViewController.page ?? 0.0;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
      controller: pageViewController,
      children: widget.slides.map(( slide ) =>  _Slide(slide: slide)).toList()
    ));
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide({Key? key, required this.slide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: slide
    );
  }
}


class _SliderShowModel extends ChangeNotifier {
  
  double _currentPage = 0;
  Color  _primaryColor = Colors.blue;
  Color  _secondaryColor = Colors.grey;
  late double _primaryBullet;
  late double _secondaryBullet;
  double get currentPage => _currentPage;
  set currentPage( double newPage ) {
    _currentPage = newPage;
    notifyListeners();
  }
  Color get primaryColor => _primaryColor;
  set primaryColor( Color color ) {
    _primaryColor = color;
  }
  Color get secondaryColor => _secondaryColor;
  set secondaryColor( Color color ) {
    _secondaryColor = color;
  }

  double get primaryBullet => _primaryBullet;
  set primaryBullet( double bullet ) {
    _primaryBullet = bullet;
  }
  double get secondaryBullet => _secondaryBullet;
  set secondaryBullet( double bullet ) {
    _secondaryBullet = bullet;
  }
}