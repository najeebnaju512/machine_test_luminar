
class LeadCoursesModel {
    String? status;
    List<Course>? courses;
    Pagination? pagination;

    LeadCoursesModel({
        this.status,
        this.courses,
        this.pagination,
    });

    factory LeadCoursesModel.fromJson(Map<String, dynamic> json) => LeadCoursesModel(
        status: json["status"],
        courses: json["courses"] == null ? [] : List<Course>.from(json["courses"]!.map((x) => Course.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "courses": courses == null ? [] : List<dynamic>.from(courses!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
    };
}

class Course {
    int? id;
    DateTime? createdAt;
    String? courseName;
    List<int>? courseMode;
    List<CourseModeDetail>? courseModeDetails;
    String? courseFee;
    String? emiFee;
    String? admissionFee;
    bool? isActive;
    List<int>? locations;
    List<LocationDetail>? locationDetails;

    Course({
        this.id,
        this.createdAt,
        this.courseName,
        this.courseMode,
        this.courseModeDetails,
        this.courseFee,
        this.emiFee,
        this.admissionFee,
        this.isActive,
        this.locations,
        this.locationDetails,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        courseName: json["course_name"],
        courseMode: json["course_mode"] == null ? [] : List<int>.from(json["course_mode"]!.map((x) => x)),
        courseModeDetails: json["course_mode_details"] == null ? [] : List<CourseModeDetail>.from(json["course_mode_details"]!.map((x) => CourseModeDetail.fromJson(x))),
        courseFee: json["course_fee"],
        emiFee: json["emi_fee"],
        admissionFee: json["admission_fee"],
        isActive: json["is_active"],
        locations: json["locations"] == null ? [] : List<int>.from(json["locations"]!.map((x) => x)),
        locationDetails: json["location_details"] == null ? [] : List<LocationDetail>.from(json["location_details"]!.map((x) => LocationDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "course_name": courseName,
        "course_mode": courseMode == null ? [] : List<dynamic>.from(courseMode!.map((x) => x)),
        "course_mode_details": courseModeDetails == null ? [] : List<dynamic>.from(courseModeDetails!.map((x) => x.toJson())),
        "course_fee": courseFee,
        "emi_fee": emiFee,
        "admission_fee": admissionFee,
        "is_active": isActive,
        "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x)),
        "location_details": locationDetails == null ? [] : List<dynamic>.from(locationDetails!.map((x) => x.toJson())),
    };
}

class CourseModeDetail {
    int? id;
    CourseModeDetailName? name;
    CourseModeDetailValue? value;
    bool? deletable;
    bool? editable;
    bool? active;

    CourseModeDetail({
        this.id,
        this.name,
        this.value,
        this.deletable,
        this.editable,
        this.active,
    });

    factory CourseModeDetail.fromJson(Map<String, dynamic> json) => CourseModeDetail(
        id: json["id"],
        name: courseModeDetailNameValues.map[json["name"]]!,
        value: courseModeDetailValueValues.map[json["value"]]!,
        deletable: json["deletable"],
        editable: json["editable"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": courseModeDetailNameValues.reverse[name],
        "value": courseModeDetailValueValues.reverse[value],
        "deletable": deletable,
        "editable": editable,
        "active": active,
    };
}

enum CourseModeDetailName {
    HYBRID,
    OFFLINE,
    ONLINE
}

final courseModeDetailNameValues = EnumValues({
    "Hybrid": CourseModeDetailName.HYBRID,
    "Offline": CourseModeDetailName.OFFLINE,
    "Online": CourseModeDetailName.ONLINE
});

enum CourseModeDetailValue {
    HYBRID,
    OFFLINE,
    ONLINE
}

final courseModeDetailValueValues = EnumValues({
    "hybrid": CourseModeDetailValue.HYBRID,
    "offline": CourseModeDetailValue.OFFLINE,
    "online": CourseModeDetailValue.ONLINE
});

class LocationDetail {
    int? id;
    LocationDetailName? name;
    LocationDetailValue? value;
    bool? isActive;
    DateTime? createdAt;

    LocationDetail({
        this.id,
        this.name,
        this.value,
        this.isActive,
        this.createdAt,
    });

    factory LocationDetail.fromJson(Map<String, dynamic> json) => LocationDetail(
        id: json["id"],
        name: locationDetailNameValues.map[json["name"]]!,
        value: locationDetailValueValues.map[json["value"]]!,
        isActive: json["is_active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": locationDetailNameValues.reverse[name],
        "value": locationDetailValueValues.reverse[value],
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
    };
}

enum LocationDetailName {
    CALICUT,
    COCHIN,
    TRIVANDRUM
}

final locationDetailNameValues = EnumValues({
    "Calicut": LocationDetailName.CALICUT,
    "Cochin": LocationDetailName.COCHIN,
    "Trivandrum": LocationDetailName.TRIVANDRUM
});

enum LocationDetailValue {
    CALICUT,
    COCHIN,
    TRIVANDRUM
}

final locationDetailValueValues = EnumValues({
    "calicut": LocationDetailValue.CALICUT,
    "cochin": LocationDetailValue.COCHIN,
    "trivandrum": LocationDetailValue.TRIVANDRUM
});

class Pagination {
    int? totalCount;
    int? currentPage;
    int? totalPages;
    int? pageSize;

    Pagination({
        this.totalCount,
        this.currentPage,
        this.totalPages,
        this.pageSize,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalCount: json["total_count"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
    );

    Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "current_page": currentPage,
        "total_pages": totalPages,
        "page_size": pageSize,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
