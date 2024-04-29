import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Logout'),
      onPressed: () {
        // This will push to the '/login' route, effectively logging out the user
        Navigator.pushReplacementNamed(context, '/login');
      },
    );
  }
}
