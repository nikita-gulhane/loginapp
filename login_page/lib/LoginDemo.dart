import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart';
import 'package:login_page/Homepage.dart';
import 'package:flash/flash.dart';
import 'package:login_page/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // void login(String email, password) async {
  //   try {
  //     Response response = await get(
  //       Uri.parse(
  //           "http://peplo.in/api/vendor_login?bizapikey=5982721e03fba6f8f94c6a93c5ad51&vemail=" +
  //               email +
  //               "&password=" +
  //               password),
  //     );
  //     if (response.statusCode == 200) {
  //       var responseData = jsonDecode(response.body.toString());
  //       print("MyCustApp LoginDemo.dart" +
  //           "resp code for success: " +
  //           response.statusCode.toString());
  //
  //       print("MyCustApp LoginDemo.dart" + "response : " + responseData.toString());
  //       LinkedHashMap<String, dynamic> data = responseData['data'];
  //       print("MyCustApp LoginDemo.dart" + "data : " + data.toString());
  //       var authkey = data['authkey'];
  //       print("MyCustApp LoginDemo.dart" + "authkey : " + authkey.toString());
  //       SharedPreferences pref = await SharedPreferences.getInstance();
  //       pref.setString("authkey", authkey);
  //       print("MyCustApp LoginDemo.dart" + "authkey extracted from SP: " + pref.getString("authkey").toString());
  //       print("MyCustApp LoginDemo.dart" + "Login successful1");
  //     }
  //     else if (response.statusCode != 200) {
  //       print("MyCustApp LoginDemo.dart" +
  //           "resp code for not success: " +
  //           response.statusCode.toString());
  //       print("MyCustApp LoginDemo.dart" +
  //           "Login not successful. Please check your credentials entered1.");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Form(
        key: formkey,
        child: Column(
            children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: emailController,
                // validator:EmailValidator(errorText: "Enter valid email id"),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter valid mail id as abc@gmail.com'),

                // validator:EmailValidator(errorText: "Enter valid email id"),
                validator: MultiValidator([
                  RequiredValidator(errorText: "* Required"),
                  EmailValidator(errorText: "Enter valid email id"),
                ])),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your secure password'),
                validator:
                  RequiredValidator(errorText: "* Required"),

            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: ElevatedButton(
              onPressed: () async{
                print("MyCustApp LoginDemo.dart" + "Login Pressed");
                print("MyCustApp LoginDemo.dart" + " UN: " + emailController.text.toString());
                print("MyCustApp LoginDemo.dart" + "PW: " + passwordController.text.toString());
                if (formkey.currentState!.validate()) {
                  // login(emailController.text.toString(),
                  //     passwordController.text.toString());
                  Fluttertoast.showToast(
                      msg: "Login Succesful",
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                  print("Validated");
                }else{
                  Fluttertoast.showToast(
                    msg: "Login Failed",
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                  print("Not Validated");
                }
                },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
              // SizedBox(
              //    height: 10,
              //  ),

            ]),
      ),
    );
  }
}
