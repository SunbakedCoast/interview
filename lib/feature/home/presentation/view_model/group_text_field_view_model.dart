
import 'package:balance/common/dependency_injection/group_repository_di.dart';
import 'package:balance/feature/home/domain/model/group_text_field_model.dart';
import 'package:balance/common/domain/repository/groups_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final groupTextFieldProvider =
    StateNotifierProvider<GroupTextFieldStateNotifier, GroupTextFieldModel>(
        (ref) {
  final repository = ref.read(groupRepositoryDI);
  return GroupTextFieldStateNotifier(repository: repository);
});

class GroupTextFieldStateNotifier extends StateNotifier<GroupTextFieldModel> {
  GroupTextFieldStateNotifier({
    required this.repository,
    GroupTextFieldModel? state,
  }) : super(state ?? const GroupTextFieldModel.initial());

  final GroupsRepository repository;

  void reset() => state = const GroupTextFieldModel.initial();

  void onChanged(String text) => state = state.copyWith(groupName: text);

  Future<void> onSubmit() async {
    try {
      await repository.insert(name: state.groupName);
    } catch (e) {
      throw Exception(e);
    }
  }
}
