import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  final VoidCallback onStart;

  const InitialScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bienvenido")),
      body: Center(
        child: ElevatedButton(
          onPressed: onStart,
          child: const Text("Siguiente"),
        ),
      ),
    );
  }
}
