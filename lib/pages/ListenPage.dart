import 'package:artsy/components/MyDrawer.dart';
import 'package:flutter/material.dart';

class ListenPage extends StatelessWidget {
  const ListenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listen Activity"),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
    );
  }
}
