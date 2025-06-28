import 'package:get/get.dart';
import 'package:machine_test_luminar/shared/model/authenticated/lead_details_mode.dart';
import 'package:machine_test_luminar/shared/repo/authenticated/lead_list.dart';

class LeadDetailsController extends GetxController {
  final repo = LeadListRepo();
  final String? id;
  RxBool isloading = false.obs;

  Rx<Lead?> leadData = Rx<Lead?>(null);

  Rx<String?> errorMsg = Rx<String?>(null);

  LeadDetailsController({required this.id});

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    if (id == null) {
      leadData.value = null;
      return;
    }
    if (isloading.value) return;
    isloading.value = true;
    var res = await repo.getLeadDetails(id!);
    if (res?.status == 200) {
      leadData.value = LeadDetailsModel.fromJson(res?.data).lead;
      leadData.refresh();
      isloading.value = false;
    } else {
      errorMsg.value = res?.msg;
    }
  }

  void onRetry() {
    getData();
  }
}
