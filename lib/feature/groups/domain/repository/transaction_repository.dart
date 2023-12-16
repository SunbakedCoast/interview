import 'package:balance/common/core/database/database.dart';

abstract class TransactionRepository {
  Future<dynamic> insert({required int amount, required String groupId});
  Stream<List<Transaction>> watch();
  Future<dynamic> updateAmount({
    required int amount,
    required String transactionId,
  });
  Stream<Transaction?> watchTransaction({required String transactionId});
}
