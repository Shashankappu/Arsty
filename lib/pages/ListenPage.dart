import 'package:flutter/material.dart';
import '../components/MyDrawer.dart';

class ListenPage extends StatelessWidget {
  const ListenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listen Activity"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: 350,
                    height: 430,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black)
                    ),
                    // Set the background color if needed
                    child: const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        'Your Text Goes Here',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.mic),
                      onPressed: () {
                        //Google TTS integration
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
