import 'package:E_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home',style: TextStyle(color: Pallet.heading),),backgroundColor: Colors.transparent,),
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 600,
          height: 100,
          decoration: BoxDecoration(
            color: Pallet.transparent
          ),
          child: Text('Home page'),
        ),
      ),
    );
  }
}
