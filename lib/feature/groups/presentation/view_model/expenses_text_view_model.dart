import 'package:balance/feature/groups/domain/model/model.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final expensesTextFieldProvider = StateNotifierProvider<
    ExpenseTextFieldStateNotifier, ExpensesTextFieldModel>((ref) {
  return ExpenseTextFieldStateNotifier();
});

class ExpenseTextFieldStateNotifier
    extends StateNotifier<ExpensesTextFieldModel> {
  ExpenseTextFieldStateNotifier({
    ExpensesTextFieldModel? state,
  }) : super(state ?? const ExpensesTextFieldModel.initial());

  void reset() => state = const ExpensesTextFieldModel.initial();

  void onChanged(String text) {
    if (text.isEmpty || text == '') {
      state = state.copyWith(expense: text, hasValue: false);
    } else {
      state = state.copyWith(expense: text, hasValue: true);
    }
  }
}
