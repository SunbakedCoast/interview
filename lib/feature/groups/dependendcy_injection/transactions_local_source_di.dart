import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/common/core/database/dao/transactions_dao.dart';
import 'package:balance/feature/groups/data/local_source/local_source.dart';

final transactionsLocalSourceDI = Provider((ref) {
  final transactionDao = TransactionsDao();

  return TransactionsLocalSource(transactionDao);
});
