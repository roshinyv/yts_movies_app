import 'package:flutter/material.dart';
import 'package:yts_app/core/colors/constant_colors.dart';

class More extends StatefulWidget {
  More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text('Account Settings'),
        actions: [
          Row(
            children: const [
              Icon(Icons.edit_outlined),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Manage Profile',
                  style: TextStyle(),
                ),
              )
            ],
          ),
        ],
      ),
      // bottomNavigationBar: const CustomBottomBar(),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(
              Icons.download,
              color: kWhiteColor,
            ),
            title: Text(
              'My Downloads',
              style: TextStyle(color: kWhiteColor),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_on,
              color: kWhiteColor,
            ),
            title: Text(
              'Notification Inbox',
              style: TextStyle(color: kWhiteColor),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: kWhiteColor,
            ),
            title: Text(
              'Settings & Preferences',
              style: TextStyle(color: kWhiteColor),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.file_present,
              color: kWhiteColor,
            ),
            title: Text(
              'Privacy Policy',
              style: TextStyle(color: kWhiteColor),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.help_outline,
              color: kWhiteColor,
            ),
            title: Text(
              'Help & FAQs',
              style: TextStyle(color: kWhiteColor),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.download,
              color: kWhiteColor,
            ),
            title: Text(
              'My Downloads',
              style: TextStyle(color: kWhiteColor),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.call_outlined,
              color: kWhiteColor,
            ),
            title: Text(
              'Contact Us',
              style: TextStyle(color: kWhiteColor),
            ),
          ),
          ListTile(
            title: Text(
              'App Version : 6.1.89',
              style: TextStyle(color: kWhiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
