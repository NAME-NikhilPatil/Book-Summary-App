import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Language'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Implement language selection logic
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Implement notifications settings logic
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Implement privacy policy logic
            },
          ),
          ListTile(
            title: const Text('Terms & Conditions'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Implement terms and conditions logic
            },
          ),
          ListTile(
            title: const Text('Subscription Terms'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Implement subscription terms logic
            },
          ),
          ListTile(
            title: const Text('Delete account'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Implement delete account logic
            },
          ),
          ElevatedButton(
            child: const Text('Log out'),
            onPressed: () {
              // TODO: Implement log out logic
            },
          ),
          TextButton(
            child: const Text('sharmilapetil4289@gmail.com'),
            onPressed: () {
              // TODO: Implement contact support logic
            },
          ),
          const Center(
            child: Text(
              'Version 1.00.0',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
