import '../../../../core/constans/enum/image_keys.dart';

class OnboardModel {
  final String title;
  final ImageKeys imagePath;
  final String description;

  OnboardModel({
    required this.title,
    required this.imagePath,
    required this.description,
  });
}

class OnboardModels {
  OnboardModels._();

  static final List<OnboardModel> items = [
    OnboardModel(
      imagePath: ImageKeys.onboard_1,
      title: "Welcome to QR Menu",
      description:
          "With us, you are taking a step towards further growing your restaurant and increasing your online presence. Now you have the chance to offer your customers a fast, easy and modern experience.",
    ),
    OnboardModel(
      imagePath: ImageKeys.onboard_2,
      title: "Ready templates",
      description:
          "Introduce their content to our customers quickly with ready-made templates",
    ),
    OnboardModel(
      imagePath: ImageKeys.onboard_3,
      title: "Cheap price",
      description:
          "We make our customers a much cheaper and happy experience than the market price.",
    ),
    OnboardModel(
      imagePath: ImageKeys.onboard_4,
      title: "Management Panel",
      description:
          "You can edit multiple created templates and their contents from the yoentim panel in one place.",
    ),
    OnboardModel(
      imagePath: ImageKeys.onboard_5,
      title: "Add Detailed Menu",
      description:
          "You can add your content by breaking them into categories and types",
    ),
    OnboardModel(
      imagePath: ImageKeys.onboard_6,
      title: "See Your Contents",
      description:
          "Evaluate your allergies and dietary status by seeing the ingredients of food and drinks",
    ),
  ];
}
