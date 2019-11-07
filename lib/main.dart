import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gumbi/AboutPage.dart';
import 'package:gumbi/MyHomePage.dart';
import 'package:gumbi/SelectPlaces.dart';
//import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A backroom classifieds',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
            brightness: Brightness.light,
            color: Colors.white,
            textTheme: TextTheme(
                title: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
            iconTheme: IconThemeData(color: Colors.blueAccent)),
        canvasColor: Colors.white,
        accentColor: Colors.blueAccent,
        //brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/selectplaces': (context) => SelectPlaces(),
        '/spacedetails': (context) => SelectPlaces(),
        '/aboutus': (context) => AboutPage()
      },
    );
  }
}
