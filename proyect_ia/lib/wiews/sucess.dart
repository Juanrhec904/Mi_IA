import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final List<String> messages;
  final TextEditingController controller;
  final VoidCallback onSend;

  const SuccessScreen({
    super.key,
    required this.messages,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Juan IA")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder:
                  (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Align(
                      alignment:
                          index % 2 == 0
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color:
                              index % 2 == 0
                                  ? Colors.blue
                                  : Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(messages[index]),
                      ),
                    ),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Escribe tu mensaje...',
                    ),
                  ),
                ),
                IconButton(icon: const Icon(Icons.send), onPressed: onSend),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
