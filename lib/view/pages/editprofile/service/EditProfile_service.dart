// ignore_for_file: file_names, deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constans/network/network_constants.dart';
import '../model/remove_banner_image_response_model.dart';
import '../model/remove_profile_image_response_model.dart';
import 'IEditProfile_service.dart';

class EditProfileService extends IEditProfileService {
  EditProfileService(super.dio);
}
