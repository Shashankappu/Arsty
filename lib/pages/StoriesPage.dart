import 'package:artsy/components/my_stories_listview.dart';
import 'package:flutter/material.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stories"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: (){
                  //add a search filter for finding stories based on places
                },
                child: const Icon(Icons.search)),
          ),
        ],
      ),
      
      body: MyListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.pushNamed(context, '/addstories'); },
        backgroundColor: Colors.black,
        child:const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
