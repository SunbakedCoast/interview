import 'package:equatable/equatable.dart';

class ExpensesTextFieldModel extends Equatable {
  const ExpensesTextFieldModel({
    required this.expense,
    required this.hasValue,
  });

  const ExpensesTextFieldModel.initial()
      : expense = '',
        hasValue = false;

  final String expense;
  final bool hasValue;

  ExpensesTextFieldModel copyWith({
    String? expense,
    bool? hasValue,
  }) {
    return ExpensesTextFieldModel(
      expense: expense ?? this.expense,
      hasValue: hasValue ?? this.hasValue,
    );
  }

  @override
  List<Object?> get props => [expense, hasValue];
}
