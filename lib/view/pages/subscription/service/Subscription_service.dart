// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qrmenu/core/constans/network/network_constants.dart';
import 'package:qrmenu/view/pages/subscription/model/get_plan_response_model.dart';

import 'ISubscription_service.dart';

class SubscriptionService extends ISubscriptionService {
  SubscriptionService(super.dio);

  @override
  Future<GetPlanResponseModel> getPlan() async {
    try {
      Response<dynamic> response = await dio.get(NetworkConstants.GET_PLAN);

      if (response.statusCode == HttpStatus.ok) {
        return GetPlanResponseModel.fromJson(response.data);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
