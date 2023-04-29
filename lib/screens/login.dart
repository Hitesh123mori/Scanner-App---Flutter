import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' ;
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(child: SizedBox()),

            Text("Welcome to app"),

            Expanded(child: SizedBox()),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email/Phone Number",
                      hintText: "Enter Phonenumber" ,
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(),
                    ),
                    controller: _email_controller,
                  ),

                  SizedBox(height: 20,),

                  TextFormField(
                    obscureText: !_isPasswordVisible, // toggle password visibility
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
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


            ElevatedButton(onPressed: (){
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

              child: Text("Sign In"),
            ),

            Expanded(child: SizedBox()),

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
        const Text(
          "Don't have account?",
          style: TextStyle(color: Colors.black54),),

        SizedBox(width: 5,),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Register())) ;
          },

          child: const Text("Register",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18)),
        ) ,
      ],
    );
  }
}
