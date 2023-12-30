import 'package:flutter/material.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stories"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.pushNamed(context, '/addstories'); },
        backgroundColor: Colors.black,
        child:const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
