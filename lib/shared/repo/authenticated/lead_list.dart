import 'package:machine_test_luminar/app_config/app_config.dart';
import 'package:machine_test_luminar/core/dev_tools/print.dart';
import 'package:machine_test_luminar/db/hive_fetch_helper.dart';
import 'package:machine_test_luminar/shared/helper/api_helper.dart';

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
      return response;
    } catch (e) {
      devPrintError('Catch : $e');
    }
    return null;
  }

  Future<ApiResponse?> getLeadDetails(String id) async{
    try{
       var response = await ApiHelper.getData(
        endPoint: "${EndPoints.leads}$id",
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
}
