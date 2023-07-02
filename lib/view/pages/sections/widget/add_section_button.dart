import 'package:flutter/material.dart';
import 'package:qrmenu/core/init/provider/section_provider.dart';

import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import 'add_section_dialog.dart';

class AddSectionButton extends StatelessWidget {
  const AddSectionButton(
      {super.key, required this.sectionSuggestionList, required this.provider});
  final List<String> sectionSuggestionList;
  final SectionProvider provider;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allDefault(),
      child: CommonElevationButton(
          onPressed: () =>
              addSectionDialog(context, sectionSuggestionList, provider),
          child: Padding(
            padding: PagePadding.allMedium(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add),
                Text("Add Section"),
              ],
            ),
          )),
    );
  }
}
