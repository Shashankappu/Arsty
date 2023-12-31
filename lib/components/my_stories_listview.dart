import 'package:flutter/material.dart';
import '../models/Story.dart';

class MyListView extends StatelessWidget {
  // Sample data for the list
  final List<Story> stories = [
    Story(name: 'Shashank', artName: "Hampi", storyContent: "A must visit place for sure"),
    Story(name: 'Ramesh', artName: "Goa", storyContent: "A must visit place for sure"),
    Story(name: 'Kiran', artName: "Kerala", storyContent: "A must visit place for sure"),
    Story(name: 'Karthik', artName: "Mauritius", storyContent: "A must visit place for sure"),
  ];
  MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: stories.length,
      itemBuilder: (context, index) {
        return Container(
          margin:const EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)
          ),
          child: ListTile(
            title: Text(stories[index].artName),
            subtitle: Text(stories[index].storyContent),
            leading:   CircleAvatar(
              child: Image.asset("assets/images/travel.png"),
          ),
                  )
        );
      },
      separatorBuilder: (context, index) {
        // Define the separator widget
        return const Divider(
          color: Colors.white38,
          thickness: 1.0,
        );
      },
    );
  }
}