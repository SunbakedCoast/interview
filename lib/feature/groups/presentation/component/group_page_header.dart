import 'package:flutter/material.dart';

class GroupPageHeader extends StatelessWidget {
  const GroupPageHeader({required this.name, required this.balance, super.key});

  final String name;
  final int balance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name),
        Text(
          balance.toString(),
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
