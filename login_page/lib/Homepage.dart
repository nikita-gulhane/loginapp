import 'package:flutter/material.dart';
import 'package:login_page/LoginDemo.dart';
import 'package:login_page/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New Customer ?"),
                  GestureDetector(
                    child: Text('Register'),
                    onTap: () async {
                      /*SharedPreferences pref = await SharedPreferences.getInstance();
                      pref.remove("email");*/
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                          ),
                      );*/
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => RegisterScreen()));
                    },
                  ),
                ]
            ),
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            child: ElevatedButton(
              onPressed: () {
                // resetLoginState();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginDemo()));
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),

        ],
      ),
    );
  }

  // void resetLoginState() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("authkey", "");
  // }
}
