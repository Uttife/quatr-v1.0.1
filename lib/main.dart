import 'package:Quatr/src/core/presentation/screens/onboarding/on_boarding_screen.dart';
import 'package:Quatr/src/core/themes/theme.dart';
import 'package:Quatr/src/core/utils/helpers/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
late final FirebaseAuth auth;
late final FirebaseApp app;
late final SharedPreferences prefs;
late bool isUserLoggedIn;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  prefs = await SharedPreferences.getInstance();

  isUserLoggedIn = prefs.getBool('isUserLoggedIn') ?? false;
  logger.i(isUserLoggedIn);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black87,
  ));

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  


  @override
  Widget build(BuildContext context) {
    return   ChangeNotifierProvider.value(
      value: null,
      child: MaterialApp(
         title: "Quatr",
        theme: CustomAppTheme.lightTheme,
        darkTheme: CustomAppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        home:  AppHome(),
      ),
    );
  }
}

class AppHome extends StatelessWidget{
  const AppHome({super.key});


  @override
  Widget build(BuildContext context) {

    return OnBoard();
  }

}
