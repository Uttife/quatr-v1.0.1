import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final bool hidePassword;


  const MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.remove_red_eye,
    this.hidePassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 500,
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: TextFormField(

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              } else {
                null;
              }
            },
            controller: myController,
            decoration: InputDecoration(
                labelText: fieldName,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade300),
                ),
                labelStyle: const TextStyle(color: Colors.black)),

          ),
        ),
      ),
    );
  }
}
