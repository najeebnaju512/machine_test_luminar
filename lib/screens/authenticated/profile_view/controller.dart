import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_luminar/app_config/app_state.dart';
import 'package:machine_test_luminar/db/hive_box_helper.dart';
import 'package:machine_test_luminar/router/router.dart';
import 'package:machine_test_luminar/shared/model/authenticated/profilemodel.dart';
import 'package:machine_test_luminar/shared/repo/authenticated/profil.dart';

class ProfileController extends GetxController {
  RxBool isEditing = false.obs;
  RxString name = "".obs;
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final whatsAppController = TextEditingController();
  User? userData = User();
  ProfileRepo repo = ProfileRepo();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void onEditPress() {
    if (isEditing.value) {
      showDialog(
        context: navKey.currentContext!,
        builder: (context) => AlertDialog(
          title: const Text('Update '),
          content: const Text('Are you sure you want to update ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _saveUser();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      );
    } else {
      isEditing.value = true;
    }
  }

  void _saveUser() {
    if (formKey.currentState?.validate() ?? false) {
      repo.onUpdateProfile(
        email: emailController.text,
        name: nameController.text,
        phone: phoneNoController.text,
        whatsAppno: whatsAppController.text,
      );
    }
  }

  void onLogout() {
    appRouteState.logout();
    HiveHelper.getUserDetailsHiveBox().clear();
  }

  Future<void> getData() async {
    if (isLoading.value ) return;
    isLoading.value = true;
    var res = await repo.getProfileData();
    if (res?.status == 200) {
      userData = ProfileModel.fromJson(res?.data).user;
      nameController.text = userData?.fullName ?? '';
      name.value = userData?.fullName ?? '';
      emailController.text = userData?.email ?? '';
      phoneNoController.text = userData?.phone ?? '';
      whatsAppController.text = userData?.whatsappNumber ?? '';
      name.refresh();
    }
     isLoading.value = false;
  }
}
