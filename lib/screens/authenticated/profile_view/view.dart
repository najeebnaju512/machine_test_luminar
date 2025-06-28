import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_luminar/core/tag_helper/teg_generator.dart';
import 'package:machine_test_luminar/widget/screens/on_error_page.dart';
import 'package:machine_test_luminar/widget/text_form_feild/widget.dart';

import 'controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileController controller;

  final String tag = fnTagGenerator();
  @override
  void initState() {
    controller = Get.put(ProfileController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ProfileController>(tag: tag);
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
            body: Column(
              children: [
                Obx(() {
                  final initials = controller.name.value.isNotEmpty
                      ? controller.name.value
                            .trim()
                            .split(" ")
                            .map((e) => e[0])
                            .take(2)
                            .join()
                            .toUpperCase()
                      : "U";
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF4F46E5), Color(0xFF3B82F6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Logout'),
                                    content: const Text(
                                      'Are you sure you want to logout?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          controller.onLogout();
                                        },
                                        child: const Text('Logout'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(Icons.logout),
                              color: Colors.white,
                              tooltip: "Logout",
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        if (controller.isLoading.value) ...[
                          Center(child: CupertinoActivityIndicator()),
                        ],
                        if (!controller.isLoading.value) ...[
                          CircleAvatar(
                            radius: 36,
                            backgroundColor: Colors.white,
                            child: Text(
                              initials,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4F46E5),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            controller.nameController.text,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            controller.emailController.text,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                }),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, -3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Spacer(),
                            Obx(
                              () => IconButton(
                                icon: Icon(
                                  controller.isEditing.value
                                      ? Icons.check
                                      : Icons.edit,
                                  color: Colors.blue,
                                ),
                                tooltip: controller.isEditing.value
                                    ? 'Save'
                                    : 'Edit',
                                onPressed: () {
                                  controller.onEditPress();
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Obx(
                              () => controller.isLoading.value
                                  ? Center(child: CupertinoActivityIndicator())
                                  : Form(
                                      key: controller.formKey,
                                      child: Column(
                                        children: [
                                          CustomTextFormField(
                                            label: "Name",
                                            controller:
                                                controller.nameController,
                                            readOnly:
                                                !controller.isEditing.value,
                                            validationTypes: [
                                              ValidationType.required,
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          CustomTextFormField(
                                            label: "Email",
                                            controller:
                                                controller.emailController,
                                            readOnly:
                                                !controller.isEditing.value,
                                            validationTypes: [
                                              ValidationType.required,
                                              ValidationType.email,
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          CustomTextFormField(
                                            label: "Phone No",
                                            controller:
                                                controller.phoneNoController,
                                            readOnly:
                                                !controller.isEditing.value,
                                            validationTypes: [
                                              ValidationType.required,
                                              ValidationType.phone,
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          CustomTextFormField(
                                            label: "WhatsApp No",
                                            controller:
                                                controller.whatsAppController,
                                            readOnly:
                                                !controller.isEditing.value,
                                            validationTypes: [
                                              ValidationType.required,
                                              ValidationType.phone,
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
