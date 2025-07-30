import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'Api-service.dart';
import 'Model_class.dart';
import 'homepage.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _MyAppState();
}

class _MyAppState extends State<loginpage> {
  final TextEditingController employeecode = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void checkInternetConnectionAndLogin() async {
    bool hasConnection = await InternetConnection().hasInternetAccess;
    if (!hasConnection) {
      Fluttertoast.showToast(
        msg: "Check your internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      try {
        List<Login> response = await ApiService().postLogin({
          "employeeCode": employeecode.text.trim(),
          "password": password.text.trim(),
        });

        if (response.isNotEmpty) {
          Fluttertoast.showToast(msg: "Login successful");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  mainpage()),
          );
        } else {
          Fluttertoast.showToast(msg: "Invalid username or password");
        }
      } catch (e) {
        Fluttertoast.showToast(msg: "Login failed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text("LOGIN PAGE", style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text("Exit", style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Employee code"),
              TextFormField(
                controller: employeecode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Employee code",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'User Name must be entered';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Text("Password"),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Password",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Password must be entered';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      checkInternetConnectionAndLogin();
                    }
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _clearControllers(){
    employeecode.clear();
    password.clear();
  }
}