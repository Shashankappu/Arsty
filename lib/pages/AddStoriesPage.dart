import 'package:artsy/components/custom_button.dart';
import 'package:flutter/material.dart';

class AddStoriesPage extends StatelessWidget {
  const AddStoriesPage({super.key});

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
            SizedBox(
              height: 200 ,
              width: 300,
              child: Image.asset('assets/images/story.png'),
            ),
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
                child: const TextField(
                  autofocus: true,
                  maxLength: 700,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'Type your story here..',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                      border: InputBorder.none
                  ),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0,top: 20),
                child: CustomButton(onTap: (){}, btnText: "Add story")
            ),
          ],

        ),
      ),
    );
  }
}
