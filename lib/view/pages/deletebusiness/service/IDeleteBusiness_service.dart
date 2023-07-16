// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import '../model/delete_business_request_model.dart';
import '../model/delete_business_response_model.dart';

abstract class IDeleteBusinessService {
  late final Dio dio;
  IDeleteBusinessService(this.dio);
  Future<DeleteBusinessResponseModel> deleteBusiness(
      {required DeleteBusinessRequestModel requestModel});
}
