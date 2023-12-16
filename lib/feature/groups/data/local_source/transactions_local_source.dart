import 'package:balance/common/core/database/dao/transactions_dao.dart';
import 'package:balance/common/core/database/database.dart';

class TransactionsLocalSource {
  const TransactionsLocalSource(TransactionsDao transactionsDao)
      : _transactionsDao = transactionsDao;

  final TransactionsDao _transactionsDao;

  Future<dynamic> insert({required int amount, required String groupId}) =>
      _transactionsDao.insert(amount, groupId);

  Stream<List<Transaction>> watch() => _transactionsDao.watchh();

  Future<dynamic> updateAmount({
    required int amount,
    required String transactionId,
  }) =>
      _transactionsDao.updateAmount(amount, transactionId);

  Stream<Transaction?> watchTransaction(String transactionId) =>
      _transactionsDao.watchTransaction(transactionId);
}
