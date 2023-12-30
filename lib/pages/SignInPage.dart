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
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Center(
          child:  Text(
            "Welcome back,\tSign In",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                  child: Lottie.asset('assets/splash/world.json')
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
                const CustomTextField(hintText: "Guide id",obscureText: false,),
              const CustomTextField(hintText: "Username",obscureText: false,),
              const CustomTextField(hintText: 'Password',obscureText: true),
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
