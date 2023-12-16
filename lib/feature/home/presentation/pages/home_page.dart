import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/feature/home/presentation/components/components.dart';
import 'package:balance/feature/home/presentation/view_model/view_model.dart';

class NewHomePage extends HookConsumerWidget {
  const NewHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(groupsProvider.notifier);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          notifier.getAll();
        });
        return;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 34),
        child: Column(
          children: [
            _TextField(),
            const SizedBox(height: 50),
            _List(),
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const HomeTextField();
}

class _List extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const GroupList();
}
