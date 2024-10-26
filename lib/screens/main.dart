import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Beranda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TypewriterAnimatedTextKit(
                repeatForever: false, // Animasi hanya sekali
                totalRepeatCount: 1,
                text: ['Aplikasi Beranda'],
                textStyle: TextStyle(
                  fontSize: 18.0, // Ukuran teks diubah menjadi lebih kecil
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Warna teks yang sama dengan tombol
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 18.0, // Ukuran teks diubah menjadi lebih kecil
                fontWeight: FontWeight.bold,
                color: Colors.white, // Warna teks yang sama dengan tombol
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent.shade100, Colors.lightBlue.shade400],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang di Aplikasi Saya',
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Silakan Login untuk melanjutkan',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 30),
                Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.white, // Ganti dengan warna yang sesuai
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
