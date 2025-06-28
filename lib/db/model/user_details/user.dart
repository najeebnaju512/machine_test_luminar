import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserDetailsHive extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String email;
  @HiveField(3)
  late String phoneNo;
  @HiveField(4)
  late String accestoken;
  @HiveField(5)
  late String refreshtoken;
  @HiveField(6)
  late String whatsAppNo;

  UserDetailsHive({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.accestoken,
    required this.refreshtoken,
    required this.whatsAppNo,
  });
}
