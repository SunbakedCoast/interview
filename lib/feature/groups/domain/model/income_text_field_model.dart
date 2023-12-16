import 'package:equatable/equatable.dart';

class IncomeTextFieldModel extends Equatable {
  const IncomeTextFieldModel({required this.income, required this.hasValue});

  const IncomeTextFieldModel.initial()
      : income = '',
        hasValue = false;

  final String income;
  final bool hasValue;

  IncomeTextFieldModel copyWith({
    String? income,
    bool? hasValue,
  }) {
    return IncomeTextFieldModel(
      income: income ?? this.income,
      hasValue: hasValue ?? this.hasValue,
    );
  }

  @override
  List<Object?> get props => [
        income,
        hasValue,
      ];
}
