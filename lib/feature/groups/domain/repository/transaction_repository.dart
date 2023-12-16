import 'package:balance/common/core/database/database.dart';

abstract class TransactionRepository {
  Future<dynamic> insert({required int amount, required String groupId});
  Stream<List<Transaction>> watch();
  Stream<Transaction?> watchTransaction({required String transactionId});
}
