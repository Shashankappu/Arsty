import 'package:artsy/components/custom_button.dart';
import 'package:artsy/components/custom_textfield.dart';
import 'package:artsy/pages/HomePage.dart';
import 'package:flutter/material.dart';

import 'SignInPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isGuideSelected = false;

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
                const CustomTextField(hintText: "Enter guide id", obscureText: false),
              const CustomTextField(hintText: "Enter username", obscureText: false),
              const CustomTextField(hintText: "Enter email id", obscureText: false),
              const CustomTextField(hintText: "Enter your password", obscureText: true),
              const CustomTextField(hintText: "Confirm your password", obscureText: true),
              const SizedBox(height: 25,),
               CustomButton(
                  onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage()));
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
}
