import 'package:desing_app/src/theme/theme_changer.dart';
import 'package:desing_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),
      child: Scaffold(
        // body: _PinterestGrid(),
        // body: PinterestMenu(),
        body: Stack(
          alignment: Alignment.center,
          children: [
            _PinterestGrid(), 
            const _PinterestMenuLocation()
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showMenu = Provider.of<_MenuModel>(context).showMenu;
    final themeChanger = Provider.of<ThemeChanger>(context);
    final appTheme = themeChanger.currentTheme;
    return Positioned(
      bottom: 30,
      child: PinterestMenu(
        backgroundColor: appTheme.scaffoldBackgroundColor,
        activeColor: appTheme.colorScheme.secondary,
        inactiveColor: Colors.white38,
        items: [
          PinterestButton(
              onPressed: () => print('Icon pie_chart'), iconData: Icons.pie_chart),
          PinterestButton(
              onPressed: () => print('Icon search'), iconData: Icons.search),
          PinterestButton(
              onPressed: () => print('Icon notifications'),
              iconData: Icons.notifications),
          PinterestButton(
              onPressed: () => print('Icon supervised_user_circle'),
              iconData: Icons.supervised_user_circle),
        ],
        showMenu: showMenu,
      ),
    );
  }
}

class _PinterestGrid extends StatefulWidget {
  _PinterestGrid({Key? key}) : super(key: key);

  @override
  State<_PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<_PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double beforeScroll = 0;
  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > (beforeScroll) && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).showMenu = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).showMenu = true;
      }
      beforeScroll = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    bool isLarge;
    if ( MediaQuery.of(context).size.width > 500 ) {
      count = 3;
    } else {
      count = 2;
    }
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (context, index) => _PinterestItem(
        index: index,
      ),
      staggeredTileBuilder: (index) =>
          StaggeredTile.count(1, index.isEven ? 2 : 3), 
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            '$index',
          ),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _showMenu = true;
  bool get showMenu => _showMenu;
  set showMenu(bool showMenu) {
    _showMenu = showMenu;
    notifyListeners();
  }
}
