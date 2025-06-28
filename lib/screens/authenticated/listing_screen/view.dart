import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_luminar/screens/authenticated/listing_screen/controller.dart';
import 'package:machine_test_luminar/core/tag_helper/teg_generator.dart';
import 'package:machine_test_luminar/widget/screens/on_error_page.dart';
import 'package:machine_test_luminar/widget/text_form_feild/widget.dart';

class LeadListScreen extends StatefulWidget {
  const LeadListScreen({super.key});

  @override
  State<LeadListScreen> createState() => _LeadListScreenState();
}

class _LeadListScreenState extends State<LeadListScreen> {
  late LeadListController controller;
  final String tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(LeadListController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LeadListController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller.errorMsg.value != null
        ? ErrorPage(
            message: controller.errorMsg.value ?? '',
            onRetry: controller.onRetry,
          )
        : Scaffold(
      appBar: AppBar(title: const Text("Lead List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    onChanged: (value) {
                      controller.onSearch();
                    },
                    controller: controller.searchController,
                  ),
                ),
                SizedBox(width: 10),
                IconButton.filled(
                  onPressed: () {},
                  icon: Icon(Icons.filter_alt),
                  color: Colors.blueAccent,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateColor.transparent,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Leads",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.leads.isEmpty) {
                return const Center(child: CupertinoActivityIndicator());
              }

              return ListView.builder(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(12),
                itemCount:
                    controller.leads.length +
                    (controller.hasMore.value ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= controller.leads.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: CupertinoActivityIndicator(),
                      ),
                    );
                  }

                  final lead = controller.leads[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.blue.shade100,
                        child: Icon(Icons.person, color: Colors.blue.shade700),
                      ),
                      title: Text(
                        lead.name ?? "No Name",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (lead.email != null) Text(lead.email!),
                          if (lead.phoneNumber != null)
                            Text("📞 ${lead.phoneNumber!}"),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      ),
                      onTap: () async {
                        controller.onItemTap(id: lead.id);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
