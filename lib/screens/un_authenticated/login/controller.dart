import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_luminar/app_config/app_state.dart';
import 'package:machine_test_luminar/core/dev_tools/print.dart';
import 'package:machine_test_luminar/db/hive_box_helper.dart';
import 'package:machine_test_luminar/db/hive_key.dart';
import 'package:machine_test_luminar/db/model/user_details/user.dart';
import 'package:machine_test_luminar/shared/model/un_authenticated/user_me_model.dart';
import 'package:machine_test_luminar/shared/repo/un_authenticated/login.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = RxBool(false);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginRepo repo = LoginRepo();

  Future<void> onSubmit() async {
    isLoading.value = true;
    if (formKey.currentState?.validate() ?? false) {
      var res = await repo.onLogin(
        email: emailController.text,
        password: passwordController.text,
      );

      if (res?.status == 200) {
        var data = UserMeModel.fromJson(res?.data);
        await _setToLocalDb(data);
        appRouteState.logIn();
      }
    }
    isLoading.value = false;
  }

  Future<void> _setToLocalDb(UserMeModel data) async {
    try {
      if (data.access != null && data.user != null) {
        var box = HiveHelper.getUserDetailsHiveBox();
        var user = UserDetailsHive(
          accestoken: data.access!,
          refreshtoken: data.refresh!,
          email: data.user?.email ?? '',
          name: data.user?.fullName ?? '',
          phoneNo: data.user?.phone ?? '',
          whatsAppNo: data.user?.whatsappNumber ?? '',
          id: data.user?.uid ?? '',
        );
        box.put(DbKeys.userKey, user);
      }
    } catch (e) {
      devPrintError(e.toString());
    }
  }
}
