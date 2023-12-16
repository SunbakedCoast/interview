import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/feature/groups/domain/repository/repository.dart';
import 'package:balance/common/core/database/database.dart';

class TransactionsStateNotifier
    extends StateNotifier<Stream<List<Transaction>>> {
  TransactionsStateNotifier({
    required this.repository,
    Stream<List<Transaction>>? state,
  }) : super(state ?? const Stream<List<Transaction>>.empty());

  final TransactionRepository repository;

  void getAll() {
    try {
      final data = repository.watch();
      state = data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
