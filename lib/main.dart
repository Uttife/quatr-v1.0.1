import 'package:Quatr/src/features/screens/Discover/home_page.dart';
import 'package:Quatr/src/features/screens/onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:Quatr/src/utils/theme/theme.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  
  

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
       title: "Quatr",
      theme: BAppTheme.lightTheme,
      darkTheme: BAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home:  OnBoard(),
    );
  }
}

class AppHome extends StatelessWidget{
  const AppHome({super.key});


  @override
  Widget build(BuildContext context) {

    return OnBoard()
    ;
  }

}
