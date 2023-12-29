import 'package:artsy/pages/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white, // Customize the background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            const Padding(
              padding: EdgeInsets.only(top: 40.0),
              child:  Text("Smartsonic",style: TextStyle(color: Colors.black,fontSize: 28),),
            ),
            Container (
                child: Lottie.asset('assets/splash.json'),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text("Welcome",style: TextStyle(color: Colors.black,fontSize: 24),),
            ),
          ]// Replace with your Lottie animation file
        ),
      ),
    );
  }
}
