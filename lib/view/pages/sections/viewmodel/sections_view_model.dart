part of '../view/sections_view.dart';

abstract class SectionsViewModel extends State<SectionsView> {
  late final TextEditingController _sectionController;
  String? _selectedSection;

  @override
  void initState() {
    super.initState();
    _sectionController = TextEditingController();
  }

  @override
  void dispose() {
    _sectionController.dispose();
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

  List<String> _sections = [];
}
