import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_ia/wiews/failure.dart';
import 'package:proyect_ia/wiews/inicio.dart';
import 'package:proyect_ia/wiews/loanding.dart';
import 'package:proyect_ia/wiews/sucess.dart';
import 'bloc/chat_bloc.dart';
import 'bloc/chat_event.dart';
import 'bloc/chat_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat IA',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => ChatBloc(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state is ChatInitial) {
          return InitialScreen(
            onStart: () {
              context.read<ChatBloc>().add(ChatStarted());
            },
          );
        } else if (state is ChatLoading) {
          return const LoadingScreen();
        } else if (state is ChatSuccess) {
          return SuccessScreen(
            messages: state.messages,
            controller: _controller,
            onSend: () {
              final message = _controller.text.trim();
              if (message.isNotEmpty) {
                context.read<ChatBloc>().add(ChatMessageSent(message));
                _controller.clear();
              }
            },
          );
        } else if (state is ChatFailure) {
          return FailureScreen(
            error: state.error,
            onRetry: () {
              context.read<ChatBloc>().add(ChatRetry());
            },
          );
        } else {
          return const Scaffold(
            body: Center(child: Text("Estado desconocido")),
          );
        }
      },
    );
  }
}
