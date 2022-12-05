
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData iconData;
  PinterestButton({required this.onPressed, required this.iconData});
}

class PinterestMenu extends StatelessWidget {
  final bool showMenu;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;
  PinterestMenu({Key? key, 
    this.showMenu = true,
    required this.items,
    this.backgroundColor = Colors.white,
    this.activeColor     = Colors.black,
    this.inactiveColor   = Colors.blueGrey
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),
      child: AnimatedOpacity(
        opacity: showMenu ? 1 : 0 ,
        duration: const Duration( milliseconds: 250 ),
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context, listen: false).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context, listen: false).activeColor = activeColor;
            Provider.of<_MenuModel>(context, listen: false).inactiveColor = inactiveColor;
            return  _PinterestMenuBackground(
              child: _MenuItems(
                menuItems: items,
              ),
            );
          },
        )
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: const [
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  const _MenuItems({Key? key, required this.menuItems}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length,
            (index) => _PinerestMenuItem(
                index: index, pinterestButton: menuItems[index])));
  }
}

class _PinerestMenuItem extends StatelessWidget {
  final int index;
  final PinterestButton pinterestButton;
  const _PinerestMenuItem(
      {Key? key, required this.index, required this.pinterestButton})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final menuModel = Provider.of<_MenuModel>(context);
    return GestureDetector(
        onTap: () {
          Provider.of<_MenuModel>(context, listen: false).selectedItem = index;
          pinterestButton.onPressed();
        },
        behavior: HitTestBehavior.translucent,
        child: Icon(
          pinterestButton.iconData,
          size: menuModel.selectedItem == index ? 32 : 25,
          color: menuModel.selectedItem == index ? menuModel.activeColor : menuModel.inactiveColor,
        ));
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedItem = 0;
  Color _backgroundColor  = Colors.white;
  Color _activeColor      = Colors.black;
  Color _inactiveColor    = Colors.blueGrey;
  int get selectedItem => _selectedItem;
  set selectedItem(int index) {
    _selectedItem = index;
    notifyListeners();
  }
  Color get backgroundColor => _backgroundColor;
  set backgroundColor(Color backgroundColor) {
    _backgroundColor = backgroundColor;
  }
  Color get activeColor => _activeColor;
  set activeColor(Color activeColor) {
    _activeColor = activeColor;
  }
  Color get inactiveColor => _inactiveColor;
  set inactiveColor(Color inactiveColor) {
    _inactiveColor = inactiveColor;
  }
}
