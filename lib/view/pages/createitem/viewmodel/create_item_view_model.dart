part of '../view/create_item_view.dart';

abstract class CreateItemViewModel extends State<CreateItemView> {
  late final ImagePicker _imagePicker;
  late final CreateItemProvider _createItemProvider;
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  late final TextEditingController _descriptionController;


  @override
  void initState() {
    super.initState();
    _createItemProvider = CreateItemProvider.instance;
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _descriptionController = TextEditingController();


    _imagePicker = ImagePicker();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
  
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> uploadObject({required Object fileObject}) {
    List<XFile> file = fileObject as List<XFile>;
    _createItemProvider.addAllItemPreviewImage(file);

    return Future.value();
  }
}
