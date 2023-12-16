import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/common/components/components.dart';
import 'package:balance/feature/groups/presentation/view_model/view_model.dart';

class EditTextField extends HookConsumerWidget {
  const EditTextField({
    required this.transactionId,
    super.key,
  });

  final String transactionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textFieldState = ref.watch(editTextProvider);
    final textFieldNotifier = ref.read(editTextProvider.notifier);

    final notifier = ref.read(transactionProvider.notifier);

    final controller = useTextEditingController();

    useEffect(
      () {
        if (controller.text != textFieldState.value) {
          controller.text = textFieldState.value;
        }
        return;
      },
      [textFieldState],
    );

    return Column(
      children: [
        CustomTextField(
          hintText: 'Value',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                textFieldNotifier.reset();
                GoRouter.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 30),
            ElevatedButton(
              onPressed: textFieldState.hasValue
                  ? () {
                      final amount = int.parse(textFieldState.value);
                      textFieldNotifier.reset();
                      notifier.updateAmount(
                        amount: amount,
                        transactionId: transactionId,
                      );
                      GoRouter.of(context).pop();
                    }
                  : () {},
              child: textFieldState.hasValue
                  ? const Text('Proceed')
                  : const Text(
                      'No value detected.',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
