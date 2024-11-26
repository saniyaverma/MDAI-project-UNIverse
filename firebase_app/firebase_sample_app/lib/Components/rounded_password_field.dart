import 'package:firebase_sample_app/Components/constants.dart';
import 'package:firebase_sample_app/Components/text_field_container.dart';
import 'package:flutter/material.dart';


class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    super.key, required this.onChanged, required TextEditingController controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText : "Enter Your Password",
        hintStyle: TextStyle(color: Color.fromARGB(193, 85, 39, 1)),
        icon: Icon(Icons.lock, color: kPrimaryColor,),
        suffixIcon: Icon(Icons.visibility , color: kPrimaryColor,),
        border: InputBorder.none,
        
      ),
    ));
  }
}
