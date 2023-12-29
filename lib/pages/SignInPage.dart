import 'package:artsy/components/custom_button.dart';
import 'package:artsy/components/custom_textfield.dart';
import 'package:artsy/pages/HomePage.dart';
import 'package:artsy/pages/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isGuideSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child:  Text(
            "Welcome back",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding:  EdgeInsets.only(top:15.0),
                child:  Text(
                  "Sign In",
                  style: TextStyle(color: Colors.black, fontSize: 28),
                ),
              ),
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
                const CustomTextField(hintText: "Enter guide id",obscureText: false,),
              const CustomTextField(hintText: "Enter your username",obscureText: false,),
              const CustomTextField(hintText: 'Enter your password',obscureText: true),
              const SizedBox(height: 20,),
        
              CustomButton(
                  onTap: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                  btnText: 'Sign In'
              ),
               const SizedBox(height: 200,),
               Column(
                children: [
                  const Text("Don't have an account?",style: TextStyle(color: Colors.grey,fontSize: 18),),
                  TextButton(onPressed: (){Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const SignUpPage()));},
                      child: const Text("Sign Up",style: TextStyle(color: Colors.blue,fontSize: 18,decoration: TextDecoration.underline),)
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
