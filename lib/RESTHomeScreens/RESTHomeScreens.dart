import 'package:flutter/material.dart';

class RESTHomeScreen extends StatefulWidget {
  const RESTHomeScreen({super.key});

  @override
  State<RESTHomeScreen> createState() => _RESTHomeScreenState();
}

class _RESTHomeScreenState extends State<RESTHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('RESTHomeScreen '),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,

      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
