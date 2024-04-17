import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  // function untuk menampilkan user from contact us dengan show dialog
  void _showContactUsForm() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Contact Us'),
          content: const Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Message',
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // menampilkan pesan terkirim dan mengemablikan dialog
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Message sent!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 58, 152, 183),
              ),
              child: const Text('Send'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome KasirDent Apps'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 181, 228, 244),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: Column(children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 300,
                height: 300,
              ),
            ),
            const Text(
              'Selamat datang di era baru dalam manajemen penjualan Anda! Kami dengan bangga mempersembahkan KasirDent Apps, solusi terdepan untuk kebutuhan kasir dan manajemen bisnis Anda. KasirDent Apps bukan hanya sebuah aplikasi kasir biasa; ini adalah kunci sukses bagi bisnis Anda.\nDengan fitur-fitur canggih yang dirancang untuk memudahkan transaksi, mengelola inventaris, dan menganalisis data penjualan, KasirDent Apps membawa pengalaman kasir Anda ke level berikutnya.\n Antarmuka yang intuitif memastikan bahwa siapa pun dapat dengan mudah menggunakan aplikasi ini tanpa pelatihan khusus. Dari usaha kecil hingga perusahaan besar, KasirDent Apps menyediakan solusi yang dapat disesuaikan sesuai dengan kebutuhan bisnis Anda. Dengan kemampuan untuk menerima berbagai jenis pembayaran, memantau stok secara real-time, dan menghasilkan laporan penjualan yang terperinci, KasirDent Apps memberdayakan Anda untuk mengambil keputusan bisnis yang lebih baik dan lebih cepat.\nSegera bergabunglah dengan ribuan bisnis yang telah memilih KasirDent Apps sebagai mitra mereka dalam mencapai kesuksesan. Mulailah perjalanan Anda menuju efisiensi, akurasi, dan pertumbuhan dengan KasirDent Apps hari ini!',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showContactUsForm();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 58, 152, 183),
              ),
              child: const Text('Contact Us'),
            ),
          ]),
        ),
      ),
    );
  }
}
