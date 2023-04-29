import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' ;
import 'package:hackathon_scanner_app/screens/register.dart';
import 'package:hackathon_scanner_app/user.dart';
import 'package:hackathon_scanner_app/screens/home.dart';

import '../widgets/app_colors.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  final _email_controller = TextEditingController();
  final _password_controller = TextEditingController();

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.theme["primaryColor"] ,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(child: SizedBox()),

            Expanded(child: Text("Login",style: TextStyle(fontSize: 36,color: AppColors.theme["secondaryColor"]),)),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color:AppColors.theme["secondaryColor"], ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                      labelText: "Email/Phone Number",
                      labelStyle: TextStyle(color: AppColors.theme["secondaryColor"], ),
                      hintText: "Enter Phonenumber" ,
                      hintStyle: TextStyle(color: AppColors.theme["secondaryColor"],),
                      prefixIcon: Icon(Icons.mail,color: AppColors.theme["secondaryColor"],),
                      border: OutlineInputBorder(),
                    ),
                    controller: _email_controller,
                  ),

                  SizedBox(height: 20,),

                  TextFormField(
                    style: TextStyle(color:AppColors.theme["secondaryColor"], ),
                    obscureText: !_isPasswordVisible, // toggle password visibility
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                      labelText: 'Password',
                      hintStyle: TextStyle(color: AppColors.theme["secondaryColor"],),
                      labelStyle: TextStyle(color: AppColors.theme["secondaryColor"], ),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password,color: AppColors.theme["secondaryColor"],),
                      suffixIcon: IconButton(
                        color:AppColors.theme["secondaryColor"] ,
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    controller: _password_controller,
                  )
                ],
              ),
            ),

            signUpOption(),

            SizedBox(height: 20,),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.theme["secondaryColor"],
              ),
              onPressed: (){
                FirebaseAuth.instance
                  .signInWithEmailAndPassword(email: _email_controller.text, password: _password_controller.text)
                  .then((value) {

                UserId.uid = value.user!.uid;
                //ToDo: add navigator to home screen
                UserId.uid = value.user!.uid;
                //ToDo: add navigator to home screen
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

              })
                  .onError((error, stackTrace) {
                print("Failed to sign in $error");

                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    title: const Text("Sign In Failed"),
                    content: Text(error.toString()), //todo: place appropriate msg
                  );
                });
              });
            },

              child: Text("Sign In",style: TextStyle(color: AppColors.theme["primaryColor"]),),
            ),

            Expanded(flex:2, child: SizedBox()),

          ],
        ) ,
      ),
    );
  }
  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      // ignore: prefer_const_literals_to_create_immutables
      children:  [
        Text(
          "Don't have account?",
          style: TextStyle(color: AppColors.theme["secondaryColor"]),),

        SizedBox(width: 5,),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Register())) ;
          },

          child: Text("Register",
              style: TextStyle(color: AppColors.theme["tertiaryColor"], fontWeight: FontWeight.bold, fontSize: 18)),
        ) ,
      ],
    );
  }
}
