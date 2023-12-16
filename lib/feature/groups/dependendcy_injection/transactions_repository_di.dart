import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/feature/groups/dependendcy_injection/dependency_injection.dart';
import 'package:balance/feature/groups/data/repository/repository.dart';

final transactionsRepositoryDI = Provider((ref) {
  final localSource = ref.read(transactionsLocalSourceDI);

  return TransactionRepositoryImpl(localSource);
});
