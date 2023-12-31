import 'package:flutter/material.dart';
import '../models/Story.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  // Sample data for the list
  final List<Story> stories = [
    Story(name: 'Appu', artName: "Hampi", storyContent: "Hampi, the city of ruins, is a UNESCO World Heritage Site. Situated in the shadowed depth of hills and valleys in the state of Karnataka, this place is a historical delight for travellers. Surrounded by 500 ancient monuments, beautiful temples, bustling street markets, bastions, treasury building and captivating remains of Vijayanagar Empire, Hampi is a backpacker's delight. Hampi is an open museum with 100+ locations to explore and a favourite way to see the city from the perspective of its history."),
    Story(name: 'Kiran', artName: "Goa", storyContent: "A must visit place for sure"),
    Story(name: 'Ramesh', artName: "Kerala", storyContent: """Kerala, a state in the southwest coastal area of India, is spread over 38,863 kilometres squares kilometres. It is the 21st largest state in India in terms of area. Kerala has 14 districts that are enriched with natural beauty. Though a small state, Kerala carries the Western Ghats, farmlands planted with various trees, most significant of which is coconut, the rivers Ponnani (Bharathapuzha), Periyar, Chalakudi, and Pamba that flow to the Arabian Sea and also comprise a variety of flora and fauna as the land and hilly areas are covered with rainforests.Kerala is the 8th largest economy in India which is growing at a faster pace. The IT, industrial, and agricultural sectors in Kerala are flourishing. Tourism in Kerala is at an all-time high because the environment offers different experiences with the changing environment. """),
    Story(name: 'Karthik', artName: "Mauritius", storyContent: "A must visit place for sure"),
  ];

  // Track the expansion state of each item
  late List<bool> isExpanded;

  @override
  void initState() {
    super.initState();
    // Initialize the expansion state to false for all items
    isExpanded = List.generate(stories.length, (index) => false);
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
                leading: Image.asset('assets/images/travel.png',width: 40,height: 40,),
                title: Text(stories[index].artName),
                subtitle: isExpanded[index]
                    ? Text(stories[index].storyContent)
                    : Text(
                  stories[index].storyContent.length > 50
                      ? "${stories[index].storyContent.substring(0, 50)}..."
                      : stories[index].storyContent,
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
