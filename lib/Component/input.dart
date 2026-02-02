import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {

  final String label;
  final TextEditingController controller;
  final bool? isPassword;

  const Input({super.key,required this.label, required this.controller, this.isPassword});




  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {

   bool password = true;

  @override
  Widget build(BuildContext context) {

    final bool isPass = widget.isPassword ?? false;


    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: RadialGradient(
          radius: 20,
          colors: [
            Color(0xff3a2815),
            Colors.white
          ],
        )
      ),
      child: TextFormField(
        controller: widget.controller,
        autocorrect: true,
        style: TextStyle(color: Colors.white,fontSize: 20),
        obscureText: isPass && password ,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(20))),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.white),
          suffixIcon: isPass ? IconButton(
            onPressed: (){
              setState(() {
                password = !password;
              });
            },
            icon:  Icon(
              password ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: Colors.white,
            size: 29,)
               ): null
        ),
      ),
    );
  }
}
