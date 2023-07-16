import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/add_ons_provider.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/text_field.dart';

import '../../../../product/utility/page_padding.dart';
import '../widget/add_ons_check_box_builder.dart';
import '../widget/add_ons_dialog.dart';
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
      appBar: CommonAppBar(title: Text('Add Ons')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addOnsDialog(
            context, _titleController, _subTitleController, _priceController),
        child: Icon(Icons.add_outlined),
      ),
      bottomNavigationBar: Padding(
        padding: PagePadding.allMedium(),
        child: Consumer<AddOnsProvider>(
          builder: (context, provider, child) => CommonElevationButton(
            child: Padding(
                padding: PagePadding.allMedium(), child: Text("Add selected")),
            onPressed: () {
              context.pushReplacement(RouterKeys.CREATE_PRODUCT.route);
            },
          ),
        ),
      ),
      body: Consumer<AddOnsProvider>(
        builder: (context, provider, child) => ListView.builder(
            itemCount: provider.onsPreviewList.length,
            itemBuilder: (context, index) => AddOnsCheckBoxListTileBuilder(
                  index: index,
                  descriptionController: _subTitleController,
                  priceController: _priceController,
                  titleController:  _titleController,
                  removeOnsPreviewList: provider.removeOnsPreviewList,
                  title: provider.onsPreviewList[index].title,
                  subTitle: provider.onsPreviewList[index].subTitle,
                  value: provider.onsPreviewList[index].isSelected,
                  price: provider.onsPreviewList[index].price,
                  onChanged: (value) =>
                      provider.changeIsSelected(index, value!),
                )),
      ),
    );
  }
}
