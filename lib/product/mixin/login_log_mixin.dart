import 'dart:io';

import 'package:device_marketing_names/device_marketing_names.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get_ip_address/get_ip_address.dart';

import '../../view/auth/login/service/email/ILogin_service.dart';

mixin LoginLogMixin on ILoginService {
  Future<String> getDeviceName() async {
    try {
      final getDeviceName = DeviceMarketingNames();
      final deviceModel = await getDeviceName.getNames();
      String deviceName = getDeviceName.getNamesFromModel(
          Platform.isAndroid ? DeviceType.android : DeviceType.ios,
          deviceModel);
      return deviceName;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getDeviceId() async {
    try {
      final deviceId = await FlutterUdid.consistentUdid;

      return deviceId;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getDeviceIpAdress() async {
    try {
      final IpAddress ipAddress = IpAddress();
      dynamic data = await ipAddress.getIpAddress();
      return data;
    } on IpAddressException catch (e) {
      throw Exception(e);
    }
  }
}
