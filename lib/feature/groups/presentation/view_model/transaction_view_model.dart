import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/common/core/database/database.dart';
import 'package:balance/feature/groups/domain/repository/repository.dart';
import 'package:balance/feature/groups/dependendcy_injection/dependency_injection.dart';

final transactionProvider =
    StateNotifierProvider<TransactionNotifier, Stream<Transaction?>>((ref) {
  final repository = ref.read(transactionsRepositoryDI);
  return TransactionNotifier(repository: repository);
});

class TransactionNotifier extends StateNotifier<Stream<Transaction?>> {
  TransactionNotifier({
    required this.repository,
    Stream<Transaction?>? state,
  }) : super(state ?? const Stream<Transaction?>.empty());

  final TransactionRepository repository;

  void insert({required int amount, required String groupId}) {
    repository.insert(amount: amount, groupId: groupId);
  }
}
