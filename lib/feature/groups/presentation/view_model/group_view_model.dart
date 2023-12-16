import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/common/dependency_injection/dependency_injection.dart';
import 'package:balance/common/domain/repository/repository.dart';
import 'package:balance/common/core/database/database.dart';

final groupProvider =
    StateNotifierProvider<GroupStateNotifier, Stream<Group?>>((ref) {
  final repository = ref.read(groupRepositoryDI);
  return GroupStateNotifier(
    repository: repository,
  );
});

class GroupStateNotifier extends StateNotifier<Stream<Group?>> {
  GroupStateNotifier({
    required this.repository,
    Stream<Group?>? state,
  }) : super(state ?? const Stream<Group?>.empty());

  final GroupsRepository repository;

  void getGroup({required String groupId}) {
    final data = repository.watchGroup(groupId: groupId);
    state = data;
  }

  void adjustBalance({required int balance, required String groupId}) {
    repository.adjustBalance(balance: balance, groupId: groupId);
  }
}
