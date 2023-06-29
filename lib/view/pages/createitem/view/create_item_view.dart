import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/utility/grid_delegates.dart';
import 'package:qrmenu/product/widget/text_field.dart';

import '../../../../product/utility/durations.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/app_bar.dart';
part '../viewmodel/create_item_view_model.dart';

class CreateItemView extends StatefulWidget {
  const CreateItemView({Key? key}) : super(key: key);

  @override
  State<CreateItemView> createState() => _CreateItemViewState();
}

class _CreateItemViewState extends CreateItemViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: Text("Create Item")),
      body: Column(children: [
        Expanded(
          child: Container(
              color: Colors.grey.shade300,
              width: context.width,
              height: context.height * 0.2,
              child: Center(
                child: Icon(Icons.camera_alt_outlined),
              )),
        ),
        Expanded(child: CommonTextField()),
        Expanded(child: CommonTextField()),
        SwitchListTile(
          title: Text("Is active"),
          value: false,
          onChanged: (value) {},
        ),
        Expanded(
          child: Column(
            children: [
              Text("Allergens"),
              AnimatedContainer(
                duration: const PageDurations.min(),
                padding: const PagePadding.allMedium(),
                height: context.height / 10,
                child: GridView.builder(
                    gridDelegate: PageGridDelegates.min(),
                    itemBuilder: (context, index) => Container()),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Text("USD"),
              CommonTextField(hintText: "Price"),
            ],
          ),
        ),
      ]),
    );
  }
}
