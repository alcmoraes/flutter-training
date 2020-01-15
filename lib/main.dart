import 'package:flutter/material.dart';
import 'package:layout_training/frontend/home.dart';
import 'package:layout_training/frontend/login.dart';
import 'package:layout_training/frontend/todo.dart';
import 'package:layout_training/models/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => AuthModel())],
        child: MaterialApp(
          title: 'Flutter Demo',
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
          ),
          initialRoute: "/login",
          routes: {
            "/": (context) => HomeScreen(),
            "/login": (context) => LoginScreen(),
            "/todos": (context) => TodoScreen()
          }
        ));
  }
}
