import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constans/enum/upload_file_keys.dart';
import '../../core/extension/context_extension.dart';
import '../utility/border_radius.dart';

uploadFileDialog(
    BuildContext context,
    ImagePicker picker,
    bool onProfile,
    UploadFileTypeKeys fileType,
    Future<void> Function({required Object fileObject}) uploadObject,
    {Future<void> Function()? removeFile,
    String? currentFile}) {
  return showModalBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                leading: const Icon(Icons.photo_album_outlined),
                title: const Text("Gallery"),
                onTap: () async {
                  switch (fileType) {
                    case UploadFileTypeKeys.SINGLE_IMAGE:
                      pickAndCropSingleImage(
                              imageSource: ImageSource.gallery, picker: picker)
                          .then((value) => value != null
                              ? uploadObject(fileObject: value)
                              : null);
                      break;
                    case UploadFileTypeKeys.SINGLE_VIDEO:
                      pickAndCropSingleVideo(
                              imageSource: ImageSource.gallery, picker: picker)
                          .then((value) => value != null
                              ? uploadObject(fileObject: value)
                              : null);

                      break;
                    case UploadFileTypeKeys.MULTIPLE_IMAGE:
                      pickMultiImage(picker: picker).then((value) =>
                          value != null
                              ? uploadObject(fileObject: value)
                              : null);
                      break;
                    default:
                  }
                  context.pop();
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text("Camera"),
                onTap: () async {
                  switch (fileType) {
                    case UploadFileTypeKeys.SINGLE_IMAGE:
                      pickAndCropSingleImage(
                              imageSource: ImageSource.camera, picker: picker)
                          .then((value) => value != null
                              ? uploadObject(fileObject: value)
                              : null);
                      break;
                    case UploadFileTypeKeys.MULTIPLE_IMAGE:
                      pickAndCropSingleImage(
                              imageSource: ImageSource.camera, picker: picker)
                          .then((value) => value != null
                              ? uploadObject(fileObject: [value])
                              : null);
                      break;
                    case UploadFileTypeKeys.SINGLE_VIDEO:
                      pickAndCropSingleVideo(
                              imageSource: ImageSource.camera, picker: picker)
                          .then((value) => value != null
                              ? uploadObject(fileObject: value)
                              : null);

                      break;
                    default:
                  }
                  context.pop();
                },
              ),
            ),
          ],
        ),
        (!onProfile || currentFile == null || currentFile.isEmpty)
            ? const SizedBox.shrink()
            : Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: const Icon(Icons.delete_outline),
                      title: const Text("Delete current photo"),
                      onTap: () async {
                        removeFile!();
                        context.pop();
                      },
                    ),
                  ),
                ],
              )
      ],
    ),
  );
}

Future<List<XFile?>?> pickMultiImage({required ImagePicker picker}) async {
  List<XFile?> file = await picker.pickMultiImage();
  return file;
}

Future<XFile?> pickAndCropSingleImage(
    {required ImageSource imageSource, required ImagePicker picker}) async {
  XFile? file = await picker.pickImage(source: imageSource);
  return file != null ? singleCropImage(pickedFile: file) : null;
}

Future<XFile?> pickAndCropSingleVideo(
    {required ImageSource imageSource, required ImagePicker picker}) async {
  XFile? file = await picker.pickVideo(source: imageSource);
  return file;
}

Future<XFile> singleCropImage({required XFile pickedFile}) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: pickedFile.path,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.orange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      /* IOSUiSettings(
          title: 'Cropper',
        ),*/
    ],
  );

  return XFile(croppedFile != null ? croppedFile.path : pickedFile.path);
}
