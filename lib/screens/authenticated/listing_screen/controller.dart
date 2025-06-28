import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_luminar/router/router.dart';
import 'package:machine_test_luminar/router/transition/transition.dart';
import 'package:machine_test_luminar/screens/authenticated/listing_screen/details/view.dart';
import 'package:machine_test_luminar/shared/model/authenticated/lead_list_model.dart';
import 'package:machine_test_luminar/shared/repo/authenticated/lead_list.dart';
import 'package:machine_test_luminar/widget/drop_down/drop_down.dart';

class LeadListController extends GetxController {
  final repo = LeadListRepo();
  final RxList<Result> leads = <Result>[].obs;
  List<DropDownItem> statusList = [];
  List<DropDownItem> courseList = [];
  List<DropDownItem> sourceList = [];
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
    fetchFilterList();
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

  Future<void> _onFilterApply({
    required course,
    required status,
    required source,
  }) async {
    _course = course == null ? null : course.toString();

    _leadSource = source != null ? source.toString() : null;

    _leadStatus = status == null ? null : status.toString();
    fetchLeads(isRefresh: true);
    _course = course == null ? null : course.toString();

    _leadSource = source != null ? source.toString() : null;

    _leadStatus = status == null ? null : status.toString();
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

  Future<void> fetchFilterList() async {
    statusList = await repo.getLeadStatuses();
    courseList = await repo.getLeadCourses();
    sourceList = await repo.getLeadSources();
  }

  void onFilterTap(BuildContext context) {
    DropDownItem? selectedCourse = DropDownItem()..id = _course;
    DropDownItem? selectedStatus = DropDownItem()..id = _leadStatus;
    DropDownItem? selectedSource = DropDownItem()..id = _leadSource;

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text('Filter Leads'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  CustomSearchableDropdown(
                    items: courseList,
                    selectedId: selectedCourse?.id,
                    hintText: "Select Course",
                    onChanged: (item) => setState(() => selectedCourse = item),
                  ),
                  const SizedBox(height: 16),
                  CustomSearchableDropdown(
                    items: statusList,
                    selectedId: selectedStatus?.id,
                    hintText: "Select Status",
                    onChanged: (item) => setState(() => selectedStatus = item),
                  ),
                  const SizedBox(height: 16),
                  CustomSearchableDropdown(
                    items: sourceList,
                    selectedId: selectedSource?.id,
                    hintText: "Select Source",
                    onChanged: (item) => setState(() => selectedSource = item),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _onFilterApply(course: null, status: null, source: null);
                },
                child: const Text('Clear'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _onFilterApply(
                    course: selectedCourse?.id,
                    status: selectedStatus?.id,
                    source: selectedSource?.id,
                  );
                },
                child: const Text('Apply'),
              ),
            ],
          );
        },
      ),
    );
  }
}
