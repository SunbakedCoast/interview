import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/feature/groups/presentation/component/component.dart';
import 'package:balance/feature/groups/presentation/view_model/view_model.dart';

class NewGroupPage extends HookConsumerWidget {
  const NewGroupPage(this.groupId, {super.key});

  final String groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(groupProvider);
    final notifier = ref.read(groupProvider.notifier);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          notifier.getGroup(groupId: groupId);
        });
        return;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Group Details')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 34),
        child: StreamBuilder(
          stream: state,
          builder: (context, snapshot) {
            final groupName = snapshot.data?.name ?? '';
            final balance = snapshot.data?.balance ?? 0;
            return Column(
              children: [
                _Header(
                  name: groupName,
                  balance: balance,
                ),
                const SizedBox(height: 30),
                _IncomeField(
                  groupId: groupId,
                  balance: balance,
                ),
                const SizedBox(height: 20),
                _ExpensesField(
                  groupId: groupId,
                  balance: balance,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.name, required this.balance});

  final String name;
  final int balance;

  @override
  Widget build(BuildContext context) => GroupPageHeader(
        name: name,
        balance: balance,
      );
}

class _IncomeField extends StatelessWidget {
  const _IncomeField({required this.groupId, required this.balance});

  final String groupId;
  final int balance;
  @override
  Widget build(BuildContext context) => IncomeTextField(
        groupId: groupId,
        balance: balance,
      );
}

class _ExpensesField extends StatelessWidget {
  const _ExpensesField({required this.groupId, required this.balance});

  final String groupId;
  final int balance;
  @override
  Widget build(BuildContext context) => ExpensesTextField(
        groupId: groupId,
        balance: balance,
      );
}
