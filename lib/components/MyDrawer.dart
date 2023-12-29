import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  final imageUrl = "https://wallpapers.com/images/high/cool-profile-picture-45bhdh56z2fjf5qv.webp";
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      width: 250,
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
                padding : EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    accountName: const Text("Username"),
                    accountEmail: const Text("user@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    )
                )
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.black,),
              title:Text("Home" ,style: TextStyle(color: Colors.black),),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.settings,color: Colors.black,),
              title:Text("Settings",style: TextStyle(color: Colors.black),),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.mail,color: Colors.black,),
              title:Text("Contact us",style: TextStyle(color: Colors.black),),
            ),
            const ListTile(
              leading: Icon(Icons.logout,color: Colors.black,),
              title:Text("Logout",style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}