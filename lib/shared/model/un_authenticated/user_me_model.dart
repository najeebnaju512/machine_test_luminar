

class UserMeModel {
  String? refresh;
  String? access;
  User? user;
  Map<String, Permission>? permissions;

  UserMeModel({
    this.refresh,
    this.access,
    this.user,
    this.permissions,
  });

  factory UserMeModel.fromJson(Map<String, dynamic> json) => UserMeModel(
    refresh: json["refresh"],
    access: json["access"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    permissions: json["permissions"] == null
        ? {}
        : Map.from(json["permissions"]).map(
            (k, v) => MapEntry(k, Permission.fromJson(v)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
    "user": user?.toJson(),
    "permissions": permissions == null
        ? {}
        : Map.from(permissions!).map((k, v) => MapEntry(k, v.toJson())),
  };
}

class Permission {
  Module? module;
  List<Action>? actions;
  String? accessLevel;

  Permission({
    this.module,
    this.actions,
    this.accessLevel,
  });

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
    module: json["module"] == null ? null : Module.fromJson(json["module"]),
    actions: json["actions"] == null
        ? []
        : List<Action>.from(json["actions"].map((x) => Action.fromJson(x))),
    accessLevel: json["access_level"],
  );

  Map<String, dynamic> toJson() => {
    "module": module?.toJson(),
    "actions": actions == null
        ? []
        : List<dynamic>.from(actions!.map((x) => x.toJson())),
    "access_level": accessLevel,
  };
}

class Action {
  String? id;
  String? label;
  String? value;

  Action({
    this.id,
    this.label,
    this.value,
  });

  factory Action.fromJson(Map<String, dynamic> json) => Action(
    id: json["id"],
    label: json["label"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
    "value": value,
  };
}

class Module {
  String? id;
  String? name;
  String? title;

  Module({
    this.id,
    this.name,
    this.title,
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
    id: json["id"],
    name: json["name"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "title": title,
  };
}

class User {
  String? uid;
  String? fullName;
  String? email;
  String? phone;
  String? whatsappNumber;
  String? role;
  String? roleId;
  bool? isSuperuser;

  User({
    this.uid,
    this.fullName,
    this.email,
    this.phone,
    this.whatsappNumber,
    this.role,
    this.roleId,
    this.isSuperuser,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    uid: json["uid"],
    fullName: json["full_name"],
    email: json["email"],
    phone: json["phone"],
    whatsappNumber: json["whatsapp_number"],
    role: json["role"],
    roleId: json["role_id"],
    isSuperuser: json["is_superuser"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "full_name": fullName,
    "email": email,
    "phone": phone,
    "whatsapp_number": whatsappNumber,
    "role": role,
    "role_id": roleId,
    "is_superuser": isSuperuser,
  };
}
