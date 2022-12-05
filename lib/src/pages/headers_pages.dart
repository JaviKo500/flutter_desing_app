import 'package:desing_app/src/theme/theme_changer.dart';
import 'package:desing_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HeaderPage extends StatelessWidget {

const HeaderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      // body: HeaderSquare(),
      // body: HeaderRounderBorder(),
      // body: HeaderDiagonalSquare(),
      // body: HeaderCurve2(),
      body: HeaderCurve3( color:  appTheme.colorScheme.secondary ),
   );
  }
}