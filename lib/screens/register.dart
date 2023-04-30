import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_scanner_app/user.dart' as user ;
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/app_colors.dart';
import 'login_screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;

  final _name_cotroller = TextEditingController();
  final _email_cotroller = TextEditingController();
  final _phone_cotroller = TextEditingController();
  final _wa_phone_cotroller = TextEditingController();
  final _pass_cotroller = TextEditingController();
  final _repass_cotroller = TextEditingController();
  final _website_cotroller = TextEditingController();
  final _address_cotroller = TextEditingController();

  String? _name, _email, _phone, _wa_phone, _password, _confpassword, _website, _address;

  final _formKey = GlobalKey<FormState>();

  Future createUser({required String name,  required String email, required String phone,
    required String password, required String wa_phone, required String website, required String address, required context}) async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      final docUser = FirebaseFirestore.instance.collection('users').doc(value.user!.uid);
      // final tempRef = docUser.collection("contacts").add({"t":"t"}).then((value) => value.delete());

      final json = user.User(uid: value.user!.uid, name: name, email: email, phone: phone,
          password: password, wa_phone: wa_phone, website: website, address: address).toJson();
      await docUser.set(json);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('UID', value.user!.uid);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;

    })
        .onError((error, stackTrace) {
      print("Failed to create user");
      print("error: ${error}");
    });

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         backgroundColor: AppColors.theme["primaryColor"] ,
        appBar: AppBar(
          backgroundColor: AppColors.theme["tertiaryColor"],
          title: Text("Register"),
          leading: BackButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;

            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              SafeArea(child: Padding(
                padding: EdgeInsets.only(top:50,left: 20),
                child: Text("Register",style: TextStyle(fontSize: 30,color: AppColors.theme["secondaryColor"]),),
              )),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(color:AppColors.theme["secondaryColor"], ),
                          decoration:  InputDecoration(
                            labelText: "Name",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            labelStyle: TextStyle(color: AppColors.theme["secondaryColor"], ),
                            hintStyle: TextStyle(color: AppColors.theme["tertiaryColor"],),
                            hintText: "Enter Name" ,
                            prefixIcon: Icon(Icons.person,color: AppColors.theme["secondaryColor"],),
                            border: OutlineInputBorder(),

                          ),
                          controller: _name_cotroller,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onSaved: (value) => _name = value?.trim(),
                        ),

                        SizedBox(height: 10,),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color:AppColors.theme["secondaryColor"], ),
                          decoration: InputDecoration(
                            labelText: "Email",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            hintText: "Enter Email",
                            labelStyle: TextStyle(color: AppColors.theme["secondaryColor"], ),
                            hintStyle: TextStyle(color: AppColors.theme["tertiaryColor"],),
                            prefixIcon: Icon(Icons.mail,color: AppColors.theme["secondaryColor"],),
                            border: OutlineInputBorder(),
                          ),
                          controller: _email_cotroller,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your email address';
                            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value!)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) => _email = value?.trim(),
                        ),

                        SizedBox(height: 10,),

                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color:AppColors.theme["secondaryColor"], ),
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            hintText: "Enter Phone number" ,
                            labelStyle: TextStyle(color: AppColors.theme["secondaryColor"], ),
                            hintStyle: TextStyle(color: AppColors.theme["tertiaryColor"],),
                            prefixIcon: Icon(Icons.call,color: AppColors.theme["secondaryColor"],),
                            border: OutlineInputBorder(),
                          ),
                          controller: _phone_cotroller,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your phone number';
                            } else if (!RegExp(r'^\+?[0-9]{10,}$').hasMatch(value!)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                          onSaved: (value) => _phone = value?.trim(),
                        ),

                        SizedBox(height: 10,),

                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color:AppColors.theme["secondaryColor"], ),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            labelStyle: TextStyle(color: AppColors.theme["secondaryColor"], ),
                            hintStyle: TextStyle(color: AppColors.theme["tertiaryColor"],),
                            labelText: "WhatsApp Number",
                            hintText: "Enter WhatsApp number" ,
                            prefixIcon: Icon(Icons.call,color: AppColors.theme["secondaryColor"],), //todo: change to WA Icon
                            border: OutlineInputBorder(),
                          ),
                          controller: _wa_phone_cotroller,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your phone number';
                            } else if (!RegExp(r'^\+?[0-9]{10,}$').hasMatch(value!)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                          onSaved: (value) => _wa_phone = value?.trim(),
                        ),

                        SizedBox(height: 10,),

                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color:AppColors.theme["secondaryColor"], ),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            labelStyle: TextStyle(color: AppColors.theme["secondaryColor"], ),
                            hintStyle: TextStyle(color: AppColors.theme["tertiaryColor"],),
                            labelText: "Website (optional)",
                            hintText: "https://fetchinfo.com" ,
                            prefixIcon: Icon(Icons.open_in_browser_rounded,color: AppColors.theme["secondaryColor"],), //todo change
                            border: OutlineInputBorder(),
                          ),
                          controller: _website_cotroller,
                          onSaved: (value) => _website = value?.trim(),
                        ),


                        SizedBox(height: 10,),

                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(color:AppColors.theme["secondaryColor"], ),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            labelStyle: TextStyle(color: AppColors.theme["secondaryColor"], ),
                            hintStyle: TextStyle(color: AppColors.theme["tertiaryColor"],),
                            labelText: "Address (optional)",
                            hintText: "Enter Your Address" ,
                            prefixIcon: Icon(Icons.holiday_village,color: AppColors.theme["secondaryColor"],),
                            border: OutlineInputBorder(),
                          ),
                          controller: _address_cotroller,
                          onSaved: (value) => _address = value?.trim(),
                        ),


                        SizedBox(height: 10,),

                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(color:AppColors.theme["secondaryColor"], ),
                          obscureText: !_isPasswordVisible1 ,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            labelText: "Create Password",
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            labelStyle: TextStyle(color: AppColors.theme["secondaryColor"], ),
                            hintStyle: TextStyle(color: AppColors.theme["tertiaryColor"],),
                            hintText: "Create Your Password",
                            prefixIcon: Icon(Icons.password,color: AppColors.theme["secondaryColor"],),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              color:AppColors.theme["secondaryColor"] ,
                              icon: Icon(
                                _isPasswordVisible1 ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible1 = !_isPasswordVisible1;
                                });
                              },
                            ),
                          ),
                          controller: _pass_cotroller,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter a password';
                            } else if ((value?.length)! < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value?.trim(),
                        ),


                        SizedBox(height: 10,),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(color:AppColors.theme["secondaryColor"], ),
                          obscureText: !_isPasswordVisible2 ,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.theme["secondaryColor"],)),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(color: AppColors.theme["secondaryColor"], ),
                            hintStyle: TextStyle(color: AppColors.theme["tertiaryColor"],),
                            hintText: "Renter Password" ,
                            prefixIcon: Icon(Icons.password,color: AppColors.theme["secondaryColor"],),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              color:AppColors.theme["secondaryColor"] ,
                              icon: Icon(
                                _isPasswordVisible2 ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible2 = !_isPasswordVisible2;
                                });
                              },
                            ),
                          ),
                          controller: _repass_cotroller,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter a password';
                            } else if ((value?.length)! < 6) {
                              return 'Password must be at least 6 characters long';
                            } else if (_pass_cotroller.text != _repass_cotroller.text){
                              return "Password doesn't match";
                            }
                            return null;
                          },
                          onSaved: (value) => _confpassword = value?.trim(),
                        ),

                        SizedBox(height: 30,),

                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.theme["secondaryColor"],
                            ),
                            onPressed: (){
                              // Field Validation
                              if (_formKey.currentState?.validate() ?? true) {
                                _formKey.currentState?.save();
                                print('Name: $_name');
                                print('Email: $_email');
                                print('Phone Number: $_phone');
                                print('Password: $_password');
                                // TODO: Perform form submission
                                createUser(
                                    name: _name.toString(),
                                    email: _email.toString(),
                                    phone: _phone.toString(),
                                    password: _password.toString(),
                                    wa_phone: _wa_phone.toString(),
                                    website: _website.toString(),
                                    address:_address.toString(),
                                    context: context);

                                final snackbar = SnackBar(
                                  action: SnackBarAction(label: 'Cancel',textColor: Colors.white70,onPressed: (){
                                    print("Undone") ;
                                  },),
                                  ,
                                  behavior: SnackBarBehavior.floating,
                                  padding: EdgeInsets.all(5),
                                  duration: const Duration(seconds: 3),
                                  backgroundColor: AppColors.theme["tertiaryColor"],
                                  content : Text("Registration done..."),) ;
                                ScaffoldMessenger.of(context).showSnackBar(snackbar) ;
                                final snackbar1 = SnackBar(
                                  action: SnackBarAction(label: 'Cancel',textColor: Colors.white70,onPressed: (){
                                    print("Undone") ;
                                  },),

                                  behavior: SnackBarBehavior.floating,
                                  padding: EdgeInsets.all(5),
                                  duration: const Duration(seconds: 3),
                              backgroundColor: AppColors.theme["tertiaryColor"],
                                  content : Text("QR Code Createed Please Check Dashboard..."),) ;
                                ScaffoldMessenger.of(context).showSnackBar(snackbar1) ;
                              }

                            },
                            child: Text("Register",style: TextStyle(color: AppColors.theme["primaryColor"]),)
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
