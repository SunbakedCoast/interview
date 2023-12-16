import 'package:equatable/equatable.dart';

class ExpensesTextFieldModel extends Equatable {
  const ExpensesTextFieldModel({required this.expense});

  const ExpensesTextFieldModel.initial() : expense = '';

  final String expense;

  ExpensesTextFieldModel copyWith({
    String? expense,
  }) {
    return ExpensesTextFieldModel(expense: expense ?? this.expense);
  }

  @override
  List<Object?> get props => [expense];
}
