import 'package:flutter/material.dart';
import 'package:safe_sense/components/my_list_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  final void Function()? onEmergency;
  final void Function()? onFeedback;
  final void Function()? onPrecaution;

  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut,
    required this.onEmergency,
    required this.onFeedback,
    required this.onPrecaution
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(18, 43, 29, 1),
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

              const SizedBox(height: 8,),

              //home
              MyListTile(
                icon: Icons.home, 
                text: 'H O M E',
                onTap: () => Navigator.pop(context),
              ),

              const SizedBox(height: 8,),

              //profile
              MyListTile(
                icon: Icons.person, 
                text: 'C O N T A C T S',
                onTap: onProfileTap,
              ),

              const SizedBox(height: 8,),

              //precaution
              MyListTile(
                icon: Icons.warning_amber_outlined, 
                text: 'P R E C A U T I O N',
                onTap: onPrecaution,
              ),

              const SizedBox(height: 8,),

              //hotlines
              MyListTile(
                icon: Icons.phone, 
                text: 'B F P  H O T L I N E S',
                onTap: onEmergency,
              ),

              const SizedBox(height: 8,),

              // feeedback
              MyListTile(
                icon: Icons.feedback, 
                text: 'F E E D B A C K',
                onTap: onFeedback,
              ),


              //help
              // MyListTile(
              //   icon: Icons.help_outline, 
              //   text: 'H E L P',
              //   onTap: () async {
              //     launch('mailto:iotbasedhomesafety@gmail.com?');
              //   },
              // ),
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
