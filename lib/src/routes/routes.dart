import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:desing_app/src/chaleng/square_animate_page.dart';
import 'package:desing_app/src/pages/emergenci_page.dart';
import 'package:desing_app/src/pages/graphics_circles_page.dart';
import 'package:desing_app/src/pages/headers_pages.dart';
import 'package:desing_app/src/pages/pinterest_page.dart';
import 'package:desing_app/src/pages/slider_list_page.dart';
import 'package:desing_app/src/pages/slidesshow_page.dart';

final pageRoutes = < _Routes >[
  _Routes(icon: FontAwesomeIcons.slideshare, title: 'SlidesShow', page: const SlidesShowPage()),
  _Routes(icon: FontAwesomeIcons.truckMedical, title: 'EMergency', page: const EmergencyPage()),
  _Routes(icon: FontAwesomeIcons.heading, title: 'Headers', page: const HeaderPage()),
  _Routes(icon: FontAwesomeIcons.peopleCarryBox, title: 'Animated Box', page: const SquareAnimatePage()),
  _Routes(icon: FontAwesomeIcons.circleNotch, title: 'Progress bar', page: const GraphicsCirclesPage()),
  _Routes(icon: FontAwesomeIcons.pinterest, title: 'Piterest', page: const PinterestPage()),
  _Routes(icon: FontAwesomeIcons.mobile, title: 'Slivers', page: const SliderListPage()),
];

class _Routes {
  
  final IconData icon;
  final String title;
  final Widget page;

  _Routes({
    required this.icon,
    required this.title,
    required this.page
  });


}