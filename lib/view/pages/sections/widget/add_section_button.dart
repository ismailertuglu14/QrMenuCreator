import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/init/provider/section_provider.dart';
import 'package:qrmenu/product/widget/bottom_sheet_button.dart';

import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import 'add_section_dialog.dart';

class AddSectionButton extends StatelessWidget {
  const AddSectionButton({super.key, required this.sectionSuggestionList});
  final List<String> sectionSuggestionList;

  @override
  Widget build(BuildContext context) {
    return Consumer<SectionProvider>(
      builder: (context, provider, child) => Padding(
        padding: PagePadding.allDefault(),
        child: BottomSheetButton(
          onPressed: () =>
              addSectionDialog(context, sectionSuggestionList, provider),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add),
              Text("Add Section"),
            ],
          ),
        ),
      ),
    );
  }
}
