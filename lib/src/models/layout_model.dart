import 'package:desing_app/src/pages/slidesshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = const SlidesShowPage();

  Widget get currentPage => _currentPage;

  set currentPage ( Widget page ) {
    _currentPage = page;
    notifyListeners();
  }   
  
}