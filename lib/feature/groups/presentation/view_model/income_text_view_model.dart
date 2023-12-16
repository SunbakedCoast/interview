import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/feature/groups/domain/model/model.dart';

final incomeTextFieldProvider =
    StateNotifierProvider<IncomeTextFieldViewModel, IncomeTextFieldModel>(
        (ref) {
  return IncomeTextFieldViewModel();
});

class IncomeTextFieldViewModel extends StateNotifier<IncomeTextFieldModel> {
  IncomeTextFieldViewModel({
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
