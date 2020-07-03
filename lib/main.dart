import 'package:flutter/material.dart';
import 'package:login_register_auth/ui/screens/auth_screen.dart';
import 'package:login_register_auth/ui/screens/home_screen.dart';
import 'package:login_register_auth/ui/screens/intro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xfff2f9fe),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(25),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      home: IntroScreen(),
      routes: {
        'intro': (context) => IntroScreen(),
        'home': (context) => HomeScreen(),
        'login': (context) => AuthScreen(authType: AuthType.login),
        'register': (context) => AuthScreen(authType: AuthType.register),
      },
    );
  }
}
