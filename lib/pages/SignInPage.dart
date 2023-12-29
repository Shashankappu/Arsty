import 'package:artsy/pages/HomePage.dart';
import 'package:artsy/pages/SignUpPage.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Center(
          child:  Text(
            "Welcome back",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                  hintText: 'Enter your username ID',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 30.0),
              child:  TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter your password',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage()));
                },
                child: const Text("Sign In",style: TextStyle(color: Colors.black)),
              ),
             const SizedBox(height: 200,),
             Column(
               mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Don't have an account?",style: TextStyle(color: Colors.grey,fontSize: 18),),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const SignUpPage()));
                },
                    child: const Text("Sign Up",style: TextStyle(color: Colors.blue,fontSize: 18,decoration: TextDecoration.underline),)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
