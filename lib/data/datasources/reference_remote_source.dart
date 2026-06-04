import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/api_client.dart';
import '../../core/api/api_endpoints.dart';
import '../models/reference/job_class.dart';
import '../models/reference/country.dart';
import '../models/reference/currency.dart';

final referenceRemoteSourceProvider = Provider<ReferenceRemoteSource>((ref) {
  return ReferenceRemoteSource(ref.read(dioProvider));
});

class ReferenceRemoteSource {
  final Dio _dio;
  ReferenceRemoteSource(this._dio);

  Future<List<JobClass>> getJobClasses() async {
    final response = await _dio.get(ApiEndpoints.jobClasses);
    final list = response.data as List<dynamic>;
    return list.map((e) => JobClass.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<Country>> getCountries() async {
    final response = await _dio.get(ApiEndpoints.countries);
    final list = (response.data as List<dynamic>)
        .map((e) => Country.fromJson(e as Map<String, dynamic>))
        .toList();
    // Move "分布式" (id=4170) to the front
    final distributed = list.where((c) => c.id == 4170).toList();
    final others = list.where((c) => c.id != 4170).toList();
    return [...distributed, ...others];
  }

  Future<List<Currency>> getCurrencies() async {
    final response = await _dio.get(ApiEndpoints.currencies);
    final list = response.data as List<dynamic>;
    return list.map((e) => Currency.fromJson(e as Map<String, dynamic>)).toList();
  }
}
