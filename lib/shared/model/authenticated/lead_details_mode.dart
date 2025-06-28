// To parse this JSON data, do
//
//     final leadDetailsModel = leadDetailsModelFromJson(jsonString);

import 'dart:convert';

LeadDetailsModel leadDetailsModelFromJson(String str) => LeadDetailsModel.fromJson(json.decode(str));

String leadDetailsModelToJson(LeadDetailsModel data) => json.encode(data.toJson());

class LeadDetailsModel {
    String? status;
    Lead? lead;

    LeadDetailsModel({
        this.status,
        this.lead,
    });

    factory LeadDetailsModel.fromJson(Map<String, dynamic> json) => LeadDetailsModel(
        status: json["status"],
        lead: json["lead"] == null ? null : Lead.fromJson(json["lead"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "lead": lead?.toJson(),
    };
}

class Lead {
    String? id;
    LeadStatusDetails? leadStatusDetails;
    LeadSourceDetails? leadSourceDetails;
    UsedFacebookFormDetails? usedFacebookFormDetails;
    CounselorDetails? counselorDetails;
    dynamic websiteFormDetails;
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
    dynamic passOutYear;
    String? college;
    String? address;
    dynamic howDidYouHearAboutLuminar;
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
    dynamic websiteForm;
    dynamic qualification;
    dynamic preferredLocation;
    dynamic course;
    dynamic courseMode;

    Lead({
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

    factory Lead.fromJson(Map<String, dynamic> json) => Lead(
        id: json["id"],
        leadStatusDetails: json["lead_status_details"] == null ? null : LeadStatusDetails.fromJson(json["lead_status_details"]),
        leadSourceDetails: json["lead_source_details"] == null ? null : LeadSourceDetails.fromJson(json["lead_source_details"]),
        usedFacebookFormDetails: json["used_facebook_form_details"] == null ? null : UsedFacebookFormDetails.fromJson(json["used_facebook_form_details"]),
        counselorDetails: json["counselor_details"] == null ? null : CounselorDetails.fromJson(json["counselor_details"]),
        websiteFormDetails: json["website_form_details"],
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
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
        "website_form_details": websiteFormDetails,
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

class CounselorDetails {
    int? id;
    String? uid;
    String? fullName;
    String? email;
    String? phone;
    dynamic whatsappNumber;
    bool? isActive;
    DateTime? createdAt;
    RoleDetails? roleDetails;
    String? profilePic;
    bool? isStaff;
    bool? isSuperuser;

    CounselorDetails({
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

    factory CounselorDetails.fromJson(Map<String, dynamic> json) => CounselorDetails(
        id: json["id"],
        uid: json["uid"],
        fullName: json["full_name"],
        email: json["email"],
        phone: json["phone"],
        whatsappNumber: json["whatsapp_number"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        roleDetails: json["role_details"] == null ? null : RoleDetails.fromJson(json["role_details"]),
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

    factory LeadSourceDetails.fromJson(Map<String, dynamic> json) => LeadSourceDetails(
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

    factory LeadStatusDetails.fromJson(Map<String, dynamic> json) => LeadStatusDetails(
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
    List<Counselor>? counselors;
    Counselor? lastAssignedCounselor;

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

    factory UsedFacebookFormDetails.fromJson(Map<String, dynamic> json) => UsedFacebookFormDetails(
        id: json["id"],
        name: json["name"],
        pageId: json["page_id"],
        formId: json["form_id"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        isEditable: json["is_editable"],
        isDeletable: json["is_deletable"],
        isDeleted: json["is_deleted"],
        isActive: json["is_active"],
        formFields: json["form_fields"] == null ? [] : List<FormField>.from(json["form_fields"]!.map((x) => FormField.fromJson(x))),
        counselors: json["counselors"] == null ? [] : List<Counselor>.from(json["counselors"]!.map((x) => Counselor.fromJson(x))),
        lastAssignedCounselor: json["last_assigned_counselor"] == null ? null : Counselor.fromJson(json["last_assigned_counselor"]),
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
        "form_fields": formFields == null ? [] : List<dynamic>.from(formFields!.map((x) => x.toJson())),
        "counselors": counselors == null ? [] : List<dynamic>.from(counselors!.map((x) => x.toJson())),
        "last_assigned_counselor": lastAssignedCounselor?.toJson(),
    };
}

class Counselor {
    int? id;
    String? fullName;
    String? email;
    String? uid;

    Counselor({
        this.id,
        this.fullName,
        this.email,
        this.uid,
    });

    factory Counselor.fromJson(Map<String, dynamic> json) => Counselor(
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
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
