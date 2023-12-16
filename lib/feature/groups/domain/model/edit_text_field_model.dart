import 'package:equatable/equatable.dart';

class EditTextFieldModel extends Equatable {
  const EditTextFieldModel({
    required this.value,
    required this.hasValue,
  });

  const EditTextFieldModel.initial()
      : value = '',
        hasValue = false;

  final String value;
  final bool hasValue;

  EditTextFieldModel copyWith({
    String? value,
    bool? hasValue,
  }) {
    return EditTextFieldModel(
      value: value ?? this.value,
      hasValue: hasValue ?? this.hasValue,
    );
  }

  @override
  List<Object?> get props => [value, hasValue];
}
