import 'package:flutter/material.dart';
import 'package:login_page/Homepage.dart';
import 'package:login_page/LoginDemo.dart';
import 'package:flash/flash.dart';
import 'package:shared_preferences/shared_preferences.dart';


 Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   SharedPreferences prefs =await SharedPreferences.getInstance();
   String ?authkey = prefs.getString("authkey");
   print("MyCustApp Main.dart" + "authkey extracted from SP: " + authkey.toString());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    /*if(authkey == "" ) {
      home: LoginDemo();
    }
    else {
     home: Homepage(),
   }*/
    home: (authkey==null)?Homepage():LoginDemo()
  )
  );

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: (context, _) {
      //   var child = _!;
      //   final navigatorKey = child.key as GlobalKey<NavigatorState>;
      //   child = Toast(child: child, navigatorKey: navigatorKey);
      //    child = FlashTheme(
      //      child: child,
      //   //   flashDialogTheme: const FlashDialogThemeData(),
      //    );
      //   return child;
      // },
      home: LoginDemo(),
    );
  }
}