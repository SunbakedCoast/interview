import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/common/dependency_injection/dependency_injection.dart';
import 'package:balance/common/domain/repository/repository.dart';
import 'package:balance/feature/home/domain/model/model.dart';

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
      reset();
    } catch (e) {
      throw Exception(e);
    }
  }
}
