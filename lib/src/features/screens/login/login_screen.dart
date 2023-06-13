import 'package:Quatr/src/features/screens/signup/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../../../commom_widgets/my_button.dart';
import '../../../commom_widgets/my_text_field.dart';
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
        // title: Text("Sign In",
        //     style: Theme.of(context)
        //         .textTheme
        //         .titleMedium!
        //         .copyWith(color: Colors.white, fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left:20.0, right:20),
            child: Container(
            //  height: MediaQuery.of(context).size.height * 0.70,
              //width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.grey,
                //   width: 1.0,
                // ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              constraints: BoxConstraints.tightFor(width: 450, height: MediaQuery.of(context).size.height),
              //color: Colors.blue,
              padding: EdgeInsets.only(left:25.0, right: 25 ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                  /*  Spacer(),*/


                       Padding(
                         padding: const EdgeInsets.only(top: 10,bottom: 20.0),
                         child: const SizedBox(child: Image(image: AssetImage("assets/images/quatrLogoBlack.png")), height: 100, width: 100,),
                       ),
                       // Padding(
                       //   padding: const EdgeInsets.only(top: 5.0),
                       //   child: Text("Hello, there!", style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25) ,),
                       // ),



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
                      ]),
                    ),

                    SizedBox(height: 10),

                    TextButton(onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ForgetPasswordScreen();
                          }));
                    }, child: Text("Forgot password?", style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black, fontSize: 15, decoration: TextDecoration.underline),)),

                    SizedBox(height: 50),

                    MyButton(text: "Sign in", color: Colors.green, width: 500,
                    onpress: () {
                  //    if (_formKey.currentState!.validate()) {
                        //Check if user exists before sign in here

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                     // }
                    }
                    ),

            /*        SizedBox(height: 15,),

               *//*     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Container(height: 1, color: Colors.black, width: 300)),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                          child: Text("or", style: TextStyle(fontSize: 20)),
                        ),
                        Expanded(child: Container(height: 1, color: Colors.black, width: 300,))
                      ],
                    ),

                    SizedBox(height: 15),

                    Container(

                    //  padding: EdgeInsets.only(left: 70.0, right: 70.0),
                     // constraints: BoxConstraints.tightFor(width: 100),
                      child:Container(
                          height:50,
                          width: double.infinity,
                          child:ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  elevation: 3, //elevation of button
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  padding: EdgeInsets.all(1.0) //content padding inside button
                              ),
                              onPressed: (){
                                //Check if user exists before sign in here

                                       Navigator.push(context,
                                           MaterialPageRoute(builder: (context) {
                                             return SignUpScreen();
                                           }));
                              },
                              child:  Text("Create an account",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: Colors.white, fontSize: 20))
                          )
                      ),
                    ),*//*

                    Spacer()*/

                  ],
                ),

            ),
          ),
      ),
    );
  }
}


