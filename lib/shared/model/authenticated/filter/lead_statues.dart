
class LeadStatusModel {
    String? status;
    List<Status>? statuses;

    LeadStatusModel({
        this.status,
        this.statuses,
    });

    factory LeadStatusModel.fromJson(Map<String, dynamic> json) => LeadStatusModel(
        status: json["status"],
        statuses: json["statuses"] == null ? [] : List<Status>.from(json["statuses"]!.map((x) => Status.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "statuses": statuses == null ? [] : List<dynamic>.from(statuses!.map((x) => x.toJson())),
    };
}

class Status {
    int? id;
    String? name;
    String? value;
    String? color;
    bool? isActive;
    bool? provideLink;

    Status({
        this.id,
        this.name,
        this.value,
        this.color,
        this.isActive,
        this.provideLink,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        color: json["color"],
        isActive: json["is_active"],
        provideLink: json["provide_link"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "color": color,
        "is_active": isActive,
        "provide_link": provideLink,
    };
}
