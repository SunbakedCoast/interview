import 'package:balance/common/components/components.dart';
import 'package:balance/feature/groups/presentation/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IncomeTextField extends HookConsumerWidget {
  const IncomeTextField({
    required this.groupId,
    required this.balance,
    super.key,
  });

  final String groupId;
  final int balance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textFieldState = ref.watch(incomeTextFieldProvider);
    final textFieldNotifier = ref.read(incomeTextFieldProvider.notifier);

    final notifier = ref.read(groupProvider.notifier);

    final controller = useTextEditingController();

    useEffect(
      () {
        if (controller.text != textFieldState.income) {
          controller.text = textFieldState.income;
        }
        return;
      },
      [textFieldState],
    );

    return Column(
      children: [
        CustomTextField(
          hintText: 'Income',
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
          onPressed: () {
            final income = int.parse(textFieldState.income);
            textFieldNotifier.reset();
            notifier.adjustBalance(
              balance: income + balance,
              groupId: groupId,
            );
          },
          child: const Text('Add Income'),
        ),
      ],
    );
  }
}
