import 'dart:convert';

import '../../data/repositories/personal_repository.dart';
import 'ai_models.dart';

class AiContextManager {
  AiContextManager(this._repository);

  static const String _storageKey = 'ai_conversation_state';

  final PersonalRepository _repository;

  Future<AiConversationState?> loadConversationState() async {
    final raw = await _repository.loadUserPreference(_storageKey);
    if (raw == null || raw.trim().isEmpty) {
      return null;
    }

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, Object?>) {
        return null;
      }
      return AiConversationState.fromJson(decoded);
    } catch (_) {
      return null;
    }
  }

  Future<void> saveConversationState(AiConversationState state) {
    return _repository.saveUserPreference(
      _storageKey,
      jsonEncode(state.toJson()),
    );
  }

  Future<void> clearConversationState() {
    return _repository.clearUserPreference(_storageKey);
  }
}
