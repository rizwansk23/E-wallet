import 'package:flutter/material.dart';

class Pallet{
  static const Color background =  Color(0xff3a2815);
  static const RadialGradient back = RadialGradient(
    center: AlignmentGeometry.centerLeft,
      radius: 1.4,
      colors:[
        Color(0xff473819),
        Color(0xff3a2815),


      ],
    stops: [0,0.5]

  );
  static const RadialGradient textfeild = RadialGradient(
      center: AlignmentGeometry.center,
      radius: 10,
      colors:[
        Colors.transparent,
        // Colors.white,
        Colors.white38,


      ],
      stops: [0,0.5]

  );
  static const Color heading = Colors.white;
  static const Color text = Colors.grey;
  static const Color yellow = Color(0xfff5ed31);
  static const Color black = Color(0xff191613);
  static const Color transparent = Color(0xff655036);

}