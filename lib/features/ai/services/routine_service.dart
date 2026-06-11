import '../../../data/local/database/app_database.dart';
import '../../../data/repositories/personal_repository.dart';

class RoutineCreationRequest {
  const RoutineCreationRequest({
    required this.title,
    required this.type,
    required this.startMinutes,
    required this.endMinutes,
    required this.weekdays,
    this.description,
    this.notify = false,
    this.variable = true,
  });

  final String title;
  final String type;
  final int startMinutes;
  final int endMinutes;
  final List<int> weekdays;
  final String? description;
  final bool notify;
  final bool variable;
}

class RoutineService {
  RoutineService(this._repository);

  final PersonalRepository _repository;

  Future<List<RoutineEvent>> createRecurringItems(
    RoutineCreationRequest request,
  ) async {
    final items = <RoutineEvent>[];
    for (final weekday in request.weekdays) {
      final item = await _repository.addRoutineEvent(
        title: request.title,
        type: request.type,
        weekday: weekday,
        startMinutes: request.startMinutes,
        endMinutes: request.endMinutes,
        description: request.description,
        notify: request.notify,
        variable: request.variable,
      );
      items.add(item);
    }
    return items;
  }
}
