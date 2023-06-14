import 'package:brain_school/screens/home_screen/events.dart';
import 'package:flutter/material.dart';

class Googlemap extends StatelessWidget {
  const Googlemap({super.key});
  static const String routeName = 'GoogleMap';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.amber),
          onPressed: () {
            MapUtils.openMap(28.474388, 77.503990);
          },
          child:
              Text('Open Google Maps', style: TextStyle(color: Colors.white)),
        ),
      ),
    ));
  }
}
