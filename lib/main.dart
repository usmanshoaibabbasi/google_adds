import 'package:flutter/material.dart';
import 'package:google_adds/helper/admob_helper.dart';
import 'package:google_adds/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdMobHelper.initialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
