import 'package:flutter/material.dart';

import 'package:balance/feature/groups/presentation/component/component.dart';

void showEditModal({
  required BuildContext context,
  required String transactionId,
}) {
  showModalBottomSheet<void>(
    context: context,
    enableDrag: false,
    isScrollControlled: true,
    isDismissible: false,
    clipBehavior: Clip.antiAlias,
    backgroundColor: Colors.white,
    barrierColor: const Color(0xB3000000),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (context) => _EditModal(transactionId: transactionId),
  );
}

class _EditModal extends StatelessWidget {
  const _EditModal({required this.transactionId});
  final String transactionId;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(
        minHeight: size.height * 0.25,
        maxHeight: size.height * 0.35,
      ),
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          children: [
            const Text(
              'Edit',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            _EditField(transactionId: transactionId),
          ],
        ),
      ),
    );
  }
}

class _EditField extends StatelessWidget {
  const _EditField({required this.transactionId});

  final String transactionId;
  @override
  Widget build(BuildContext context) =>
      EditTextField(transactionId: transactionId);
}
