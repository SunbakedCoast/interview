import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/common/data/repository/repository.dart';
import 'package:balance/common/dependency_injection/dependency_injection.dart';

final groupRepositoryDI = Provider((ref) {
  final localSource = ref.read(groupLocalSourceDI);
  return GroupsRepositoryImpl(localSource);
});
