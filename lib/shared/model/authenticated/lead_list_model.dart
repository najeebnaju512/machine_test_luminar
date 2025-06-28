class LeadListModel {
  int? count;
  String? next;
  String? previous;
  List<Result>? results;

  LeadListModel({this.count, this.next, this.previous, this.results});

  factory LeadListModel.fromJson(Map<String, dynamic> json) => LeadListModel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: json["results"] == null
        ? []
        : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": results?.map((x) => x.toJson()).toList(),
  };
}

class Result {
  String? id;
  LeadStatusDetails? leadStatusDetails;
  LeadSourceDetails? leadSourceDetails;
  UsedFacebookFormDetails? usedFacebookFormDetails;
  CounselorDetailsElement? counselorDetails;
  WebsiteFormDetails? websiteFormDetails;
  dynamic qualificationDetails;
  dynamic preferredLocationDetails;
  dynamic courseDetails;
  dynamic courseModeDetails;
  int? followupCount;
  int? pendingFollowups;
  int? completedFollowups;
  dynamic lastFollowup;
  dynamic nextFollowup;
  String? name;
  String? phoneNumber;
  dynamic whatsappNumber;
  String? email;
  String? city;
  dynamic reminderDate;
  bool? isArchived;
  String? parentName;
  dynamic parentPhoneNumber;
  String? leadgenId;
  int? passOutYear;
  String? college;
  String? address;
  String? howDidYouHearAboutLuminar;
  String? facebookCampaign;
  DateTime? createdAt;
  bool? isEditable;
  bool? isDeletable;
  bool? isDeleted;
  bool? isActive;
  bool? isResubmission;
  int? leadStatus;
  String? leadSource;
  String? usedFacebookForm;
  int? counselor;
  String? websiteForm;
  dynamic qualification;
  dynamic preferredLocation;
  dynamic course;
  dynamic courseMode;

