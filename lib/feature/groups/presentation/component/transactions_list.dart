import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:balance/feature/groups/presentation/view_model/view_model.dart';

class TransactionsList extends HookConsumerWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(transactionsProvider);

    return StreamBuilder(
      stream: state,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.connectionState == ConnectionState.none ||
            !snapshot.hasData) {
          return const Center(child: Text('No data exists'));
        }

        return Expanded(
          child: ListView.builder(
            itemCount: snapshot.requireData.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(snapshot.requireData[index].amount.toString()),
            ),
          ),
        );
      },
    );
  }
}
