import 'package:Quatr/src/core/data/repositories/auth/firebase_authentication_repository.dart';
import 'package:Quatr/src/core/domain/usecases/user_registration_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/helpers/logger.dart';
import '../../widgets/my_button.dart';
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
  bool isSigningUp = false;
  final userRegistrationUseCase =
      UserRegistrationUseCase(repository: FirebaseAuthenticationRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create account",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Let's Get you an Account!",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  // Container(height: 1, color: Colors.black, width: 500),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Text(
                      "With a few details, create a Quatr profile. Your password must have at least 8 characters including letters and a number.",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      width: 500,
                      alignment: Alignment.bottomRight,
                      child: TextFormField(
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
                              borderSide:
                                  BorderSide(color: Colors.green.shade300),
                            ),
                            labelStyle: const TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      width: 500,
                      alignment: Alignment.bottomRight,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can\'t be empty';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long.';
                          }
                          // Check if the password contains at least one letter and one number
                          if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)')
                              .hasMatch(value)) {
                            return 'Password must contain at least one letter and one number.';
                          }
                          // Return null if the password meets all requirements
                          return null;
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
                              borderSide:
                                  BorderSide(color: Colors.green.shade300),
                            ),
                            labelStyle: const TextStyle(color: Colors.black)),
                        obscureText: _passwordVisible,
                      ),
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
                                if (_cPasswordController.text !=
                                    _passwordController.text) {
                                  return 'Passwords do not match.';
                                } else {
                                  return null;
                                }
                              },
                              controller: _cPasswordController,
                              decoration: InputDecoration(
                                  labelText: "Confirm password",
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
                                    borderSide: BorderSide(
                                        color: Colors.green.shade300),
                                  ),
                                  labelStyle:
                                      const TextStyle(color: Colors.black)),
                              obscureText: _passwordVisible,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 20),
              isSigningUp ? Center(
                child: CircularProgressIndicator(backgroundColor: Colors.black,
                    color: Colors.green,
                    strokeWidth: 10),
              )
              :  MyButton(
                text: "Sign Up",
                color: Colors.green,
                width: 500,
                  onpress: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isSigningUp = true; // Show a loading indicator
                      });

                      try {
                        final result = await userRegistrationUseCase.execute(
                          email: _emailController.text.trim(),
                          password: _passwordController.text,
                        );

                        if (result != null) {
                          print(result.email);
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        }
                       /* else {
                          // Handle login failure
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Registration failed: User not found or incorrect credentials.'),
                            ),
                          );
                        }*/
                      } on FirebaseAuthException catch (e) {
                        // Handle authentication errors
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.message!),
                          ),
                        );
                      } finally {
                        setState(() {
                          isSigningUp = false; // Hide the loading indicator
                        });
                      }
                    }
                  }
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "By clicking \"Sign up\" you agree to our Terms and Conditions and Privacy Policy.",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: 'Terms & Conditions',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.green),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      // Handle the tap action here
                      final Uri _url = Uri.parse('https://quatr/terms.com');
                      if (!await launchUrl(_url)) {
                        throw Exception('Could not launch $_url');
                      }
                    },
                  children: [
                    TextSpan(
                        text: ' and ',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black)),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          // Handle the tap action here
                          final Uri _url =
                              Uri.parse('https://quatr/privacy.com');
                          if (!await launchUrl(_url)) {
                            throw Exception('Could not launch $_url');
                          }
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    //to Login page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  child: Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.black,
                        fontSize: 15,
                        decoration: TextDecoration.underline),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
