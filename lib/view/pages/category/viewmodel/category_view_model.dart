// ignore_for_file: use_build_context_synchronously

part of '../view/category_view.dart';

abstract class CategoryViewModel extends State<CategoryView> {
  late final CategoryService _categoryService;
  late final CategoryProvider _categoryProvider;
  late final ImagePicker _picker;

  String? _selectedSection;

  @override
  void initState() {
    super.initState();

    _categoryProvider = CategoryProvider.instance;
    _categoryService = CategoryService(NetworkManager.instance.dio);
    _picker = ImagePicker();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<String> _sectionSuggestionList = [
    "Beer",
    "Breakfast",
    "Brunch",
    "Dessert",
    "Dinner",
    "Lunch",
    "Main Courses"
  ];

  Future<void> createCategory() async {
    if (_categoryProvider.categoryController.text.isNotEmpty) {
      try {
        _categoryProvider.changeLoading();
        CreateCategoryResponseModel response =
            await _categoryService.createCategory(
                menuId: widget.id ?? "",
                name: _categoryProvider.categoryController.text,
                image: _categoryProvider.categoryImage as XFile);
        if (response.isSuccess && response.errors.isEmpty) {
          context.pop();
          _categoryProvider.addCategory(response.data);
          _categoryProvider.categoryController.clear();
          _categoryProvider.setCategoryImage = null;
          _categoryProvider.setSelectedSuggestionIndex = null;
        } else {
          Fluttertoast.showToast(msg: response.errors[0].message);
        }
      } catch (e) {
        throw Exception(e);
      } finally {
        _categoryProvider.changeLoading();
      }
    } else {
      Fluttertoast.showToast(msg: "Please enter a section name");
    }
  }

  Future<void> uploadFile({required Object fileObject}) async {
    try {
      _categoryProvider.changeLoading();
      fileObject as XFile;

      _categoryProvider.setCategoryImage = fileObject;
    } catch (e) {
      throw Exception(e);
    } finally {
      _categoryProvider.changeLoading();
    }
  }
}
