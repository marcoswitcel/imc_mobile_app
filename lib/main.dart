import 'package:flutter/material.dart';
import 'package:imc_mobile_app/constants.dart';
import 'package:imc_mobile_app/ui/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.title,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const HomeScreen(title: Constants.title),
    );
  }
}
