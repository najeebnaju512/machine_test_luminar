
class LeadSourcesModel {
    String? status;
    List<Source>? sources;

    LeadSourcesModel({
        this.status,
        this.sources,
    });

    factory LeadSourcesModel.fromJson(Map<String, dynamic> json) => LeadSourcesModel(
        status: json["status"],
        sources: json["sources"] == null ? [] : List<Source>.from(json["sources"]!.map((x) => Source.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "sources": sources == null ? [] : List<dynamic>.from(sources!.map((x) => x.toJson())),
    };
}

class Source {
    String? id;
    DateTime? createdAt;
    bool? isEditable;
    bool? isDeletable;
    bool? isDeleted;
    bool? isActive;
    String? label;
    String? value;

    Source({
        this.id,
        this.createdAt,
        this.isEditable,
        this.isDeletable,
        this.isDeleted,
        this.isActive,
        this.label,
        this.value,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        isEditable: json["is_editable"],
        isDeletable: json["is_deletable"],
        isDeleted: json["is_deleted"],
        isActive: json["is_active"],
        label: json["label"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "is_editable": isEditable,
        "is_deletable": isDeletable,
        "is_deleted": isDeleted,
        "is_active": isActive,
        "label": label,
        "value": value,
    };
}
