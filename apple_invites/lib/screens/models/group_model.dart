import 'package:apple_invites/screens/models/group_member_model.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class GroupModel {
  final String id;
  final String name;
  final String? imageUrl;
  final String? subTitle;
  final bool isNetwork;
  final List<GroupMemberModel> groupMembers;

  GroupModel({
    String? id,
    required this.name,
    this.imageUrl,
    this.subTitle,
    required this.isNetwork,
    required this.groupMembers,
  }) : id = id ?? uuid.v4();

  GroupModel copyWith({
    String? id,
    String? name,
    String? subTitle,
    String? imageUrl,
    bool? isNetwork,
    List<GroupMemberModel>? groupMembers,
  }) {
    return GroupModel(
      id: id ?? this.id,
      name: name ?? this.name,
      subTitle: subTitle ?? this.subTitle,
      imageUrl: imageUrl ?? this.imageUrl,
      isNetwork: isNetwork ?? this.isNetwork,
      groupMembers: groupMembers ?? this.groupMembers,
    );
  }
}
