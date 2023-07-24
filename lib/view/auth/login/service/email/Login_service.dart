// ignore_for_file: file_names, use_build_context_synchronously, deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/network/network_constants.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/view/auth/login/model/get_business_response_model.dart';
import 'package:qrmenu/view/auth/login/model/login_request_model.dart';
import 'package:qrmenu/view/auth/login/model/login_response_model.dart';
import '../../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../../core/constans/enum/route_keys.dart';
import '../../../../../core/extension/try_exception_extension.dart';

import '../../../../../core/init/cache/local_storage.dart';
import '../../../../../product/mixin/login_log_mixin.dart';
import 'ILogin_service.dart';

class LoginService extends ILoginService with LoginLogMixin {
  LoginService(super.dio);

  @override
  Future<LoginResponseModel> login(
      {required LoginRequestModel requestModel}) async {
    Response<dynamic> response =
        await dio.post(NetworkConstants.LOGIN, data: requestModel.toJson());
    try {
      Response<dynamic> response =
          await dio.post(NetworkConstants.LOGIN, data: requestModel.toJson());
      if (response.statusCode == HttpStatus.ok) {
        LoginResponseModel loginResponse =
            LoginResponseModel.fromJson(response.data);

        if (loginResponse.isSuccess && loginResponse.errors.isEmpty) {
          saveRequestBody(loginResponse, requestModel);

          getBusiness();

          return loginResponse;
        } else {
          throw Exception("Login Error");
        }
      } else {
        throw Exception("Login Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<GetBusinessResponseModel> getBusiness() async {
    try {
      Response<dynamic> response = await dio.get(NetworkConstants.GET_BUSINESS);
      if (response.statusCode == HttpStatus.ok) {
        GetBusinessResponseModel businessResponse =
            GetBusinessResponseModel.fromJson(response.data);

        saveBusinessInfo(businessResponse);
        return businessResponse;
      } else {
        throw Exception("Get Business Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void saveRequestBody(
      LoginResponseModel response, LoginRequestModel requestModel) {
    LocaleStorage.instance
        .setStringValue(LocaleKeys.ACCESS_TOKEN, response.data.accessToken);
    LocaleStorage.instance
        .setStringValue(LocaleKeys.REFRESH_TOKEN, response.data.refreshToken);
    LocaleStorage.instance.setStringValue(
        LocaleKeys.EXPIRATION, response.data.expiration.toString());
    LocaleStorage.instance.setStringValue(LocaleKeys.EMAIL, requestModel.email);
    LocaleStorage.instance
        .setStringValue(LocaleKeys.PASSWORD, requestModel.password);
  }

  void saveBusinessInfo(GetBusinessResponseModel response) {
    LocaleStorage.instance
        .setStringValue(LocaleKeys.CURRENCY, response.data.defaultCurrency);

    LocaleStorage.instance
        .setStringValue(LocaleKeys.BUSINESS_NAME, response.data.name);
    LocaleStorage.instance
        .setStringValue(LocaleKeys.RESTAURANT_ID, response.data.id);

    LocaleStorage.instance.setIntValue(
        LocaleKeys.LOCATION_LATITUDE, response.data.location.latitude);
    LocaleStorage.instance.setIntValue(
        LocaleKeys.LOCATION_LONGITUDE, response.data.location.longitude);

    LocaleStorage.instance.setStringValue(
        LocaleKeys.COVER_IMAGE, response.data.profileImage ?? "");

    LocaleStorage.instance.setStringValue(
        LocaleKeys.PHONE_COUNTRY_CODE, response.data.phone.countryCode);

    LocaleStorage.instance.setStringValue(
        LocaleKeys.PHONE_NUMBER, response.data.phone.phoneNumber);
    LocaleStorage.instance.setStringValue(
        LocaleKeys.INSTAGRAM, response.data.socialMedias.instagram);
    LocaleStorage.instance
        .setStringValue(LocaleKeys.THREADS, response.data.socialMedias.threads);
    LocaleStorage.instance.setStringValue(
        LocaleKeys.FACEBOOK, response.data.socialMedias.facebook);

    LocaleStorage.instance
        .setStringValue(LocaleKeys.TWITTER, response.data.socialMedias.twitter);
    LocaleStorage.instance.setStringValue(
        LocaleKeys.WHATSAPP, response.data.socialMedias.whatsapp);
    LocaleStorage.instance
        .setStringValue(LocaleKeys.WEBSITE, response.data.socialMedias.website);
    LocaleStorage.instance.setStringValue(
        LocaleKeys.SUBSCRIPTION_NAME, response.data.purchase?.plan.name ?? "");
    LocaleStorage.instance.setStringValue(LocaleKeys.SUBSCRIPTION_PERIOD,
        response.data.purchase?.periodType ?? "");
    LocaleStorage.instance.setIntValue(
        LocaleKeys.SUBSCRIPTION_PRICE, response.data.purchase?.price ?? 0);
  }
}
