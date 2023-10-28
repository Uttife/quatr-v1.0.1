import 'package:Quatr/src/core/presentation/screens/Discover/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repositories/auth/firebase_authentication_repository.dart';
import '../../../domain/usecases/user_signin_usecase.dart';
import '../../../utils/helpers/logger.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
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
  bool isSigningIn = false;
  final userSignInUseCase =
      UserSignInUseCase(repository: FirebaseAuthenticationRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Sign in",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          constraints: BoxConstraints.tightFor(
              width: 450, height: MediaQuery.of(context).size.height),
          padding: EdgeInsets.only(left: 25.0, right: 25),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 20,
              ),

              LogoHeader_SI(),

              Form(
                key: _formKey,
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),

                  //Email address
                  TextFormField(
                    validator: (value) {
                      final RegExp emailRegExp =
                          RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                      if (!emailRegExp.hasMatch(value!)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: "Email address",
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green.shade300),
                        ),
                        labelStyle: const TextStyle(color: Colors.black)),
                  ),

                  SizedBox(height: 30),

                  //password
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter password';
                      } else {
                        null;
                      }
                    },
                    controller: _passwordController,
                    decoration: InputDecoration(
                        labelText: "Password",
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
                        labelStyle: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 15)),
                    obscureText: _passwordVisible,
                  ),
                ]),
              ),

              SizedBox(height: 10),

              //forget password
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ForgetPasswordScreen();
                  }));
                },
                child: MyText(
                    text: "Forgot password?",
                    color: Colors.green[400],
                    fontSize: 15),
              ),

              SizedBox(height: 50),

              //Sign in button
              isSigningIn
                  ? Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.green,
                          strokeWidth: 10),
                    )
                  : MyButton(
                      text: "Sign In",
                      color: Colors.green,
                      width: 500,
                onpress: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isSigningIn = true; // Show a loading indicator
                    });

                    try {
                      // Authenticate the user
                      final result = await userSignInUseCase.execute(
                        email: _emailController.text.trim(),
                        password: _passwordController.text,
                      );

                      if (result != null) {
                        print(result.email);
                        // Navigate to the next screen (e.g., HomeScreen) on successful login
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      } else {
                        // Handle login failure
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Authentication failed: User not found or incorrect credentials.'),
                          ),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      // Handle authentication errors
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.message!),
                        ),
                      );
                    } finally {
                      setState(() {
                        isSigningIn = false; // Hide the loading indicator
                      });
                    }
                  }
                }
                ,

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
      padding: const EdgeInsets.only(top: 10, bottom: 20.0),
      child: const SizedBox(
        child: Image(image: AssetImage("assets/images/quatrLogoBlack.png")),
        height: 100,
        width: 100,
      ),
    );
  }
}
