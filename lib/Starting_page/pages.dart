import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';


class Pages extends StatelessWidget {


  final String photo;
  final String heading;
  final String text;


  const Pages({super.key,required this.photo,required this.heading ,required this.text });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
         Container(
           alignment: Alignment.center,
           width: double.infinity,
           height: 300,
           child: Image(image: AssetImage('assets/images/Starting_page/$photo.png'),fit: BoxFit.cover,alignment: Alignment.center,),
         ),
          Text(heading,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 35,color: Pallet.heading),textAlign: TextAlign.center,),
          Text(text,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
