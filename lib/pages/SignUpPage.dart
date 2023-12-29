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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Radio buttons for Guide and Traveller
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
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
              Padding(
                padding:  const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0,bottom: 0.0),
                child:  TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter your Guide ID',
                    hintStyle: const TextStyle(color: Colors.grey)
                  ),
                ),
              ),
            Padding(
              padding:  const EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 0.0),
              child:  TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter your username',
                    hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding:  const EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 0.0),
              child:  TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter your email',
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 0.0),
              child:  TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter your password',
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),
            Padding(
              padding:  const EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 30.0),
              child:  TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Confirm your password',
                    hintStyle: const TextStyle(color: Colors.grey)
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage()));
                },
                child: const Text("Sign Up",style: TextStyle(color: Colors.black)),
              ),
            SizedBox(height: 100,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
    );
  }
}
