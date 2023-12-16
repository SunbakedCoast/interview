import 'package:balance/common/core/database/database.dart';
import 'package:balance/common/dependency_injection/group_repository_di.dart';
import 'package:balance/common/domain/repository/groups_repository.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final groupsProvider =
    StateNotifierProvider<GroupsStateNotifer, Stream<List<Group>>>((ref) {
  final repository = ref.read(groupRepositoryDI);
  return GroupsStateNotifer(repository: repository);
});

class GroupsStateNotifer extends StateNotifier<Stream<List<Group>>> {
  GroupsStateNotifer({
    required this.repository,
    Stream<List<Group>>? state,
  }) : super(state ?? const Stream<List<Group>>.empty());

  final GroupsRepository repository;

  void getAll() {
    final data = repository.watch();
    state = data;
  }
}
