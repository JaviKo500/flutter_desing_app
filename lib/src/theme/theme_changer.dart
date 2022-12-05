import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {



  ThemeChanger( int theme) {
    switch(theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme =  ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            secondary: Colors.pink
          ),
        );
      break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme =  ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            secondary: Colors.pink
          ),
        );
      break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        // _currentTheme =  ThemeData.dark();
      break;
      default:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme =  ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            secondary: Colors.pink
          ),
        );;
    }
  }
  
  bool _darkTheme = false;
  bool _customTheme = false;
  late ThemeData _currentTheme;
  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  set darkTheme( bool value ) {
    _customTheme = false;
    _darkTheme = value;
    if ( value ) {
      _currentTheme = ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            secondary: Colors.pink
          ),
        );
    } else {
      _currentTheme = ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            secondary: Colors.pink
          ),
        );
    }
    notifyListeners();
  }
  set customTheme( bool value ) {
    _darkTheme = false;
    _customTheme = value;
    if ( value ) {
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          secondary: Color(0xff48A0EB)
        ),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: const Color( 0xff16202B),
        textTheme: const TextTheme( bodyText1: TextStyle(
          color: Colors.white,
        ))
      );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}