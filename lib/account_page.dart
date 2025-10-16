import 'package:flutter/material.dart';
import 'package:aura_music_app/login_screen.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // User Profile Picture and Name
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
              ),
              const SizedBox(height: 16),
              const Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'john.doe@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(height: 30),
              const Divider(color: Colors.grey),

              // Settings Options
              _buildListTile(
                icon: Icons.person_outline,
                title: 'Edit Profile',
                onTap: () {},
              ),
              _buildListTile(
                icon: Icons.notifications_none,
                title: 'Notifications',
                onTap: () {},
              ),
              _buildListTile(
                icon: Icons.lock_outline,
                title: 'Privacy',
                onTap: () {},
              ),
              _buildListTile(
                icon: Icons.security,
                title: 'Security',
                onTap: () {},
              ),
              const Divider(color: Colors.grey),
              _buildListTile(
                icon: Icons.logout,
                title: 'Log Out',
                isLogout: true,
                onTap: () {
                  // Navigate back to the login screen and remove all previous routes
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                        (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for list tiles to avoid repetition
  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: isLogout ? Colors.red : Colors.white),
      ),
      trailing: isLogout ? null : const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: onTap,
    );
  }
}