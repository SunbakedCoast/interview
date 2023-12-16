import 'package:equatable/equatable.dart';

class GroupTextFieldModel extends Equatable {
  const GroupTextFieldModel({
    required this.groupName,
    required this.hasValue,
  });

  const GroupTextFieldModel.initial()
      : groupName = '',
        hasValue = false;

  final String groupName;
  final bool hasValue;

  GroupTextFieldModel copyWith({
    String? groupName,
    bool? hasValue,
  }) {
    return GroupTextFieldModel(
      groupName: groupName ?? this.groupName,
      hasValue: hasValue ?? this.hasValue,
    );
  }

  @override
  List<Object?> get props => [groupName, hasValue];
}
