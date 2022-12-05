import 'package:desing_app/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SliderListPage extends StatelessWidget {
  const SliderListPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _ListTask()
      // body: _Title()
      body: Stack(
        children: [
          _MainScroll(),
          const Positioned(
            bottom: 0,
            right: 0,
            child: _ButtonNewList()
          ),
        ],
      ),

    );
  }
}


class _ButtonNewList extends StatelessWidget {

const _ButtonNewList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
    return ButtonTheme(
      minWidth: size.width * 0.9,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            appTheme.darkTheme? appTheme.currentTheme.colorScheme.secondary : const Color(0xffED6762)
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only( topLeft: Radius.circular(50))
            )
          )
        ),
        onPressed: () {
          
        },
        child: SizedBox(
          height: size.height * 0.1,
          width:  size.width * 0.7,
          child: Center(
            child: Text(
              'Create a new list',
              style: TextStyle(
                color: appTheme.currentTheme.scaffoldBackgroundColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
              )
            ),
          ),
        ),
      )
    );
  }
}

class _MainScroll extends StatelessWidget {
final items = [
    const _ListItem( title: 'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title: 'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title: 'Books', color: Color(0xffFCEBAF) ),
    const _ListItem( title: 'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title: 'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title: 'Books', color: Color(0xffFCEBAF) ),
    const _ListItem( title: 'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title: 'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title: 'Books', color: Color(0xffFCEBAF) ),
    const _ListItem( title: 'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title: 'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title: 'Books', color: Color(0xffFCEBAF) ),
  ];
 _MainScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: _Title(),
        // ),


        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color:  appTheme.scaffoldBackgroundColor,
              child: const _Title(),
            )
          )
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100,),
          ])
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return   SizedBox.expand( child: child);
  }

  @override
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;

  @override
  double get minExtent => (minHeight < maxHeight) ? minHeight : maxHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return  maxHeight != oldDelegate.maxHeight 
      ||  minHeight != oldDelegate.minHeight 
      ||  child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {

const _Title({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Column(
      children: [
        const SizedBox(height: 30,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle( 
              color: appTheme.darkTheme ? Colors.grey : const Color(0xff532128), 
              fontSize: 50 
            )
          ),
        ),
        Stack(
          children: [
            const SizedBox(width: 100,),
            Positioned(
              bottom: 8,
              child: Container(
                width: 128,
                height: 8,
                color: appTheme.darkTheme ? Colors.grey : const Color(0xffF7CDD5),
              ),
            ),
            const Text(
              'List',
              style: TextStyle( color: Color(0xffD93A30), fontWeight: FontWeight.bold, fontSize: 50 )
            ),
          ],
        )
      ],
    );
  }
}

class _ListTask extends StatelessWidget {
  _ListTask({
    Key? key,
  }) : super(key: key);
  final items = [
    const _ListItem( title: 'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title: 'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title: 'Books', color: Color(0xffFCEBAF) ),
    const _ListItem( title: 'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title: 'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title: 'Books', color: Color(0xffFCEBAF) ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder:(context, index) => items[index]
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;
  const _ListItem({
    Key? key,
    required this.title,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      alignment: Alignment.centerLeft,
      height: 130,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: appTheme.darkTheme ? Colors.grey : color,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Text(
        title,
        style: const TextStyle( 
          color: Colors.white, 
          fontWeight: FontWeight.bold, 
          fontSize: 20
        )
      ),
    );
  }
}