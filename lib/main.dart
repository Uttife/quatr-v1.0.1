import 'package:Quatr/src/screens/onboarding/on_boarding_screen.dart';
import 'package:Quatr/src/providers/property_provider.dart';
import 'package:flutter/material.dart';
import 'package:Quatr/src/utils/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  
  git init

  @override
  Widget build(BuildContext context) {
    return   ChangeNotifierProvider.value(
      value: PropertyListings(),
      child: MaterialApp(
         title: "Quatr",
        theme: CustomAppTheme.lightTheme,
        darkTheme: CustomAppTheme.darkTheme,
        themeMode: ThemeMode.system,
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
