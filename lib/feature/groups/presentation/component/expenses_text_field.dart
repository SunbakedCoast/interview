import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/common/components/components.dart';
import 'package:balance/feature/groups/presentation/view_model/view_model.dart';

class ExpensesTextField extends HookConsumerWidget {
  const ExpensesTextField({
    required this.groupId,
    required this.balance,
    super.key,
  });

  final String groupId;
  final int balance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textFieldState = ref.watch(expensesTextFieldProvider);
    final textFieldNotifier = ref.read(expensesTextFieldProvider.notifier);

    final notifier = ref.read(groupProvider.notifier);

    final controller = useTextEditingController();

    useEffect(
      () {
        if (controller.text != textFieldState.expense) {
          controller.text = textFieldState.expense;
        }
        return;
      },
      [textFieldState],
    );

    return Column(
      children: [
        CustomTextField(
          hintText: 'Enter expenses',
          controller: controller,
          inputType: TextInputType.number,
          onChanged: textFieldNotifier.onChanged,
          formatter: [
            FilteringTextInputFormatter.allow(
              RegExp('[0-9]'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: textFieldState.hasValue
              ? () {
                  final expense = int.parse(textFieldState.expense);
                  textFieldNotifier.reset();
                  notifier.adjustBalance(
                    balance: balance - expense,
                    groupId: groupId,
                  );
                }
              : () {},
          child: textFieldState.hasValue
              ? const Text('Add Expenses')
              : const Text(
                  'No expenses detected',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
        ),
      ],
    );
  }
}
