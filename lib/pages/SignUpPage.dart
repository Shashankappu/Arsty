import 'package:artsy/components/custom_button.dart';
import 'package:artsy/components/custom_textfield.dart';
import 'package:artsy/pages/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/UserModel.dart';
import 'SignInPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isGuideSelected = false;
  final _guideIdController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cnfpasswordController = TextEditingController();


  Future signUp() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      // Set the username as the display name
      await userCredential.user!.updateDisplayName(_usernameController.text.trim());

      // Store user details in Firestore
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'isGuide': isGuideSelected,
        'email': userCredential.user!.email,
        'username': _usernameController.text.trim(),
        'guideId': isGuideSelected ? _guideIdController.text.trim() : null,
      });

      // Now you can use the 'user' object as needed.

      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      // Handle sign-up errors here
      debugPrint("Error during sign-up: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Center(
          child:  Padding(
            padding:  EdgeInsets.only(top:15.0),
            child:  Text(
              "Sign Up",
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Radio buttons for Guide and Traveller
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      activeColor: Colors.black,
                      value: true,
                      groupValue: isGuideSelected,
                      onChanged: (value) {
                        setState(() {
                          isGuideSelected = value as bool;
                        });
                      },
                    ),
                    const Text("Guide"),
                    const SizedBox(width: 20),
                    Radio(
                      activeColor: Colors.black,
                      value: false,
                      groupValue: isGuideSelected,
                      onChanged: (value) {
                        setState(() {
                          isGuideSelected = value as bool;
                        });
                      },
                    ),
                    const Text("Traveller"),
                  ],
                ),
              ),

              // Additional UI elements for Guide
              if (isGuideSelected)
                 CustomTextField(hintText: "Guide id", obscureText: false,controller: _guideIdController,),
               CustomTextField(hintText: "Username", obscureText: false,controller: _usernameController,),
               CustomTextField(hintText: "Email", obscureText: false,controller: _emailController,),
               CustomTextField(hintText: "Password", obscureText: true,controller: _passwordController,),
               CustomTextField(hintText: "Confirm password", obscureText: true,controller: _cnfpasswordController,),
              const SizedBox(height: 25,),
               CustomButton(
                  onTap: (){
                    if(_validator()){
                        signUp();
                    }else{
                      debugPrint('LOG: SIGN UP FAILED');
                    }
                },
                  btnText: 'Sign Up'),
              const SizedBox(height: 100,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",style: TextStyle(color: Colors.grey,fontSize: 18),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const SignInPage()));
                  },
                      child: const Text("Sign In",style: TextStyle(color: Colors.blue,fontSize: 18,decoration: TextDecoration.underline),)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _validator(){
    if(_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty){
      if(_passwordController.text.length>6 && (_passwordController.text == _cnfpasswordController.text)){
        return true;
      }
    }
    return false;
  }
}
