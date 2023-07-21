import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/provider/dashboard_provider.dart';
import '../../../../core/init/provider/home_provider.dart';
import '../../../../product/utility/durations.dart';
import '../model/create_menu_response_model.dart';
import '../model/delete_menu_request_model.dart';
import '../model/delete_restaurant_response_model.dart';
import '../model/get_restaurant_menus_response_model.dart';
import '../service/Dashboard_service.dart';
import '../widget/dashboard_app_bar.dart';
import '../widget/dashboard_create_menu_button.dart';
import '../widget/dashboard_menu_builder.dart';

part '../viewmodel/dashboard_view_model.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends DashboardViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: DashboardCreateMenuButton(
          menuNameController: _menuNameController,
          imagePicker: _imagePicker,
          uploadFile: uploadFile,
          createMenu: createMenu,
        ),
        body: RefreshIndicator(
          onRefresh: () => getRestaurantMenus(),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              DashboardAppBar(),
              DashboardMenuBuilder(deleteRestaurantMenu: deleteRestaurantMenu)
            ],
          ),
        ));
  }
}
