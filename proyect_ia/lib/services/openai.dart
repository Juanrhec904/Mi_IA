import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatAPI {
  static const String _apiKey =
      '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';
  static const String _endpoint =
      'https://openrouter.ai/api/v1/chat/completions';

  static Future<String> sendMessage(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse(_endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          "model": "mistralai/mistral-7b-instruct",
          "messages": [
            {"role": "user", "content": prompt},
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['choices'][0]['message']['content'];
        return content.toString().trim();
      } else {
        throw Exception('Error en la API: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de red: $e');
    }
  }
}
