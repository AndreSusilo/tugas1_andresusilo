import 'package:flutter/material.dart';
import 'login.dart';
import 'settingprofile.dart';

class DashboardScreen extends StatefulWidget {
  final Map<String, dynamic> user;

  DashboardScreen({required this.user});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Map<String, dynamic> _user; // Buat variabel lokal untuk menyimpan user

  @override
  void initState() {
    super.initState();
    _user =
        Map<String, dynamic>.from(widget.user); // Salin data ke variabel lokal
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _openSettings(BuildContext context) async {
    final updatedUser = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingProfileScreen(user: _user),
      ),
    );

    // Jika updatedUser tidak null, perbarui state dengan data baru
    if (updatedUser != null) {
      setState(() {
        _user['fullname'] = updatedUser['fullname'];
        _user['email'] = updatedUser['email'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _openSettings(context),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${_user['fullname']}!'),
            Text('Email: ${_user['email']}'),
          ],
        ),
      ),
    );
  }
}
