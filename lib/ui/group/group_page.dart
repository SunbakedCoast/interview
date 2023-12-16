import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:balance/common/core/database/dao/groups_dao.dart';
import 'package:balance/main.dart';

class GroupPage extends StatefulWidget {
  const GroupPage(this.groupId, {super.key});
  final String groupId;

  @override
  State<StatefulWidget> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  late final GroupsDao _groupsDao = getIt.get<GroupsDao>();

  final _incomeController = TextEditingController();
  final _expenseController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Group details'),
        ),
        body: StreamBuilder(
          stream: _groupsDao.watchGroup(widget.groupId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text('Loading...');
            }
            return Column(
              children: [
                Text(snapshot.data?.name ?? ''),
                Text(snapshot.data?.balance.toString() ?? ''),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _incomeController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'),
                          ),
                        ],
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          suffixText: '',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        final amount = int.parse(_incomeController.text);
                        final balance = snapshot.data?.balance ?? 0;
                        _groupsDao.adjustBalance(
                          balance + amount,
                          widget.groupId,
                        );
                        _incomeController.text = '';
                      },
                      child: const Text('Add income'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _expenseController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'),
                          ),
                        ],
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          suffixText: '',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        final amount = int.parse(_expenseController.text);
                        final balance = snapshot.data?.balance ?? 0;
                        _groupsDao.adjustBalance(
                          balance - amount,
                          widget.groupId,
                        );
                        _expenseController.text = '';
                      },
                      child: const Text('Add expense'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
}
