import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula/screen/login_screen.dart';
import 'package:flutter_pemula/screen/profil_screen.dart';
import 'package:flutter_pemula/screen/uraian_kerja_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({
    super.key,
    required this.title,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// logout
  Future<void> _logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');

    // Arahkan pengguna kembali ke layar login
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

// navigate ke profil screen
  void _navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UraianKerjaScreen(
          title: 'Uraian Kerja',
        ),
      ),
    );
  }

  void _navigateToGaleri(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilScreen(
          title: 'Data CRUD',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, // Jumlah kolom
          crossAxisSpacing: 10, // Jarak antar kolom
          mainAxisSpacing: 10, // Jarak antar baris
          children: List.generate(menuItems.length, (index) {
            return GestureDetector(
              onTap: () {
                // Tambahkan tindakan saat item diklik
                if (menuItems[index].title == 'Uraian Kerja') {
                  _navigateToProfile(context);
                } else if (menuItems[index].title == 'Profile') {
                  _navigateToGaleri(context);
                } else {
                  if (kDebugMode) {
                    print('Menu item ${menuItems[index].title} diklik');
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(menuItems[index].icon, size: 50, color: Colors.blue),
                    const SizedBox(height: 10),
                    Text(
                      menuItems[index].title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// Model untuk item menu
class MenuItem {
  final String title;
  final IconData icon;

  MenuItem(this.title, this.icon);
}

// Daftar item menu
List<MenuItem> menuItems = [
  MenuItem('Uraian Kerja', Icons.edit),
  MenuItem('Settings', Icons.settings),
  MenuItem('Notifications', Icons.notifications),
  MenuItem('Messages', Icons.message),
  MenuItem('Contacts', Icons.contacts),
  MenuItem('Profile', Icons.person),
  // Tambahkan item menu lain sesuai kebutuhan
];
