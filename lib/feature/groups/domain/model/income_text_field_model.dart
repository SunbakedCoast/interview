import 'package:equatable/equatable.dart';

class IncomeTextFieldModel extends Equatable {
  const IncomeTextFieldModel({required this.income});

  const IncomeTextFieldModel.initial() : income = '';
  final String income;

  IncomeTextFieldModel copyWith({
    String? income,
  }) {
    return IncomeTextFieldModel(
      income: income ?? this.income,
    );
  }

  @override
  List<Object?> get props => [
        income,
      ];
}
