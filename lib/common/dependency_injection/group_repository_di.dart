
import 'package:balance/common/data/repository/groups_repository_impl.dart';
import 'package:balance/common/dependency_injection/group_local_source_di.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final groupRepositoryDI = Provider((ref) {
  final localSource = ref.read(groupLocalSourceDI);
  return GroupsRepositoryImpl(localSource);
});