  Result({
    this.id,
    this.leadStatusDetails,
    this.leadSourceDetails,
    this.usedFacebookFormDetails,
    this.counselorDetails,
    this.websiteFormDetails,
    this.qualificationDetails,
    this.preferredLocationDetails,
    this.courseDetails,
    this.courseModeDetails,
    this.followupCount,
    this.pendingFollowups,
    this.completedFollowups,
    this.lastFollowup,
    this.nextFollowup,
    this.name,
    this.phoneNumber,
    this.whatsappNumber,
    this.email,
    this.city,
    this.reminderDate,
    this.isArchived,
    this.parentName,
    this.parentPhoneNumber,
    this.leadgenId,
    this.passOutYear,
    this.college,
    this.address,
    this.howDidYouHearAboutLuminar,
    this.facebookCampaign,
    this.createdAt,
    this.isEditable,
    this.isDeletable,
    this.isDeleted,
    this.isActive,
    this.isResubmission,
    this.leadStatus,
    this.leadSource,
    this.usedFacebookForm,
    this.counselor,
    this.websiteForm,
    this.qualification,
    this.preferredLocation,
    this.course,
    this.courseMode,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    leadStatusDetails: json["lead_status_details"] == null
        ? null
        : LeadStatusDetails.fromJson(json["lead_status_details"]),
    leadSourceDetails: json["lead_source_details"] == null
        ? null
        : LeadSourceDetails.fromJson(json["lead_source_details"]),
    usedFacebookFormDetails: json["used_facebook_form_details"] == null
        ? null
        : UsedFacebookFormDetails.fromJson(json["used_facebook_form_details"]),
    counselorDetails: json["counselor_details"] == null
        ? null
        : CounselorDetailsElement.fromJson(json["counselor_details"]),
    websiteFormDetails: json["website_form_details"] == null
        ? null
        : WebsiteFormDetails.fromJson(json["website_form_details"]),
    qualificationDetails: json["qualification_details"],
    preferredLocationDetails: json["preferred_location_details"],
    courseDetails: json["course_details"],
    courseModeDetails: json["course_mode_details"],
    followupCount: json["followup_count"],
    pendingFollowups: json["pending_followups"],
    completedFollowups: json["completed_followups"],
    lastFollowup: json["last_followup"],
    nextFollowup: json["next_followup"],
    name: json["name"],
    phoneNumber: json["phone_number"],
    whatsappNumber: json["whatsapp_number"],
    email: json["email"],
    city: json["city"],
    reminderDate: json["reminder_date"],
    isArchived: json["is_archived"],
    parentName: json["parent_name"],
    parentPhoneNumber: json["parent_phone_number"],
    leadgenId: json["leadgen_id"],
    passOutYear: json["pass_out_year"],
    college: json["college"],
    address: json["address"],
    howDidYouHearAboutLuminar: json["how_did_you_hear_about_luminar"],
    facebookCampaign: json["facebook_campaign"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    isEditable: json["is_editable"],
    isDeletable: json["is_deletable"],
    isDeleted: json["is_deleted"],
    isActive: json["is_active"],
    isResubmission: json["is_resubmission"],
    leadStatus: json["lead_status"],
    leadSource: json["lead_source"],
    usedFacebookForm: json["used_facebook_form"],
    counselor: json["counselor"],
    websiteForm: json["website_form"],
    qualification: json["qualification"],
    preferredLocation: json["preferred_location"],
    course: json["course"],
    courseMode: json["course_mode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lead_status_details": leadStatusDetails?.toJson(),
    "lead_source_details": leadSourceDetails?.toJson(),
    "used_facebook_form_details": usedFacebookFormDetails?.toJson(),
    "counselor_details": counselorDetails?.toJson(),
    "website_form_details": websiteFormDetails?.toJson(),
    "qualification_details": qualificationDetails,
    "preferred_location_details": preferredLocationDetails,
    "course_details": courseDetails,
    "course_mode_details": courseModeDetails,
    "followup_count": followupCount,
    "pending_followups": pendingFollowups,
    "completed_followups": completedFollowups,
    "last_followup": lastFollowup,
    "next_followup": nextFollowup,
    "name": name,
    "phone_number": phoneNumber,
    "whatsapp_number": whatsappNumber,
    "email": email,
    "city": city,
    "reminder_date": reminderDate,
    "is_archived": isArchived,
    "parent_name": parentName,
    "parent_phone_number": parentPhoneNumber,
    "leadgen_id": leadgenId,
    "pass_out_year": passOutYear,
    "college": college,
    "address": address,
    "how_did_you_hear_about_luminar": howDidYouHearAboutLuminar,
    "facebook_campaign": facebookCampaign,
    "created_at": createdAt?.toIso8601String(),
    "is_editable": isEditable,
    "is_deletable": isDeletable,
    "is_deleted": isDeleted,
    "is_active": isActive,
    "is_resubmission": isResubmission,
    "lead_status": leadStatus,
    "lead_source": leadSource,
    "used_facebook_form": usedFacebookForm,
    "counselor": counselor,
    "website_form": websiteForm,
    "qualification": qualification,
    "preferred_location": preferredLocation,
    "course": course,
    "course_mode": courseMode,
  };
}

class CounselorDetailsElement {
  int? id;
  String? uid;
  String? fullName;
  String? email;
  String? phone;
  String? whatsappNumber;
  bool? isActive;
  DateTime? createdAt;
  RoleDetails? roleDetails;
  String? profilePic;
  bool? isStaff;
  bool? isSuperuser;

  CounselorDetailsElement({
    this.id,
    this.uid,
    this.fullName,
    this.email,
    this.phone,
    this.whatsappNumber,
    this.isActive,
    this.createdAt,
    this.roleDetails,
    this.profilePic,
    this.isStaff,
    this.isSuperuser,
  });

  factory CounselorDetailsElement.fromJson(Map<String, dynamic> json) =>
      CounselorDetailsElement(
        id: json["id"],
        uid: json["uid"],
        fullName: json["full_name"],
        email: json["email"],
        phone: json["phone"],
        whatsappNumber: json["whatsapp_number"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        roleDetails: json["role_details"] == null
            ? null
            : RoleDetails.fromJson(json["role_details"]),
        profilePic: json["profile_pic"],
        isStaff: json["is_staff"],
        isSuperuser: json["is_superuser"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "full_name": fullName,
    "email": email,
    "phone": phone,
    "whatsapp_number": whatsappNumber,
    "is_active": isActive,
    "created_at": createdAt?.toIso8601String(),
    "role_details": roleDetails?.toJson(),
    "profile_pic": profilePic,
    "is_staff": isStaff,
    "is_superuser": isSuperuser,
  };
}

class RoleDetails {
  int? id;
  String? label;
  String? value;

  RoleDetails({this.id, this.label, this.value});

  factory RoleDetails.fromJson(Map<String, dynamic> json) =>
      RoleDetails(id: json["id"], label: json["label"], value: json["value"]);

  Map<String, dynamic> toJson() => {"id": id, "label": label, "value": value};
}

class LeadSourceDetails {
  String? id;
  DateTime? createdAt;
  bool? isEditable;
  bool? isDeletable;
  bool? isDeleted;
  bool? isActive;
  String? label;
  String? value;

  LeadSourceDetails({
    this.id,
    this.createdAt,
    this.isEditable,
    this.isDeletable,
    this.isDeleted,
    this.isActive,
    this.label,
    this.value,
  });

  factory LeadSourceDetails.fromJson(Map<String, dynamic> json) =>
      LeadSourceDetails(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
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

class LeadStatusDetails {
  int? id;
  String? name;
  String? value;
  String? color;
  bool? isActive;
  bool? provideLink;

  LeadStatusDetails({
    this.id,
    this.name,
    this.value,
    this.color,
    this.isActive,
    this.provideLink,
  });

  factory LeadStatusDetails.fromJson(Map<String, dynamic> json) =>
      LeadStatusDetails(
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

class UsedFacebookFormDetails {
  String? id;
  String? name;
  String? pageId;
  String? formId;
  String? status;
  DateTime? createdAt;
  bool? isEditable;
  bool? isDeletable;
  bool? isDeleted;
  bool? isActive;
  List<FormField>? formFields;
  List<LastAssignedCounselorElement>? counselors;
  LastAssignedCounselorElement? lastAssignedCounselor;

  UsedFacebookFormDetails({
    this.id,
    this.name,
    this.pageId,
    this.formId,
    this.status,
    this.createdAt,
    this.isEditable,
    this.isDeletable,
    this.isDeleted,
    this.isActive,
    this.formFields,
    this.counselors,
    this.lastAssignedCounselor,
  });

  factory UsedFacebookFormDetails.fromJson(Map<String, dynamic> json) =>
      UsedFacebookFormDetails(
        id: json["id"],
        name: json["name"],
        pageId: json["page_id"],
        formId: json["form_id"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        isEditable: json["is_editable"],
        isDeletable: json["is_deletable"],
        isDeleted: json["is_deleted"],
        isActive: json["is_active"],
        formFields: json["form_fields"] == null
            ? []
            : List<FormField>.from(
                json["form_fields"].map((x) => FormField.fromJson(x)),
              ),
        counselors: json["counselors"] == null
            ? []
            : List<LastAssignedCounselorElement>.from(
                json["counselors"].map(
                  (x) => LastAssignedCounselorElement.fromJson(x),
                ),
              ),
        lastAssignedCounselor: json["last_assigned_counselor"] == null
            ? null
            : LastAssignedCounselorElement.fromJson(
                json["last_assigned_counselor"],
              ),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "page_id": pageId,
    "form_id": formId,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "is_editable": isEditable,
    "is_deletable": isDeletable,
    "is_deleted": isDeleted,
    "is_active": isActive,
    "form_fields": formFields?.map((x) => x.toJson()).toList(),
    "counselors": counselors?.map((x) => x.toJson()).toList(),
    "last_assigned_counselor": lastAssignedCounselor?.toJson(),
  };
}

class LastAssignedCounselorElement {
  int? id;
  String? fullName;
  String? email;
  String? uid;

  LastAssignedCounselorElement({this.id, this.fullName, this.email, this.uid});

  factory LastAssignedCounselorElement.fromJson(Map<String, dynamic> json) =>
      LastAssignedCounselorElement(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "email": email,
    "uid": uid,
  };
}

class FormField {
  int? id;
  String? facebookFormId;
  String? facebookFormName;
  String? formFieldLabel;
  String? formFieldKey;
  String? formFieldType;
  String? leadFieldMapping;
  DateTime? createdAt;
  bool? isEditable;
  bool? isDeletable;
  bool? isDeleted;
  bool? isActive;

  FormField({
    this.id,
    this.facebookFormId,
    this.facebookFormName,
    this.formFieldLabel,
    this.formFieldKey,
    this.formFieldType,
    this.leadFieldMapping,
    this.createdAt,
    this.isEditable,
    this.isDeletable,
    this.isDeleted,
    this.isActive,
  });

  factory FormField.fromJson(Map<String, dynamic> json) => FormField(
    id: json["id"],
    facebookFormId: json["facebook_form_id"],
    facebookFormName: json["facebook_form_name"],
    formFieldLabel: json["form_field_label"],
    formFieldKey: json["form_field_key"],
    formFieldType: json["form_field_type"],
    leadFieldMapping: json["lead_field_mapping"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    isEditable: json["is_editable"],
    isDeletable: json["is_deletable"],
    isDeleted: json["is_deleted"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "facebook_form_id": facebookFormId,
    "facebook_form_name": facebookFormName,
    "form_field_label": formFieldLabel,
    "form_field_key": formFieldKey,
    "form_field_type": formFieldType,
    "lead_field_mapping": leadFieldMapping,
    "created_at": createdAt?.toIso8601String(),
    "is_editable": isEditable,
    "is_deletable": isDeletable,
    "is_deleted": isDeleted,
    "is_active": isActive,
  };
}

class WebsiteFormDetails {
  String? id;
  String? name;
  String? formKey;
  String? pageUrl;
  String? description;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  Tracker? tracker;
  List<CounselorDetailsElement>? counselors;

  WebsiteFormDetails({
    this.id,
    this.name,
    this.formKey,
    this.pageUrl,
    this.description,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.tracker,
    this.counselors,
  });

  factory WebsiteFormDetails.fromJson(
    Map<String, dynamic> json,
  ) => WebsiteFormDetails(
    id: json["id"],
    name: json["name"],
    formKey: json["form_key"],
    pageUrl: json["page_url"],
    description: json["description"],
    isActive: json["is_active"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    tracker: json["tracker"] == null ? null : Tracker.fromJson(json["tracker"]),
    counselors: json["counselors"] == null
        ? []
        : List<CounselorDetailsElement>.from(
            json["counselors"].map((x) => CounselorDetailsElement.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "form_key": formKey,
    "page_url": pageUrl,
    "description": description,
    "is_active": isActive,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "tracker": tracker?.toJson(),
    "counselors": counselors?.map((x) => x.toJson()).toList(),
  };
}

class Tracker {
  String? id;
  String? formName;
  dynamic pageUrl;
  DateTime? lastLeadTime;
  int? leadCount;
  DateTime? updatedAt;
  DateTime? createdAt;

  Tracker({
    this.id,
    this.formName,
    this.pageUrl,
    this.lastLeadTime,
    this.leadCount,
    this.updatedAt,
    this.createdAt,
  });

  factory Tracker.fromJson(Map<String, dynamic> json) => Tracker(
    id: json["id"],
    formName: json["form_name"],
    pageUrl: json["page_url"],
    lastLeadTime: json["last_lead_time"] == null
        ? null
        : DateTime.parse(json["last_lead_time"]),
    leadCount: json["lead_count"],
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "form_name": formName,
    "page_url": pageUrl,
    "last_lead_time": lastLeadTime?.toIso8601String(),
    "lead_count": leadCount,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
  };
}
