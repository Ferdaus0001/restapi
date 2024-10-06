import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' ;
import 'package:http/http.dart';

class LoginApiHomeScreen extends StatefulWidget {
  const LoginApiHomeScreen({super.key});

  @override
  State<LoginApiHomeScreen> createState() => _LoginApiHomeScreenState();
}

class _LoginApiHomeScreenState extends State<LoginApiHomeScreen> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  // লোডিং ট্র্যাক করার জন্য একটি ভেরিয়েবল
  bool isLoading = false;

  void Login(String email, String password) async {
    setState(() {
      isLoading = true;  // লোডিং শুরু হবে
    });

    try {
      Response respons = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          "email": email,
          'password': password,
        },
      );

      if (respons.statusCode == 200) {
        var data = jsonDecode(respons.body.toString());
        print(data['token']);
        debugPrint('Account Created Successfully');
      } else {
        debugPrint('Failed');
      }
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      isLoading = false;  // কাজ শেষ হলে লোডিং বন্ধ হবে
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Api Post'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 6,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 111),
              TextFormField(
                controller: EmailController,
                decoration: InputDecoration(
                  label: Text('Email'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
              SizedBox(height: 11),
              TextFormField(
                controller: PasswordController,
                decoration: InputDecoration(
                  label: Text('Password'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Forget Password'),
                    RichText(
                      text: TextSpan(
                        text: '  SingUp',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),

              // যদি লোডিং হয় তবে CircularProgressIndicator দেখাবে, নয়ত বাটন দেখাবে
              isLoading
                  ? CircularProgressIndicator()  // লোডিং চলার সময় এই UI দেখাবে
                  : ElevatedButton(
                onPressed: () {
                  Login(
                    EmailController.text.toString(),
                    PasswordController.text.toString(),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(450, 60),
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
