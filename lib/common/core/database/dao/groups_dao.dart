import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import 'package:balance/common/core/database/database.dart';
import 'package:balance/common/core/database/tables/groups.dart';

part 'groups_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [Groups])
class GroupsDao extends DatabaseAccessor<Database> with _$GroupsDaoMixin {
  GroupsDao(super.db);

  Future<dynamic> insert(String name) {
    return into(groups)
        .insert(GroupsCompanion.insert(id: const Uuid().v1(), name: name));
  }

  Future<dynamic> adjustBalance(int balance, String groupId) async {
    final companion = GroupsCompanion(balance: Value(balance));
    return (update(groups)..where((tbl) => tbl.id.equals(groupId)))
        .write(companion);
  }

  Stream<List<Group>> watch() => select(groups).watch();

  Stream<Group?> watchGroup(String groupId) {
    return (select(groups)..where((tbl) => tbl.id.equals(groupId)))
        .watchSingleOrNull();
  }
}
