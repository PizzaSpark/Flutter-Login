// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  bool verifyUser() {
    if(_usernameController.text != "admin"){
      return false;
    }
    else if(_passwordController.text != "12345"){
      return false;
    }
    return true;
  }

  void loginUser() {
    if(verifyUser()) {
      _usernameController.clear();
      _passwordController.clear();

      Navigator.pushNamed(context, '/homepage');
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Invalid'),
          content: Text('Wrong username or password'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void exitApp(){

    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Close application?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'YES');
                if (Platform.isAndroid) {
                  SystemNavigator.pop(); // exit app on Android
                } else if (Platform.isIOS) {
                  SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
                } else {
                  exit(0);
                }
              },
              child: Text('YES'),
            ),

            TextButton(
              onPressed: () => Navigator.pop(context, 'NO'),
              child: Text('NO'),
            ),
          ],
        ),
      );
  }

  Future<bool> _onWillPop() async {
    exitApp();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
          automaticallyImplyLeading: false,
        ),
    
        body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 300.0,
                  padding: EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Center(
                    child: Image.asset('images/kono-suba-anime.gif'),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    //the input
                    controller: _usernameController,
                    //decoration
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                        
                      //greyed out text
                      hintText: "Enter username..",
                    ),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    //the input
                    controller: _passwordController,
                    obscureText: _obscureText,
                    //decoration
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      
                      //greyed out text
                      hintText: "Enter password..",
    
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                        
    
                    ),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 50),
                            backgroundColor: Colors.black87,
                          ),
                          onPressed: loginUser, child: Text("Login")
                        ),
                      ),
    
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 50),
                            backgroundColor: Colors.black87,
                          ),
                          onPressed: exitApp, child: Text("Cancel")
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}