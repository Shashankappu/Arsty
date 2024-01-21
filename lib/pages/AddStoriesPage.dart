import 'package:artsy/components/custom_button.dart';
import 'package:artsy/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/Story.dart';

class AddStoriesPage extends StatefulWidget {
  const AddStoriesPage({super.key});

  @override
  State<AddStoriesPage> createState() => _AddStoriesPageState();

}

class _AddStoriesPageState extends State<AddStoriesPage> {
  final _storyContentController = TextEditingController();
  final _placenameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Stories"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            SizedBox(
              height: 150,
              child: Column(
                children: [
                  Image.asset('assets/images/addstory.png',width: 100,height: 100,),
                  const Text("Tap to add Image",style: TextStyle(fontSize: 16),)
                ],
              ),
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black)
              ),
              child:  Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                child:  TextField(
                  controller: _placenameController,
                  autofocus: true,
                  decoration: const InputDecoration(
                      hintText: 'Enter place name',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                      border: InputBorder.none
                  ),
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black)
              ),
              // Set the background color if needed
              child:  Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
                child:  TextField(
                  controller: _storyContentController,
                  autofocus: true,
                  maxLength: 700,
                  maxLines: null,
                  decoration: const InputDecoration(
                      hintText: 'Type your story here..',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                      border: InputBorder.none
                  ),
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0,top: 20),
                child: CustomButton(onTap:() async {
                  String? username = UserModel.currentUsername;
                  Story story = Story(username: username, placename: _placenameController.text.trim(),storyContent: _storyContentController.text.trim());
                  await FirebaseFirestore.instance.collection('Stories').add({
                    'username': story.username,
                    'placename': story.placename,
                    'storyContent': story.storyContent,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                  Navigator.pushReplacementNamed(context, '/stories');
                }, btnText: "Add story")
            ),
          ],
        ),
      ),
    );
  }
}
