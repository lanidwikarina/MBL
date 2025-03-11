import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 153, 184),
        appBar: AppBar(title: const Text('App - Lani Dwi Karina')),
        body: const InputScreen(),
      ),
    );
  }
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _controller = TextEditingController();
  String _displayText = ''; // Variabel untuk menampilkan teks

  void _showText() {
    setState(() {
      _displayText = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 40), // Memberikan ruang kosong di atas

          const Text(
            'Welcome to My App',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 233, 230, 234),
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 248, 127, 202),
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),

          const SizedBox(height: 50), // Jarak lebih besar dengan ikon

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.star, size: 50, color: Colors.amber),
              Icon(Icons.favorite, size: 50, color: Colors.red),
              Icon(Icons.thumb_up, size: 50, color: Colors.blue),
              Icon(Icons.home, size: 50, color: Colors.green),
              Icon(Icons.lightbulb, size: 50, color: Colors.yellow),
            ],
          ),

          const SizedBox(height: 40), // Jarak lebih besar dengan gambar

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gambar lokal
              Image.asset(
                'assets/bunga.jpg',
                width: 150,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Gambar lokal tidak ditemukan',
                    style: TextStyle(color: Colors.red),
                  );
                },
              ),
              const SizedBox(width: 20), // Jarak lebih besar antar gambar
              // Gambar dari URL
              Image.network(
                'https://ik.imagekit.io/tvlk/blog/2024/08/shutterstock_2373316383.jpg',
                width: 150,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Gagal memuat gambar dari URL',
                    style: TextStyle(color: Colors.red),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 40), // Jarak lebih besar dengan input field

          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Ketik nama kamu',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(
            height: 20,
          ), // Jarak lebih besar antara input dan tombol

          ElevatedButton(
            onPressed: _showText,
            child: const Text('Tampilkan jawabannya'),
          ),

          const SizedBox(height: 20), // Jarak lebih besar dengan teks output

          Text(
            _displayText,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const Spacer(), // Mengisi sisa ruang agar lebih proporsional
        ],
      ),
    );
  }
}
