import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? username;

  const HomePage({super.key, this.username});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _bmi = 0;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              Text(
                'Selamat datang, ${widget.username ?? 'Unknown'}!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              Column(
                children: [
                  const Text(
                    'BMI Anda',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _result,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Kategori: ${_getCategory(_bmi)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              TextField(
                controller: _heightController,
                decoration: const InputDecoration(
                  labelText: 'Tinggi badan (cm)',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _weightController,
                decoration: const InputDecoration(
                  labelText: 'Berat badan (kg)',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  double height = double.parse(_heightController.text) / 100;
                  double weight = double.parse(_weightController.text);

                  setState(() {
                    _bmi = weight / (height * height);
                    _result = _bmi.toStringAsFixed(2);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  'Hitung BMI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _heightController.clear();
                    _weightController.clear();
                    _bmi = 0;
                    _result = '';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _getCategory(double bmi) {
  if (bmi < 18.5) {
    return 'Kurus';
  } else if (bmi >= 18.5 && bmi < 25) {
    return 'Normal';
  } else if (bmi >= 25 && bmi < 30) {
    return 'Gemuk';
  } else {
    return 'Obesitas';
  }
}
