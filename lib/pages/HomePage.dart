import 'package:flutter/material.dart';
import '../components/MyDrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Home Page"),),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.logout) ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
