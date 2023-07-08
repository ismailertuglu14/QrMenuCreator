// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class IBusinessService {
  late final Dio dio;
  IBusinessService(this.dio);

  Future<void> changePassword() ;
}
