import 'package:flutter/material.dart';
import '../../../commom_widgets/my_button.dart';
import '../login/login_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recover  Password'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Text("Lets get you back in quick!",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            MyButton(
                text: "Done",
                onpress: () {
                  //authenticate here

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                })
          ],
        ),
      ),
    );
  }
}
