import 'package:Quatr/src/features/screens/confirmation/confirm_email.dart';
import 'package:Quatr/src/features/screens/login/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../commom_widgets/my_button.dart';
import '../../../commom_widgets/my_text_field.dart';
import '../confirmation/confirm_email.dart';
import '../login/login_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final _cPasswordController = TextEditingController();

  late bool _passwordVisible = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // leading: Icon(Icons.arrow_back_ios_new_outlined),
        title: Text("Create acount",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left:20.0, right: 20),
          child: Container(
           // constraints: BoxConstraints.tightForFinite(width: 450, height: MediaQuery.of(context).size.height),
            //color: Colors.blue,
            padding: EdgeInsets.only(left: 10.0, right: 10),
            child: ListView(
              padding: EdgeInsets.zero,
             // mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Let's Get you an Account!", style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30) ,),
                    ),
                   // Container(height: 1, color: Colors.black, width: 500),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: Text("With a few details, create a Quatr profile. Your password must have at least 8 characters including letters and a number.", style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black,  fontSize: 15, ) ,),
                    ),


                  ],
                ),

                Form(
                  key: _formKey,
                  child: Column(children: [

                    SizedBox(height: 10,),
                    MyTextField(
                      fieldName: "Email address",
                      myController: _emailController,
                    ),

                    SizedBox(height: 10),

                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
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
                                controller: _passwordController ,
                                decoration: InputDecoration(
                                    labelText: "Password" ,
                                    suffixIcon: IconButton(
                                      icon: Icon(_passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(
                                              () {
                                            _passwordVisible = !_passwordVisible;
                                          },
                                        );
                                      },
                                    ),
                                    suffixIconColor: Colors.black87,
                                    border: const OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green.shade300),
                                    ),
                                    labelStyle: const TextStyle(color: Colors.black)),
                                obscureText: _passwordVisible ,

                              ),
                            ),
                          ),

                        ],

                      ),

                    ),

                    SizedBox(height: 10),

                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
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
                                controller: _cPasswordController ,
                                decoration: InputDecoration(
                                    labelText: "Confirm password" ,
                                    suffixIcon: IconButton(
                                      icon: Icon(_passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(
                                              () {
                                            _passwordVisible = !_passwordVisible;
                                          },
                                        );
                                      },
                                    ),
                                    suffixIconColor: Colors.black87,
                                    border: const OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green.shade300),
                                    ),
                                    labelStyle: const TextStyle(color: Colors.black)),
                                obscureText: _passwordVisible ,

                              ),
                            ),
                          ),

                        ],

                      ),

                    ),
                  ]),
                ),

                SizedBox(height: 20),

                MyButton(text: "Sign up", color: Colors.green, width: 500,
                onpress: () {
                  if (_formKey.currentState!.validate()) {
                    //authenticate here

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return EmailConfirmationScreen();
                        }));
                  }
                },),

                SizedBox(height: 10,),

                Text("By clicking \"Sign up\" you agree to our Terms and Conditions and Privacy Policy.", style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15, ) ,),

                SizedBox(height: 10),

                Text.rich(
                    TextSpan(
                        text: 'Terms & Conditions',style: TextStyle( decoration: TextDecoration.underline, color: Colors.green),
                      recognizer: TapGestureRecognizer()
                        ..onTap = ()async {
                          // Handle the tap action here
                          final Uri _url = Uri.parse('https://quatr/terms.com');
                          if (!await launchUrl(_url)) {
                            throw  Exception('Could not launch $_url');
                          }
                        },
                        children: [
                        TextSpan(
                        text: ' and ', style: TextStyle(decoration: TextDecoration.none, color: Colors.black)),
                    TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          // Handle the tap action here
                          final Uri _url = Uri.parse('https://quatr/privacy.com');
                          if (!await launchUrl(_url)) {
                            throw  Exception('Could not launch $_url');
                          }
                        },
                    ),

                    ],
                  ),
                ),

                SizedBox(height: 10),

                TextButton(onPressed: () {
                    //to Login page
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));

                }
                    , child: Text("Already have an account?", style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black, fontSize: 15, decoration: TextDecoration.underline),)),



              ],
            ),
          ),
        ),
    );
  }
}
