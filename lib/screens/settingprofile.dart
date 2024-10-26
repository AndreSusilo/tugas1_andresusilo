import 'package:flutter/material.dart';
import '../db/db.dart';

class SettingProfileScreen extends StatefulWidget {
  final Map<String, dynamic> user;

  SettingProfileScreen({required this.user});

  @override
  _SettingProfileScreenState createState() => _SettingProfileScreenState();
}

class _SettingProfileScreenState extends State<SettingProfileScreen> {
  late TextEditingController _fullnameController;
  late TextEditingController _emailController;
  final _dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _fullnameController = TextEditingController(text: widget.user['fullname']);
    _emailController = TextEditingController(text: widget.user['email']);
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
    String fullname = _fullnameController.text;
    String email = _emailController.text;

    // Memperbarui profil di database
    await _dbHelper.updateUserProfile(widget.user['id'], fullname, email);

    // Menampilkan snackbar sebagai notifikasi perubahan berhasil
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated successfully')),
    );

    // Kembali dengan data yang diperbarui
    Navigator.pop(context, {'fullname': fullname, 'email': email});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setting Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fullnameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProfile, // Memanggil fungsi update saat ditekan
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
