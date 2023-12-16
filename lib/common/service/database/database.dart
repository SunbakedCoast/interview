import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/common/core/database/database.dart';

final databaseProvider = Provider((ref) {
  return Database();
});
