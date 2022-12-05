import 'package:desing_app/src/theme/theme_changer.dart';
import 'package:desing_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class GraphicsCirclesPage extends StatefulWidget {
  const GraphicsCirclesPage ({Key? key}) : super(key: key);

  @override
  State<GraphicsCirclesPage> createState() => _GraphicsCirclesPageState();
}

class _GraphicsCirclesPageState extends State<GraphicsCirclesPage> {
  double  percentage = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percentage += 10;
            if ( percentage > 100 ) {
              percentage = 0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               CustomRadialProgress(percentage: percentage,color: Colors.cyanAccent,),
               CustomRadialProgress(percentage: percentage,color: Colors.pinkAccent,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               CustomRadialProgress(percentage: percentage * 1, color: Colors.purpleAccent,),
               CustomRadialProgress(percentage: percentage * 1.2, color: Colors.blueAccent,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               CustomRadialProgress(percentage: percentage * 1.4, color: Colors.greenAccent,),
               CustomRadialProgress(percentage: percentage * 1.6, color: Colors.orangeAccent,),
            ],
          ),
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key? key,
    required this.percentage,
    required this.color,
  }) : super(key: key);

  final double percentage;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      width: 180,
      height: 180,
      child: RadialProgress( 
        percentage: percentage,
        primaryColor: color,
        secondaryColor: appTheme.textTheme.bodyText1!.color!,
      ),
      // child: Text('$percentage%', style: const TextStyle( fontSize: 50),),
    );
  }
}