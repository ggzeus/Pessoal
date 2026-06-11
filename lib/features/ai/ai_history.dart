import '../../data/local/database/app_database.dart';
import '../../data/repositories/personal_repository.dart';
import 'ai_models.dart';

class AiHistoryService {
  AiHistoryService(this._repository);

  final PersonalRepository _repository;

  Future<void> saveInteraction({
    required String userMessage,
    required String aiResponse,
    required AiIntentType actionType,
    required AiModule module,
    String? metadataJson,
  }) {
    return _repository.addAiHistoryEntry(
      userMessage: userMessage,
      aiResponse: aiResponse,
      actionType: actionType.storageValue,
      module: module.storageValue,
      metadataJson: metadataJson,
    );
  }

  Future<List<AiHistoryEntry>> loadRecent({int limit = 30}) {
    return _repository.loadAiHistoryEntries(limit: limit);
  }

  Future<void> clear() {
    return _repository.clearAiHistory();
  }
}
