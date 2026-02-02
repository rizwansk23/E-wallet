import 'package:flutter/material.dart';

void showSheet(BuildContext context){
  showModalBottomSheet(
      context: context,
      builder: (context){
        return Container(
          width: double.infinity,
          child: Column(
            children: [
                Text('hello')
            ],
          ),
        );
      });
}