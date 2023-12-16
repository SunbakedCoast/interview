import 'package:balance/common/core/database/database.dart';
import 'package:balance/common/data/local_source/groups_local_source.dart';
import 'package:balance/common/domain/repository/groups_repository.dart';


class GroupsRepositoryImpl implements GroupsRepository {
  const GroupsRepositoryImpl(GroupsLocalSource localSource)
      : _localSource = localSource;

  final GroupsLocalSource _localSource;
  @override
  Future<dynamic> adjustBalance({
    required int balance,
    required String groupId,
  }) =>
      _localSource.adjustBalance(
        balance,
        groupId,
      );

  @override
  Future<dynamic> insert({required String name}) =>
      _localSource.insert(name: name);

  @override
  Stream<List<Group>> watch() => _localSource.watch();

  @override
  Stream<Group?> watchGroup({required String groupId}) =>
      _localSource.watchGroup(groupId);
}
