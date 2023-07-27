import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widgets/my_button.dart';
import '../../common_widgets/my_text.dart';
import '../../common_widgets/my_text_field.dart';
import '../Discover/home_page.dart';
import '../forget_password/forget_password.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  late bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text("Sign in"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body:  Padding(
            padding: const EdgeInsets.only(left:20.0, right:20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              constraints: BoxConstraints.tightFor(width: 450, height: MediaQuery.of(context).size.height),
              padding: EdgeInsets.only(left:25.0, right: 25 ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [

                    LogoHeader_SI(),

                    Form(
                      key: _formKey,
                      child:
                      Column(
                          children: [
                            SizedBox(height: 10,),

                            //Email address
                            MyTextField(
                          fieldName: "Email address",
                          myController: _emailController,
                        ),

                            SizedBox(height: 10),

                            //password
                           TextFormField(
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
                                    labelStyle:  GoogleFonts.poppins(color: Colors.black, fontSize: 15) ),
                                obscureText: _passwordVisible ,


                            ),

                      ]),
                    ),

                    SizedBox(height: 10),

                    //forget password
                    TextButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return ForgetPasswordScreen();
                            }));
                      },
                      child:
                      MyText(text:"Forgot password?", color: Colors.green[400],fontSize: 15),),

                    SizedBox(height: 50),

                    //Sign in button
                    MyButton(text: "Sign in", color: Colors.green[400], width: 500,
                    onpress: () {
                        //Check if user exists before sign in here

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                    }
                    ),


                  ],
                ),
            ),
          ),

    );
  }
}

class LogoHeader_SI extends StatelessWidget {
  const LogoHeader_SI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
         padding: const EdgeInsets.only(top: 10,bottom: 20.0),
         child: const SizedBox(child: Image(image: AssetImage("assets/images/quatrLogoBlack.png")), height: 100, width: 100,),
       );
  }
}


