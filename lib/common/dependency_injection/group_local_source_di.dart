import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/common/core/database/dao/groups_dao.dart';
import 'package:balance/common/data/local_source/local_source.dart';
import 'package:balance/common/service/database/database.dart';

final groupLocalSourceDI = Provider((ref) {
  final databaseDI = ref.read(databaseProvider);
  final groupsDao = GroupsDao(databaseDI);

  return GroupsLocalSource(groupsDao);
});
