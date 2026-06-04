import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/datasources/job_remote_source.dart';

final jobDetailProvider =
    FutureProvider.family.autoDispose<Map<String, dynamic>, int>(
        (ref, jobId) async {
  final source = ref.read(jobRemoteSourceProvider);
  final job = await source.getJobDetail(jobId);
  return {'job': job, 'loaded': true};
});

final jobApplyProvider = FutureProvider.family.autoDispose<void, int>(
  (ref, jobId) async {
    final source = ref.read(jobRemoteSourceProvider);
    await source.applyJob(jobId);
  },
);

final jobDeliverProvider =
    FutureProvider.family.autoDispose<Map<String, dynamic>, int>(
        (ref, jobId) async {
  final source = ref.read(jobRemoteSourceProvider);
  return await source.getJobDeliver(jobId);
});
