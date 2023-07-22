// ignore_for_file: file_names

import 'package:dio/dio.dart';

import '../model/get_plan_response_model.dart';

abstract class ISubscriptionService {
  late final Dio dio;
  ISubscriptionService(this.dio);

  Future<GetPlanResponseModel> getPlan();
}
