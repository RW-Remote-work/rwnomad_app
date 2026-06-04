import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/job/job_filter.dart';

final jobFilterNotifierProvider =
    StateNotifierProvider<JobFilterNotifier, JobFilter>((ref) {
  return JobFilterNotifier();
});

class JobFilterNotifier extends StateNotifier<JobFilter> {
  JobFilterNotifier() : super(const JobFilter());

  void setKeyword(String keyword) {
    state = state.copyWith(name: keyword.isEmpty ? null : keyword);
  }

  void toggleJobClass(int classId) {
    final current = List<int>.from(state.jobClassIdList ?? []);
    if (current.contains(classId)) {
      current.remove(classId);
    } else {
      current.add(classId);
    }
    state = state.copyWith(
      jobClassIdList: current.isEmpty ? null : current,
    );
  }

  void setJobTypes(List<String> types) {
    state = state.copyWith(typeList: types.isEmpty ? null : types);
  }

  void setCountry(int? countryId) {
    state = state.copyWith(countryId: countryId);
  }

  void setSortBy(String sort) {
    state = state.copyWith(sortBy: sort);
  }

  void setRecommendFlag(int? flag) {
    state = state.copyWith(recommendFlag: flag);
  }

  bool get hasActiveFilters =>
      (state.jobClassIdList?.isNotEmpty ?? false) ||
      (state.typeList?.isNotEmpty ?? false) ||
      state.countryId != null ||
      (state.name?.isNotEmpty ?? false);

  void reset() {
    state = const JobFilter();
  }
}
