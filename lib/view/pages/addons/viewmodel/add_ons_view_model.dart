part of '../view/add_ons_view.dart';

abstract class AddOnsViewModel extends State<AddOnsView> {
  late final TextEditingController _titleController;
  late final TextEditingController _subTitleController;
  late final TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _subTitleController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subTitleController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
