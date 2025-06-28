import 'package:machine_test_luminar/app_config/app_config.dart';
import 'package:machine_test_luminar/core/dev_tools/print.dart';
import 'package:machine_test_luminar/db/hive_fetch_helper.dart';
import 'package:machine_test_luminar/shared/helper/api_helper.dart';

class ProfileRepo {
  Future<ApiResponse?> getProfileData() async {
    try {
      var response = await ApiHelper.getData(
        endPoint: EndPoints.profile,
        header: ApiHelper.getApiHeader(
          access: GetHiveHelper.getUserDetails()?.accestoken,
        ),
      );
      return response;
    } catch (e) {
      devPrintError('Catch : $e');
    }
    return null;
  }

  Future<ApiResponse?> onUpdateProfile({
    required String email,
    required String name,
    required String phone,
    required String whatsAppno,
  }) async {
    try {
      var response = await ApiHelper.postData(
        endPoint: EndPoints.profile,
        method: ApiCase.patch,
        body: {
          "email": email,
          "full_name": name,
          "phone": phone,
          "whatsapp_number": whatsAppno,
        },
        header: ApiHelper.getApiHeader(),
      );
      return response;
    } catch (e) {
      devPrintError('Catch : $e');
    }
    return null;
  }
}
