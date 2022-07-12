import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home.dart';
import 'package:flutter/services.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_)=>runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TicTacToe",
      color: Colors.red,
      home: Home(),
    );
  }
}
