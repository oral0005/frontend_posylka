  import 'package:flutter/material.dart';

  class ProfileScreen extends StatefulWidget {
    const ProfileScreen({Key? key}) : super(key: key);

    @override
    State<ProfileScreen> createState() => _ProfileScreenState();
  }

  class _ProfileScreenState extends State<ProfileScreen> {
    // Sample user data; replace these with actual data from your backend or state management solution
    String username = "JohnDoe";
    String phoneNumber = "123-456-7890";
    String name = "John";
    String surname = "Doe";
    String about = "This is the user's about section. Replace with real data.";

    // Controllers for editing user information
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController surnameController = TextEditingController();

    @override
    void initState() {
      super.initState();
      // Initialize controllers with existing data
      usernameController.text = username;
      nameController.text = name;
      surnameController.text = surname;
    }

    void saveChanges() {
      setState(() {
        username = usernameController.text;
        name = nameController.text;
        surname = surnameController.text;
      });

      // Add logic to update the backend with the new data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // Profile Picture
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile.jpg'), // Example image
                ),
              ),
            ),

            // Display user information
            buildName(),
            const SizedBox(height: 20),
            buildUsernameField(),
            const SizedBox(height: 16),
            buildNameField(),
            const SizedBox(height: 16),
            buildSurnameField(),
            const SizedBox(height: 32),

            // Save Changes Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                onPressed: saveChanges,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // Blue background color like login page
                  elevation: 5,
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  // Logout logic
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // Red background for logout button
                  elevation: 5,
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.redAccent, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildName() => Column(
      children: [
        Text(
          '$name $surname',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          phoneNumber, // Display phone number
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );

    // Styled Username Field
    Widget buildUsernameField() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        controller: usernameController,
        decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: const TextStyle(color: Colors.grey), // Label text color
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Padding for input
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            // Focused border color
          ),
        ),
      ),
    );

    // Styled Name Field
    Widget buildNameField() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: 'First Name',
          labelStyle: const TextStyle(color: Colors.grey), // Label text color
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Padding for input
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            // Focused border color
          ),
        ),
      ),
    );

    // Styled Surname Field
    Widget buildSurnameField() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        controller: surnameController,
        decoration: InputDecoration(
          labelText: 'Last Name',
          labelStyle: const TextStyle(color: Colors.grey), // Label text color
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Padding for input
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            // Focused border color
          ),
        ),
      ),
    );
  }
