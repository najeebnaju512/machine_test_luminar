import 'package:machine_test_luminar/app_config/app_config.dart';
import 'package:machine_test_luminar/core/dev_tools/print.dart';
import 'package:machine_test_luminar/core/snack_bar/helper.dart' show showGlobalSnackBar;
import 'package:machine_test_luminar/db/hive_fetch_helper.dart';
import 'package:machine_test_luminar/shared/helper/api_helper.dart';
import 'package:machine_test_luminar/shared/model/authenticated/filter/lead_course_model.dart';
import 'package:machine_test_luminar/shared/model/authenticated/filter/lead_sources_model.dart';
import 'package:machine_test_luminar/shared/model/authenticated/filter/lead_statues.dart';
import 'package:machine_test_luminar/widget/drop_down/drop_down.dart';

class LeadListRepo {
  Future<ApiResponse?> getLeadList({
    String? search,
    int? pageSize,
    int? page,
    String? leadStatus,
    String? leadSource,
    String? course,
    String? dateFrom,
    String? dateTo,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {};
      // Add non-null optional parameters
      if (search != null) queryParams['search'] = search;
      if (pageSize != null) queryParams['page_size'] = pageSize;
      if (page != null) queryParams['page'] = page;
      if (leadStatus != null) queryParams['lead_status'] = leadStatus;
      if (leadSource != null) queryParams['lead_source'] = leadSource;
      if (course != null) queryParams['course'] = course;
      if (dateFrom != null) queryParams['date_from'] = dateFrom;
      if (dateTo != null) queryParams['date_to'] = dateTo;
      var response = await ApiHelper.getData(
        endPoint: EndPoints.leads,
        queryParams: queryParams,
        header: ApiHelper.getApiHeader(
          access: GetHiveHelper.getUserDetails()?.accestoken,
        ),
      );
      if (response.status != 200) {
        showGlobalSnackBar(message: 'Message : ${response.msg}');
      }
      return response;
    } catch (e) {
      devPrintError('Catch : $e');
    }
    return null;
  }

  Future<ApiResponse?> getLeadDetails(String id) async {
    try {
      var response = await ApiHelper.getData(
        endPoint: "${EndPoints.leads}$id",
        header: ApiHelper.getApiHeader(
          access: GetHiveHelper.getUserDetails()?.accestoken,
        ),
      );
      if (response.status != 200) {
        showGlobalSnackBar(message: 'Message : ${response.msg}');
      }
      return response;
    } catch (e) {
      devPrintError('Catch : $e');
    }
    return null;
  }

  Future<List<DropDownItem>> getLeadStatuses() async {
    try {
      var response = await ApiHelper.getData(
        endPoint: EndPoints.leadStatus,
        header: ApiHelper.getApiHeader(
          access: GetHiveHelper.getUserDetails()?.accestoken,
        ),
      );
      if (response.status != 200) {
        showGlobalSnackBar(message: 'Message : ${response.msg}');
      }
      if (response.status == 200) {
        var data = LeadStatusModel.fromJson(response.data).statuses;
        return data
                ?.map((e) => DropDownItem(id: e.id!, label: e.name ?? ''))
                .toList() ??
            [];
      }
    } catch (e) {
      devPrintError('Catch : $e');
      return [];
    }
    return [];
  }

  Future<List<DropDownItem>> getLeadSources() async {
    try {
      var response = await ApiHelper.getData(
        endPoint: EndPoints.leadSource,
        header: ApiHelper.getApiHeader(
          access: GetHiveHelper.getUserDetails()?.accestoken,
        ),
      );
      if (response.status != 200) {
        showGlobalSnackBar(message: 'Message : ${response.msg}');
      }
      if (response.status == 200) {
        var data = LeadSourcesModel.fromJson(response.data).sources;
        return data
                ?.map((e) => DropDownItem(id: e.id!, label: e.label ?? ''))
                .toList() ??
            [];
      }
    } catch (e) {
      devPrintError('Catch : $e');
      return [];
    }
    return [];
  }

  Future<List<DropDownItem>> getLeadCourses() async {
    try {
      var response = await ApiHelper.getData(
        endPoint: EndPoints.courses,
        header: ApiHelper.getApiHeader(
          access: GetHiveHelper.getUserDetails()?.accestoken,
        ),
      );
      if (response.status != 200) {
        showGlobalSnackBar(message: 'Message : ${response.msg}');
      }
      if (response.status == 200) {
        var data = LeadCoursesModel.fromJson(response.data).courses;
        return data
                ?.map((e) => DropDownItem(id: e.id!, label: e.courseName ?? ''))
                .toList() ??
            [];
      }
    } catch (e) {
      devPrintError('Catch : $e');
      return [];
    }
    return [];
  }
}
