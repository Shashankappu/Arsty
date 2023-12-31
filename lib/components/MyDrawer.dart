import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  final imageUrl = "https://wallpapers.com/images/high/cool-profile-picture-45bhdh56z2fjf5qv.webp";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(color:Colors.black54,),
                    margin: EdgeInsets.zero,
                    accountName: const Text("Username"),
                    accountEmail: const Text("user@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    )
                )
            ),
            ListTile(
              onTap: (){
                Navigator.pushReplacementNamed(context, "/home");
              },
              leading: const Icon(CupertinoIcons.home, color: Colors.black,),
              title: const Text("Home", style: TextStyle(color: Colors.black),),
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,"/stories");
              },
              leading: const Icon(CupertinoIcons.bubble_left_bubble_right, color: Colors.black,),
              title: const Text("Stories", style: TextStyle(color: Colors.black),),

            ),
            ListTile(
              onTap: (){
                Navigator.pushReplacementNamed(context,"/home");
              },
              leading: const Icon(CupertinoIcons.mail, color: Colors.black,),
              title: const Text("Contact us", style: TextStyle(color: Colors.black),),
            ),
            ListTile(
               onTap: (){
                 FirebaseAuth.instance.signOut();
                 Navigator.pushReplacementNamed(context,'/signIn');
             },
              leading: const Icon(Icons.logout, color: Colors.black,),
              title: const Text("Logout", style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );

  }

}
