import 'package:equatable/equatable.dart';

class GroupTextFieldModel extends Equatable {
  const GroupTextFieldModel({
    required this.groupName,
  });

  const GroupTextFieldModel.initial() : groupName = '';

  final String groupName;

  GroupTextFieldModel copyWith({
    String? groupName,
  }) {
    return GroupTextFieldModel(groupName: groupName ?? this.groupName);
  }

  @override
  List<Object?> get props => [groupName];
}
