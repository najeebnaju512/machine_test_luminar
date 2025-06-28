import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_luminar/router/router.dart';
import 'package:machine_test_luminar/router/transition/transition.dart';
import 'package:machine_test_luminar/screens/authenticated/listing_screen/details/view.dart';
import 'package:machine_test_luminar/shared/model/authenticated/lead_list_model.dart';
import 'package:machine_test_luminar/shared/repo/authenticated/lead_list.dart';

class LeadListController extends GetxController {
  final repo = LeadListRepo();
  final RxList<Result> leads = <Result>[].obs;
  Rx<String?> errorMsg = Rx<String?>(null);
  final RxBool isLoading = false.obs;
  final RxBool hasMore = true.obs;
  final RxInt currentPage = 1.obs;
  final searchController = TextEditingController();

  final ScrollController scrollController = ScrollController();

  String? _search;
  String? _leadStatus;
  String? _leadSource;
  String? _course;
  String? _dateFrom;
  String? _dateTo;

  @override
  void onInit() {
    fetchLeads();
    // onSearch();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  void onSearch() {
    // searchController.addListener(() {
    _search = searchController.text.trim().isEmpty
        ? null
        : searchController.text;
    fetchLeads(isRefresh: true);
    // });
  }

  void fetchLeads({
    bool isRefresh = false,
    String? leadStatus,
    String? leadSource,
    String? course,
    String? dateFrom,
    String? dateTo,
  }) async {
    if (isRefresh) {
      currentPage.value = 1;
      hasMore.value = true;
      leads.clear();
    }

    if (!hasMore.value || isLoading.value) return;

    isLoading.value = true;

    // Save filters for future calls (e.g., on scroll)
    _leadStatus = leadStatus ?? _leadStatus;
    _leadSource = leadSource ?? _leadSource;
    _course = course ?? _course;
    _dateFrom = dateFrom ?? _dateFrom;
    _dateTo = dateTo ?? _dateTo;

    final response = await repo.getLeadList(
      search: _search,
      page: currentPage.value,
      pageSize: 20,
      leadStatus: _leadStatus,
      leadSource: _leadSource,
      course: _course,
      dateFrom: _dateFrom,
      dateTo: _dateTo,
    );

    if (response?.status == 200) {
      final model = LeadListModel.fromJson(response?.data);
      leads.addAll(model.results ?? []);
      hasMore.value = model.next != null;
      currentPage.value++;
    } else {
      errorMsg.value = response?.msg;
    }

    isLoading.value = false;
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      fetchLeads();
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> onItemTap({String? id}) async {
    // appRouter.goNamed(Authenticated.lead, pathParameters: {'id': ?id,});'
    await pushWithTransition(navKey.currentContext!, LeadDetailPage(id: id!));
  }

  void onRetry() {
    fetchLeads();
  }
}
