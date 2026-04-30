import 'package:hive/hive.dart';

part 'user_profile.g.dart';

@HiveType(typeId: 2)
class UserProfile extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final DateTime joinedDate;

  @HiveField(2)
  final String willpowerTypeName;

  @HiveField(3)
  final String? avatar;

  UserProfile({
    required this.name,
    required this.joinedDate,
    required this.willpowerTypeName,
    this.avatar,
  });

  factory UserProfile.empty() {
    return UserProfile(
      name: '',
      joinedDate: DateTime.now(),
      willpowerTypeName: 'Drifter',
    );
  }

  UserProfile copyWith({
    String? name,
    DateTime? joinedDate,
    String? willpowerTypeName,
    String? avatar,
  }) {
    return UserProfile(
      name: name ?? this.name,
      joinedDate: joinedDate ?? this.joinedDate,
      willpowerTypeName: willpowerTypeName ?? this.willpowerTypeName,
      avatar: avatar ?? this.avatar,
    );
  }
}
