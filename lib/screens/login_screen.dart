import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome To __"),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Email",
            hintText: "Enter Email" ,
            prefixIcon: Icon(Icons.mail),
            border: OutlineInputBorder(),
          ),
          controller: _email_cotroller,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value?.trim().isEmpty ?? true) {
              return 'Pleaseenter your email address';
            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                .hasMatch(value!)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          ],
        ),
      ),

    );
  }
}
