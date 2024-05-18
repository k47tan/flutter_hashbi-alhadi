import 'package:flutter/material.dart';
import 'result_page.dart';
import '../services/recommendation_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _cameraController = TextEditingController();
  final TextEditingController _memoryController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _priceController.dispose();
    _cameraController.dispose();
    _memoryController.dispose();
    super.dispose();
  }

  void _getRecommendation() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        final result = await RecommendationService().getRecommendation(
          price: int.parse(_priceController.text),
          camera: _cameraController.text,
          internalMemory: _memoryController.text,
        );

        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                gptData: result,
              ),
            ),
          );
        }
      } catch (e) {
        final snackBar = SnackBar(
          content: Text('Terjadi Kesalahan $e'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar AI'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Rekomendasi HP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    hintText: 'Price',
                    labelText: 'Masukan harga',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harga tidak boleh kosong';
                    }
                    // Add additional validation if needed (e.g., numeric check).
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _cameraController,
                  decoration: const InputDecoration(
                    hintText: 'Camera',
                    labelText: 'Masukan spesifikasi kamera',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Spesifikasi kamera tidak boleh kosong';
                    }
                    // Add additional validation if needed.
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _memoryController,
                  decoration: const InputDecoration(
                    hintText: 'Internal Memory',
                    labelText: 'Masukan Internal Memory yang diinginkan',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Internal Memory tidak boleh kosong';
                    }
                    // Add additional validation if needed.
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: _getRecommendation,
                  child: Text('Kirim'),
                ),
              ),
              const SizedBox(height: 20),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
