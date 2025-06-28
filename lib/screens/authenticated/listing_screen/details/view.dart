import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_luminar/core/tag_helper/teg_generator.dart';
import 'package:machine_test_luminar/screens/authenticated/listing_screen/details/controller.dart';

class LeadDetailPage extends StatefulWidget {
  final String? id;
  const LeadDetailPage({super.key, required this.id});

  @override
  State<LeadDetailPage> createState() => _LeadDetailPageState();
}

class _LeadDetailPageState extends State<LeadDetailPage> {
  late LeadDetailsController controller;
  final String tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(LeadDetailsController(id: widget.id), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LeadDetailsController>(tag: tag);
    super.dispose();
  }



  Widget detailRow({required String label, String? value, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Icon(icon, size: 18, color: Colors.grey.shade700),
          if (icon != null) const SizedBox(width: 8),
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value ?? '-', style: const TextStyle(height: 1.4)),
          ),
        ],
      ),
    );
  }

  Widget sectionCard({required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                )),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lead Details")),
      body: Obx(() {
        if (controller.isloading.value) {
          return const Center(child: CupertinoActivityIndicator());
        }

        final lead = controller.leadData.value;
        if (lead == null) {
          return const Center(child: Text("No lead data found."));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              sectionCard(
                title: "Basic Info",
                children: [
                  detailRow(label: "Name", value: lead.name, icon: Icons.person),
                  detailRow(label: "Phone", value: lead.phoneNumber, icon: Icons.phone),
                  detailRow(label: "Whatsapp", value: lead.whatsappNumber?.toString(), icon: Icons.message),
                  detailRow(label: "Email", value: lead.email, icon: Icons.email),
                  detailRow(label: "City", value: lead.city, icon: Icons.location_city),
                  detailRow(label: "Address", value: lead.address, icon: Icons.home),
                ],
              ),
              sectionCard(
                title: "Parent & Contact",
                children: [
                  detailRow(label: "Parent Name", value: lead.parentName, icon: Icons.people),
                  detailRow(label: "Parent Phone", value: lead.parentPhoneNumber?.toString(), icon: Icons.call),
                ],
              ),
              sectionCard(
                title: "Education",
                children: [
                  detailRow(label: "College", value: lead.college),
                  detailRow(label: "Qualification", value: lead.qualificationDetails?.toString()),
                  detailRow(label: "Pass Out Year", value: lead.passOutYear?.toString()),
                  detailRow(label: "Preferred Location", value: lead.preferredLocationDetails?.toString()),
                  detailRow(label: "Course", value: lead.courseDetails?.toString()),
                  detailRow(label: "Course Mode", value: lead.courseModeDetails?.toString()),
                ],
              ),
              sectionCard(
                title: "Status",
                children: [
                  detailRow(label: "Lead Status", value: lead.leadStatusDetails?.name),
                  detailRow(label: "Lead Source", value: lead.leadSourceDetails?.label),
                  detailRow(label: "Facebook Campaign", value: lead.facebookCampaign),
                  detailRow(label: "Facebook Form", value: lead.usedFacebookFormDetails?.name),
                  detailRow(label: "Is Active", value: lead.isActive == true ? "Yes" : "No"),
                  detailRow(label: "Is Archived", value: lead.isArchived == true ? "Yes" : "No"),
                  detailRow(label: "Is Resubmission", value: lead.isResubmission == true ? "Yes" : "No"),
                ],
              ),
              sectionCard(
                title: "Follow-ups",
                children: [
                  detailRow(label: "Follow-up Count", value: lead.followupCount?.toString()),
                  detailRow(label: "Completed", value: lead.completedFollowups?.toString()),
                  detailRow(label: "Pending", value: lead.pendingFollowups?.toString()),
                  detailRow(label: "Next Follow-up", value: lead.nextFollowup?.toString()),
                  detailRow(label: "Last Follow-up", value: lead.lastFollowup?.toString()),
                  detailRow(label: "Reminder Date", value: lead.reminderDate?.toString()),
                ],
              ),
              sectionCard(
                title: "Meta Info",
                children: [
                  detailRow(label: "Leadgen ID", value: lead.leadgenId),
                  detailRow(label: "Is Editable", value: lead.isEditable == true ? "Yes" : "No"),
                  detailRow(label: "Is Deletable", value: lead.isDeletable == true ? "Yes" : "No"),
                ],
              ),
              sectionCard(
                title: "Counselor",
                children: [
                  detailRow(label: "Name", value: lead.counselorDetails?.fullName),
                  detailRow(label: "Email", value: lead.counselorDetails?.email),
                  detailRow(label: "Phone", value: lead.counselorDetails?.phone),
                  detailRow(label: "Role", value: lead.counselorDetails?.roleDetails?.label),
                  detailRow(label: "Is Staff", value: lead.counselorDetails?.isStaff == true ? "Yes" : "No"),
                  detailRow(label: "Is Superuser", value: lead.counselorDetails?.isSuperuser == true ? "Yes" : "No"),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }
}
