import 'package:flutter/material.dart';
import 'package:safe_sense/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(64, 131, 93, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //header
              const DrawerHeader(child:
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 64,
                ),
              ),

              //home
              MyListTile(
                icon: Icons.home, 
                text: 'H O M E',
                onTap: () =>  Navigator.pop(context),
              ),

              //profile
              MyListTile(
                icon: Icons.person, 
                text: 'C O N T A C T S',
                onTap: onProfileTap,
              ),
            ],
          ),

          //logout

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              icon: Icons.logout, 
              text: 'L O G O U T',
              onTap: onSignOut,
            ),
          ),
        ],
      ),
    );
  }
}