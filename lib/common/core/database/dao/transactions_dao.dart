import 'package:balance/common/core/database/database.dart';
import 'package:balance/common/core/database/tables/transactions.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

part 'transactions_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [Transactions])
class TransactionsDao extends DatabaseAccessor<Database>
    with _$TransactionsDaoMixin {
  TransactionsDao(super.db);

  Future<dynamic> insert(int amount, String groupId) {
    return into(transactions).insert(
      TransactionsCompanion.insert(
        id: const Uuid().v1(),
        createdAt: DateTime.now(),
        amount: Value(amount),
        groupId: groupId,
      ),
    );
  }

  Stream<List<Transaction>> watchh() => select(transactions).watch();

  Stream<Transaction?> watchTransaction(String transactionId) {
    return (select(transactions)..where((tbl) => tbl.id.equals(transactionId)))
        .watchSingleOrNull();
  }
}
