import 'package:flutter/material.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff92A3FD),
        title: const Text('Account'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 60,
            backgroundImage:
                AssetImage('assets/images/male.png'), // Replace with your image
          ),
          const SizedBox(height: 20),
          const Text(
            'Welcome, Guest Name', // Replace with the actual guest name
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 30,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 180),
            title: const Text('Profile'),
            onTap: () {
              // Handle profile button tap
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 160),
            title: const Text('Daily Streaks'),
            onTap: () {
              // Handle settings button tap
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 180),
            title: const Text('Badges'),
            onTap: () {
              // Handle logout button tap
            },
          ),
        ],
      ),
    );
  }
}
