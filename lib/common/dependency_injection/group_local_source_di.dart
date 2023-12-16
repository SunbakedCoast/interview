import 'package:balance/common/core/database/dao/groups_dao.dart';
import 'package:balance/common/data/local_source/groups_local_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final groupLocalSourceDI = Provider((ref) {
  final groupsDao = GroupsDao();

  return GroupsLocalSource(groupsDao);
});
