part of '../view/create_item_view.dart';

abstract class CreateItemViewModel extends State<CreateItemView> {
  late final ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  List<AllergensModel> allergens = [
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
    AllergensModel("Fish", Icons.food_bank),
  ];
}
