import 'package:flutter/material.dart';
import 'screens/profile_screen.dart';
import 'screens/history_screen.dart';
import 'screens/my_posts_screen.dart';
import 'screens/posts_screen.dart';
import 'screens/login_screen.dart'; // Import login screen
import 'screens/register_screen.dart'; // Import register screen

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/login', // Start with the login page
      routes: {
        '/login': (context) => const LoginScreen(), // Login screen route
        '/register': (context) => const RegisterScreen(), // Register screen route
        '/home': (context) => const NavigationExample(), // Main app with navigation
      },
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Icons.post_add),
            label: 'My Posts',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Posts',
          ),
        ],
      ),
      body: <Widget>[
        const ProfileScreen(),
        const HistoryScreen(),
        const MyPostsScreen(),
        const PostsScreen(),
      ][currentPageIndex],
    );
  }
}
