import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const FailureScreen({super.key, required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Estado: Failure")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
              style: const TextStyle(color: Colors.red, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: onRetry, child: const Text("Reintentar")),
          ],
        ),
      ),
    );
  }
}
