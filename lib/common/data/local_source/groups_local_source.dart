import 'package:balance/common/core/database/dao/groups_dao.dart';
import 'package:balance/common/core/database/database.dart';

class GroupsLocalSource {
  const GroupsLocalSource(GroupsDao groupsDao) : _groupsDao = groupsDao;

  final GroupsDao _groupsDao;

  Future<dynamic> insert({required String name}) => _groupsDao.insert(name);

  Future<dynamic> adjustBalance(int balance, String groupId) =>
      _groupsDao.adjustBalance(
        balance,
        groupId,
      );

  Stream<List<Group>> watch() => _groupsDao.watch();

  Stream<Group?> watchGroup(String groupId) => _groupsDao.watchGroup(groupId);
}
