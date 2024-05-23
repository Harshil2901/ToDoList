import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:todolist/constant/constant.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future login() async {
    try {
      http.Response response = await http.post(Uri.parse(loginNote), body: {
        "email": emailController.text,
        "password": passwordController.text
      });
      if (response.statusCode == 200) {
        var responseData = jsonEncode(response.body);

        var token = responseData[0];
        print(token);

        print(responseData);
      }
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppBarTheme.of(context).backgroundColor,
        title: Center(
          child: Text(
            "Login",
            style: GoogleFonts.lato(fontSize: 30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: we,
          height: he,
          child: Column(
            children: [
              SizedBox(
                height: he * 0.2,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.only(left: we * 0.03, right: we * 0.03),
                  height: he * 0.4,
                  width: we * 0.8,
                  child: Column(
                    children: [
                      SizedBox(
                        height: he * 0.03,
                      ),
                      Text(
                        "Welcome Back!!",
                        style: GoogleFonts.lato(fontSize: 25),
                      ),
                      SizedBox(
                        height: he * 0.05,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintStyle: const TextStyle(color: Colors.grey),
                            hintText: "Enter your Email"),
                      ),
                      SizedBox(
                        height: he * 0.02,
                      ),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintStyle: const TextStyle(color: Colors.grey),
                            hintText: "Enter your Password"),
                      ),
                      SizedBox(
                        height: he * 0.03,
                      ),
                      Container(
                        width: we * 0.5,
                        child: FloatingActionButton.extended(
                            onPressed: () {
                              login();
                            },
                            backgroundColor: const Color(0xFF0002FFF),
                            splashColor: Colors.lightBlue,
                            label: const Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
