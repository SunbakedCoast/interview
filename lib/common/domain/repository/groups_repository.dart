import 'package:balance/common/core/database/database.dart';

abstract class GroupsRepository {
  Future<dynamic> insert({required String name});
  Future<dynamic> adjustBalance({
    required int balance,
    required String groupId,
  });
  Stream<List<Group>> watch();
  Stream<Group?> watchGroup({required String groupId});
}
