import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:desing_app/src/models/slider_model.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => SliderModel(),
      child: Scaffold(
          body: Center(
        child: Column(
          children: const [
            Expanded(child: _Slides()),
            _Dots(),
          ],
        ),
      )),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Dot(
              index: 0,
            ),
            _Dot(
              index: 1,
            ),
            _Dot(
              index: 2,
            ),
          ],
        ));
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sliderModelProvider = Provider.of<SliderModel>(context);
    return AnimatedContainer(
      duration: const Duration( milliseconds: 200 ),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration:
          BoxDecoration(
            color: sliderModelProvider.currentPage >= (index - 0.5 )
                && sliderModelProvider.currentPage < (index + 0.5) 
                  ?Colors.blue 
                  : Colors.grey, 
            shape: BoxShape.circle
      ),
    );
  }
}

// SvgPicture.asset( 'assets/svgs/slide1.svg' )
class _Slides extends StatefulWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<SliderModel>( context, listen: false).currentPage = pageViewController.page ?? 0.0;
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
      children: const [
        _Slide(
          imageSvg: 'assets/svgs/slide1.svg',
        ),
        _Slide(imageSvg: 'assets/svgs/slide2.svg'),
        _Slide(imageSvg: 'assets/svgs/slide3.svg'),
      ],
    ));
  }
}

class _Slide extends StatelessWidget {
  final String imageSvg;
  const _Slide({Key? key, required this.imageSvg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: SvgPicture.asset(imageSvg));
  }
}
