import 'package:firebase_sample_app/Components/constants.dart';
import 'package:flutter/material.dart';


class TextFieldContainer extends StatelessWidget {

  final Widget child;
  const TextFieldContainer({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
        color: kBeigeColor,
        borderRadius: BorderRadius.circular(29)
      ),
      child: child,
    );
  }
}