import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final  Function() onPressed;
  final String text;
  final IconData icons;

  const HomeButton({required this.onPressed,required this.text,required this.icons});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 70,
      child: ElevatedButton(

          onPressed:onPressed ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,style: TextStyle(fontSize: 20),),
            ],
          )),
    );
  }
}
