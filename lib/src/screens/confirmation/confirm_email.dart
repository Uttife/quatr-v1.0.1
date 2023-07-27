import 'package:Quatr/src/common_widgets/my_button.dart';
import 'package:Quatr/src/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class EmailConfirmationScreen extends StatelessWidget {
  const EmailConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Confirm Your Email Address'), centerTitle: true),
        body: Center(
        child: Column(
        children: [
        Text("Confirm Mail!",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    SizedBox(height: 20),
    MyButton(text: "Done", onpress: (){
    //authenticate here

    Navigator.push(context,
    MaterialPageRoute(builder: (context) {
    return LoginScreen();
    }));
    }


  )

  ]

  ,

  )

  ,

  )

  ,

  );
}}
