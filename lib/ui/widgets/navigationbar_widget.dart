import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon6/ui/screens/add_goal_screen.dart';
import 'package:imtihon6/ui/screens/goal_screen.dart';
import 'package:imtihon6/ui/screens/home_screen.dart';
import 'package:imtihon6/ui/screens/notifications_screen.dart';
import 'package:imtihon6/ui/screens/settings_screen.dart';

class NavigationbarWidget extends StatelessWidget {
  const NavigationbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (ctx) {
                return const HomeScreen();
              }));
            },
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (ctx) {
                return const GoalScreen();
              }));
            },
            icon: const Icon(Icons.done),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (ctx) {
                return const AddGoalScreen();
              }));
            },
            icon: const Icon(
              Icons.add,
              size: 40,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (ctx) {
                return const NotificationsScreen();
              }));
            },
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (ctx) {
                return const SettingsScreen();
              }));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
