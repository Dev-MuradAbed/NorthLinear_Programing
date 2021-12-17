import 'package:camera/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(const MyApp());
    });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'North_West corner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const HomePage(),
    );
  }
}

