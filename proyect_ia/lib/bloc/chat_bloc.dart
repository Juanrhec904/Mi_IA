import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import '../services/openai.dart'; 

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<ChatStarted>((event, emit) {
      emit(ChatSuccess([]));
    });

    on<ChatMessageSent>((event, emit) async {
      final currentState = state;

      if (currentState is ChatSuccess) {
        final updatedMessages = List<String>.from(currentState.messages)
          ..add("Tú: ${event.message}");

        emit(ChatLoading());

        try {
          final response = await ChatAPI.sendMessage(event.message);
          updatedMessages.add("IA: $response");
          emit(ChatSuccess(updatedMessages));
        } catch (e) {
          emit(ChatFailure("Error al obtener respuesta: ${e.toString()}"));
        }
      }
    });

    on<ChatRetry>((event, emit) {
      emit(ChatSuccess([]));
    });
  }
}
