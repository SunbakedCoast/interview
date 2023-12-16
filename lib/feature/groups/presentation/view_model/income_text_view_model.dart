import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/feature/groups/domain/model/model.dart';

final incomeTextFieldProvider =
    StateNotifierProvider<IncomeTextFieldStateNotifier, IncomeTextFieldModel>(
        (ref) {
  return IncomeTextFieldStateNotifier();
});

class IncomeTextFieldStateNotifier extends StateNotifier<IncomeTextFieldModel> {
  IncomeTextFieldStateNotifier({
    IncomeTextFieldModel? state,
  }) : super(state ?? const IncomeTextFieldModel.initial());

  void reset() => state = const IncomeTextFieldModel.initial();

  void onChanged(String text) {
    if (text.isEmpty || text == '') {
      state = state.copyWith(income: text, hasValue: false);
    } else {
      state = state.copyWith(income: text, hasValue: true);
    }
  }
}
