import 'ai_models.dart';
import 'skills/ai_skill.dart';
import 'skills/app_help_skill.dart';
import 'skills/consumption_skill.dart';
import 'skills/finance_skill.dart';
import 'skills/history_skill.dart';
import 'skills/product_skill.dart';
import 'skills/routine_skill.dart';
import 'skills/task_skill.dart';
import 'skills/workout_skill.dart';

class AiSkillRegistry {
  AiSkillRegistry({List<AiSkill>? skills})
    : _skills =
          skills ??
          const [
            RoutineSkill(),
            WorkoutSkill(),
            FinanceSkill(),
            ConsumptionSkill(),
            ProductSkill(),
            TaskSkill(),
            HistorySkill(),
            AppHelpSkill(),
          ];

  final List<AiSkill> _skills;

  List<AiSkill> get all => _skills;

  AiSkill? findById(String id) {
    for (final skill in _skills) {
      if (skill.id == id) {
        return skill;
      }
    }
    return null;
  }

  AiSkill? findForIntent(AiParsedIntent intent) {
    for (final skill in _skills) {
      if (skill.canHandle(intent)) {
        return skill;
      }
    }
    return null;
  }
}
