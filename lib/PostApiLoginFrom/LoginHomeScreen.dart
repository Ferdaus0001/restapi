import 'package:flutter/material.dart';

class LoginHomeScreen extends StatefulWidget {
  const LoginHomeScreen({super.key});

  @override
  State<LoginHomeScreen> createState() => _LoginHomeScreenState();
}

class _LoginHomeScreenState extends State<LoginHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Login Home Screen'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 6,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
