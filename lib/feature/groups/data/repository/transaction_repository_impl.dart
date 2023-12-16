import 'package:balance/common/core/database/database.dart';
import 'package:balance/feature/groups/data/local_source/local_source.dart';
import 'package:balance/feature/groups/domain/repository/repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  const TransactionRepositoryImpl(TransactionsLocalSource localSource)
      : _localSource = localSource;

  final TransactionsLocalSource _localSource;

  @override
  Future<dynamic> insert({required int amount, required String groupId}) =>
      _localSource.insert(
        amount: amount,
        groupId: groupId,
      );

  @override
  Stream<List<Transaction>> watch() => _localSource.watch();

  @override
  Stream<Transaction?> watchTransaction({required String transactionId}) =>
      _localSource.watchTransaction(transactionId);
}
