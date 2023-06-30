import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/text_field.dart';

import '../../../../product/utility/page_padding.dart';
part '../viewmodel/add_ons_view_model.dart';

class AddOnsView extends StatefulWidget {
  const AddOnsView({super.key});

  @override
  State<AddOnsView> createState() => _AddOnsViewState();
}

class _AddOnsViewState extends AddOnsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Expanded(
              child: Padding(
                padding: PagePadding.allMedium(),
                child: Wrap(children: [
                  Expanded(
                      child: Text(
                    "Add a new Addon",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.text.titleLarge?.fontSize),
                  )),
                  Expanded(
                      child: Padding(
                    padding: PagePadding.allDefault(),
                    child: CommonTextField(
                      hintText: "Name",
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: PagePadding.allDefault(),
                    child: CommonTextField(
                      hintText: "Description",
                    ),
                  )),
                  Padding(
                    padding: PagePadding.allDefault(),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              "USD",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.text.titleMedium?.fontSize),
                            )),
                        Expanded(
                            flex: 8,
                            child: Padding(
                              padding: PagePadding.allDefault(),
                              child: CommonTextField(
                                hintText: "Price",
                              ),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: PagePadding.allMedium(),
                          child: OutlinedButton(
                              onPressed: () => context.pop(),
                              child: Text("Cancel")),
                        )),
                        Expanded(
                          child: Padding(
                            padding: PagePadding.allMedium(),
                            child: CommonElevationButton(
                              child: Text("Save"),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
        child: Icon(Icons.add_outlined),
      ),
      bottomNavigationBar: Padding(
        padding: PagePadding.allMedium(),
        child: CommonElevationButton(
          child: Padding(
            padding: PagePadding.allMedium(),
            child: Text("Add selected"),
          ),
          onPressed: () {},
        ),
      ),
      appBar: CommonAppBar(title: Text('Add Ons')),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => AddOnsCheckBoxListTileBuilder(
                title: "title",
                subTitle: "subTitle",
                value: false,
                onChanged: (p0) {},
              )),
    );
  }
}

class AddOnsCheckBoxListTileBuilder extends StatelessWidget {
  const AddOnsCheckBoxListTileBuilder({
    super.key,
    required this.title,
    required this.subTitle,
    required this.value,
    this.onChanged,
  });
  final String title;
  final String subTitle;
  final bool value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      title: Text(title),
      secondary: Column(children: [
        Flexible(child: Text("USD 25")),
        Flexible(child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)))
      ]),
      controlAffinity: ListTileControlAffinity.leading,
      subtitle: Text(subTitle),
      onChanged: onChanged,
    );
  }
}
