import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Story.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  late List<Story> stories;
  late List<bool> isExpanded;

  @override
  void initState() {
    super.initState();
    // Initialize the list of stories
    stories = [];
    // Initialize the list of expansion states
    isExpanded = [];
    // Fetch stories from Firestore
    fetchStories();
  }

  Future<void> fetchStories() async {
    try {
      // Reference to the 'Stories' collection in Firestore
      QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('Stories').get();

      // Parse the data and update the stories and isExpanded lists
      setState(() {
        stories = snapshot.docs
            .map((doc) => Story(
          username: doc['username'],
          placename: doc['placename'],
          storyContent: doc['storyContent'],
        ))
            .toList();
        // Initialize the list of expansion states based on the length of stories
        isExpanded = List.generate(stories.length, (index) => false);
      });
    } catch (e) {
      print('Error fetching stories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: stories.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/images/travel.png',
                  width: 40,
                  height: 40,
                ),
                title: Text(stories[index].placename),
                subtitle: isExpanded[index]
                    ? Text(stories[index].storyContent)
                    : Text(
                  stories[index].storyContent.length > 50
                      ? "${stories[index].storyContent.substring(0, 50)}..."
                      : stories[index].storyContent,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  // Toggle the expansion state when tapped
                  setState(() {
                    isExpanded[index] = !isExpanded[index];
                  });
                },
              ),
            ],
          ),
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
