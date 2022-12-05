import 'package:desing_app/src/models/layout_model.dart';
import 'package:desing_app/src/pages/launcher_page.dart';
import 'package:desing_app/src/pages/launcher_tablet_page.dart';
import 'package:desing_app/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  // ChangeNotifierProvider(
  //   create:,
  //   child: const MyApp(  )
  // )
  MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create:  ( _ ) => ThemeChanger( 2 )),
      ChangeNotifierProvider<LayoutModel>(create:  ( _ ) => LayoutModel())
    ],
    child: const MyApp(),
  )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: themeMode,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: SquareAnimatePage()
      home: OrientationBuilder(
        builder: (context, orientation) {
          // return const LauncherPage();
          final screenSize = MediaQuery.of(context).size;
          if ( screenSize.width > 500 ) {
            return const LauncherTabletPage();
          } else {
            return const LauncherPage();
          }
        },
      )
    );
  }
}