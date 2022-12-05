import 'package:desing_app/src/models/layout_model.dart';
import 'package:desing_app/src/pages/slidesshow_page.dart';
import 'package:desing_app/src/routes/routes.dart';
import 'package:desing_app/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final layoutPage = Provider.of<LayoutModel>(context);
    final  appTheme = themeChanger.currentTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.colorScheme.secondary,
        title: const Text(
          'Flutter Design Tablet',
          style: TextStyle()
        ),
      ),
      drawer: _MainMenu(),
      // body: _OptionList()
      body: Row(
        children: [
          Container(
            width: 300,
            height: double.infinity,
            child: const _OptionList(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: themeChanger.darkTheme ? Colors.grey : appTheme.colorScheme.secondary,
          ),
          Expanded(
            child: layoutPage.currentPage
          )

        ],
      ),
    );
  }
}


class _OptionList extends StatelessWidget {

const _OptionList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final layoutPage = Provider.of<LayoutModel>(context);
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: appTheme.primaryColorLight,
      ), 
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon( pageRoutes[index].icon, color: appTheme.colorScheme.secondary,),
        title: Text( pageRoutes[index].title),
        trailing: Icon( Icons.chevron_right, color: appTheme.colorScheme.secondary,),
        onTap: () {
          layoutPage.currentPage = pageRoutes[index].page;
        },
      )
    );
  }
}


class _MainMenu extends StatelessWidget {

const _MainMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final  appTheme = themeChanger.currentTheme;
    return Drawer(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: appTheme.colorScheme.secondary,
                  child: const Text(
                    'JK',
                    style: TextStyle( fontSize: 50, color: Colors.white,)
                  ),
                ),
              ),
              const Expanded(
                child: _OptionList()
              ),
              ListTile(
                leading: Icon(Icons.lightbulb_outline, color: appTheme.colorScheme.secondary,),
                title: const Text('Dark Mode'),
                trailing: Switch.adaptive(
                  value: themeChanger.darkTheme, 
                  activeColor: appTheme.colorScheme.secondary,
                  onChanged: (value) {
                    themeChanger.darkTheme = value;
                  },
                ),
              ),
              SafeArea(
                bottom: true,
                top: false,
                left: false,
                right: false,
                child: ListTile(
                  leading: Icon(Icons.add_to_home_screen, color:  appTheme.colorScheme.secondary,),
                  title: const Text('Custom theme'),
                  trailing: Switch.adaptive(
                    value: themeChanger.customTheme, 
                    activeColor:  appTheme.colorScheme.secondary,
                    onChanged: (value) {
                      themeChanger.customTheme = value;
                    },
                  ),
                ),
              ),
            ],
          )
         ),
      ),
    );
  }
}