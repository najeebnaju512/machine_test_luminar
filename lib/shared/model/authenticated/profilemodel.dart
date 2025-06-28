

class ProfileModel {
    String? status;
    User? user;

    ProfileModel({
        this.status,
        this.user,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? uid;
    String? fullName;
    String? email;
    String? phone;
    String? whatsappNumber;
    bool? isActive;
    bool? phoneVerified;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? role;
    RoleDetails? roleDetails;
    bool? isStaff;
    bool? isSuperuser;
    List<dynamic>? groupsDetails;
    DateTime? lastLogin;
    dynamic fcmToken;
    dynamic profilePic;

    User({
        this.id,
        this.uid,
        this.fullName,
        this.email,
        this.phone,
        this.whatsappNumber,
        this.isActive,
        this.phoneVerified,
        this.createdAt,
        this.updatedAt,
        this.role,
        this.roleDetails,
        this.isStaff,
        this.isSuperuser,
        this.groupsDetails,
        this.lastLogin,
        this.fcmToken,
        this.profilePic,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        uid: json["uid"],
        fullName: json["full_name"],
        email: json["email"],
        phone: json["phone"],
        whatsappNumber: json["whatsapp_number"],
        isActive: json["is_active"],
        phoneVerified: json["phone_verified"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        role: json["role"],
        roleDetails: json["role_details"] == null ? null : RoleDetails.fromJson(json["role_details"]),
        isStaff: json["is_staff"],
        isSuperuser: json["is_superuser"],
        groupsDetails: json["groups_details"] == null ? [] : List<dynamic>.from(json["groups_details"]!.map((x) => x)),
        lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
        fcmToken: json["fcm_token"],
        profilePic: json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "whatsapp_number": whatsappNumber,
        "is_active": isActive,
        "phone_verified": phoneVerified,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "role": role,
        "role_details": roleDetails?.toJson(),
        "is_staff": isStaff,
        "is_superuser": isSuperuser,
        "groups_details": groupsDetails == null ? [] : List<dynamic>.from(groupsDetails!.map((x) => x)),
        "last_login": lastLogin?.toIso8601String(),
        "fcm_token": fcmToken,
        "profile_pic": profilePic,
    };
}

class RoleDetails {
    int? id;
    String? label;
    String? value;

    RoleDetails({
        this.id,
        this.label,
        this.value,
    });

    factory RoleDetails.fromJson(Map<String, dynamic> json) => RoleDetails(
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
