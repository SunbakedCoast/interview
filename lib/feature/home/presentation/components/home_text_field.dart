import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/common/components/components.dart';
import 'package:balance/feature/home/presentation/view_model/view_model.dart';

class HomeTextField extends HookConsumerWidget {
  const HomeTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(groupTextFieldProvider);
    final notifier = ref.read(groupTextFieldProvider.notifier);

    
    final controller = useTextEditingController();

    useEffect(
      () {
        if (controller.text != state.groupName) {
          controller.text = state.groupName;
        }
        return;
      },
      [state],
    );

    return Column(
      children: [
        CustomTextField(
          hintText: 'Group Name',
          controller: controller,
          onChanged: notifier.onChanged,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: notifier.onSubmit,
          child: const Text('Create'),
        ),
      ],
    );
  }
}
