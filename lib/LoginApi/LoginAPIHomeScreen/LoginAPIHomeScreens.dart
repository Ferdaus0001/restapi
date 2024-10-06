import 'package:flutter/material.dart';

class LoginAPI extends StatefulWidget {
  const LoginAPI({super.key});

  @override
  State<LoginAPI> createState() => _LoginAPIState();
}

class _LoginAPIState extends State<LoginAPI> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Login Api '),
        centerTitle: true,
        elevation: 3,
        backgroundColor: Colors.white,

      ),
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
