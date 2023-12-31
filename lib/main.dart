import 'package:artsy/pages/AddStoriesPage.dart';
import 'package:artsy/pages/HomePage.dart';
import 'package:artsy/pages/ListenPage.dart';
import 'package:artsy/pages/SignInPage.dart';
import 'package:artsy/pages/SignUpPage.dart';
import 'package:artsy/pages/StoriesPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if(snapshot.hasData && snapshot.data!=null){
              return const HomePage();
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          return const SignInPage();
        },
      ),
      routes: {
        '/signIn': (context) => const SignInPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
        '/listen': (context) => const ListenPage(),
        '/stories':(context) => const StoriesPage(),
        '/addstories':(context) => const AddStoriesPage(),

      },
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
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
    await Future.delayed(const Duration(seconds: 3), () {});
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
            SizedBox (
              height: 300,
                width: 300,
                child: Lottie.asset('assets/splash/splas.json'),
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
