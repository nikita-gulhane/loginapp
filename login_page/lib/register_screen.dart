import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login_page/LoginDemo.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flash/flash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController Secondary_mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController gendarController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController bloood_groupController = TextEditingController();
  TextEditingController reffered_byController = TextEditingController();
  TextEditingController Sprcial_infoController = TextEditingController();
  TextEditingController home_addressController = TextEditingController();
  TextEditingController office_addressController = TextEditingController();

  // TextEditingController authkeyController = TextEditingController();

  // void register(String fname,lname,mobile,Secondary_mo,email,gendar,dob,
  //     blood_group,reffered_by,Special_info,home_address,office_address) async{

  //   try{
  //     String ?authkeyEP = "";
  //     SharedPreferences pref =await SharedPreferences.getInstance();
  //     if(pref.containsKey("authkey")){
  //       authkeyEP = pref.getString("authkey");
  //     }
  //     Response response =  await post(
  //
  //         Uri.parse("http://peplo.in/api/client_add?bizapikey=5982721e03fba6f8f94c6a93c5ad51&authkey=&fname={val}&lname={val}&mobile={val}&secondary_mo={val}&email={val}&gender={val}&dob={val}&blood_group={val}&referred_by={val}&spl_info={val}&home_adr={val}&office_adr={val}"),
  //         body: {
  //           'fname' : fname,
  //           'lname' : lname,
  //           'mobile' : mobile,
  //           'Secondary_mo': Secondary_mo,
  //           'email' : email,
  //           'gendar' : gendar,
  //           'dob': dob,
  //           'blood_group': blood_group,
  //           'reffered_by' :reffered_by,
  //           'Special_info':Special_info,
  //           'home_address':home_address,
  //           'office_address':office_address,
  //           'authkey': authkeyEP
  //         }
  //     );
  //     var data = jsonDecode(response.body.toString());
  //
  //     if(response.statusCode == 200){
  //       print("MyCustApp RegisterScreen.dart" +
  //           "resp code for success: " +
  //           response.statusCode.toString());
  //       print("MyCustApp RegisterScreen.dart" + "API success message" + data['message']);
  //       print("MyCustApp RegisterScreen.dart" + data.toString());
  //       print("MyCustApp RegisterScreen.dart" + "Registration successful");
  //       // Fluttertoast.showToast(
  //       //     msg: "Registration Succesful",
  //       //     gravity: ToastGravity.CENTER,
  //       //     backgroundColor: Colors.black,
  //       //     textColor: Colors.white,
  //       //     fontSize: 16.0
  //       // );
  //     }
  //     else if (response.statusCode != 200) {
  //       print("MyCustApp RegisterScreen.dart" +
  //           "resp code for not success: " +
  //           response.statusCode.toString());
  //       print("MyCustApp RegisterScreen.dart" + "API error message" + data['message']);
  //
  //       print("MyCustApp RegisterScreen.dart" +
  //           "Registration not successful. Please check your details entered.");
  //     }
  //   }catch(e){
  //     print(e.toString());
  //   }
  //
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: fnameController,
                    cursorColor: Color(0xffF5591F),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xffF5591F),
                      ),
                       hintText: "fname",
                       enabledBorder: InputBorder.none,
                       focusedBorder: InputBorder.none,
                    ),
                  validator:(value){
                  if (value!.isEmpty) {
                  return "* Required";
                 } else
                  return null;
                  },
                ),
                ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: lnameController,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "lname",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator:(value){
                    if (value!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },

                ),
              ),


              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffEEEEEE),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 100,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: mobileController,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    focusColor: Color(0xffF5591F),
                    icon: Icon(
                      Icons.phone,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "mobile",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator:(value){
                    if (value!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                ),
              ),


              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffEEEEEE),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 100,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: Secondary_mobileController,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    focusColor: Color(0xffF5591F),
                    icon: Icon(
                      Icons.phone,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "Secondary_mo",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator:(value){
                    if (value!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },

                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator:(value){
                    if (value!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: gendarController,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "gender",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator:(value){
                    if (value!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: dobController,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.calendar_month,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "dob",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator:(value){
                    if (value!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: bloood_groupController,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.water_drop_sharp,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "blood_group",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator:(value){
                    if (value!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: reffered_byController,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "reffered_by",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator:(value){
                    if (value!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: Sprcial_infoController,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.info,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "specical_info",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator:(value){
                    if (value!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: home_addressController,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.home,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "home_address",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator:(value){
                    if (value!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20,top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                   controller: office_addressController,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.work,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "office_adress",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator:(value){
                    if (value!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                ),
              ),
              GestureDetector(
                onTap: () async{
                  print("MyCustApp RegisterScreen.dart" + "Register Pressed");
                  print("MyCustApp RegisterScreen.dart" + " FN: " + fnameController.text.toString());
                  print("MyCustApp RegisterScreen.dart" + "LN: " + lnameController.text.toString());
                  print("MyCustApp RegisterScreen.dart" + "MN: " + mobileController.text.toString());
                  print("MyCustApp RegisterScreen.dart" + "SN: " + Secondary_mobileController.text.toString());
                  print("MyCustApp RegisterScreen.dart" + "EM: " + emailController.text.toString());
                  print("MyCustApp RegisterScreen.dart" + "GN: " + gendarController.text.toString());
                  print("MyCustApp RegisterScreen.dart" + "DOB: " + dobController.text.toString());
                  print("MyCustApp RegisterScreen.dart" + "BG: " + bloood_groupController.text.toString());
                  print("MyCustApp RegisterScreen.dart" + "RB: " + reffered_byController.text.toString());
                  print("MyCustApp RegisterScreen.dart" + "SI: " + Sprcial_infoController.text.toString());
                  print("MyCustApp RegisterScreen.dart" + "HA: " + home_addressController.text.toString());
                  print("MyCustApp RegisterScreen.dart" + "OA: " + office_addressController.text.toString());

                  if(formkey.currentState!.validate()){
                  // register(fnameController.text.toString(),lnameController.text.toString(),
                  // mobileController.text.toString(),Secondary_mobileController.text.toString(),
                  // emailController.text.toString(),gendarController.text.toString(),dobController.text.toString(),
                  //     bloood_groupController.text.toString(),reffered_byController.text.toString(),Sprcial_infoController.text.toString(),
                  //  home_addressController.text.toString(),office_addressController.text.toString()
                  //   );
                  Fluttertoast.showToast(
                      msg: "Registration Succesful",
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  }
                  else{
                    Fluttertoast.showToast(
                        msg: "Registration Failed",
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  };
                  print("Register clicked");

             },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20,top: 20),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [(new  Color(0xffF5591F)), new Color(0xffF2861E)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight
                    ),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                        color: Colors.white
                    ),
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
