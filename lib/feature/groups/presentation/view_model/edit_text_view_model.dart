import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/feature/groups/domain/model/model.dart';

final editTextProvider =
    StateNotifierProvider<EditTextFieldStateNotifier, EditTextFieldModel>(
        (ref) {
  return EditTextFieldStateNotifier();
});

class EditTextFieldStateNotifier extends StateNotifier<EditTextFieldModel> {
  EditTextFieldStateNotifier({
    EditTextFieldModel? state,
  }) : super(state ?? const EditTextFieldModel.initial());

  void reset() => state = const EditTextFieldModel.initial();

  void onChanged(String text) {
    if (text.isEmpty || text == '') {
      state = state.copyWith(value: text, hasValue: false);
    } else {
      state = state.copyWith(value: text, hasValue: true);
    }
  }
}
