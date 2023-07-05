class CreateMenuResquestModel {
  final String name;
  final int templateId;

  CreateMenuResquestModel({
    required this.name,
    required this.templateId,
  });

  factory CreateMenuResquestModel.fromJson(Map<String, dynamic> json) =>
      CreateMenuResquestModel(
        name: json["name"],
        templateId: json["templateId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "templateId": templateId,
      };
}
