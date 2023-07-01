import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';

import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/provider/edit_business_provider.dart';
import '../../../../core/init/provider/location_pick_provider.dart';
import '../model/get_location_name_response_model.dart';
import '../service/LocationPicker_service.dart';
import '../widget/location_picker_actions_buttons.dart';

part '../viewmodel/location_picker_view_model.dart';

class LocationPickerView extends StatefulWidget {
  const LocationPickerView({Key? key}) : super(key: key);

  @override
  State<LocationPickerView> createState() => _LocationPickerViewState();
}

class _LocationPickerViewState extends LocationPickerViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: const Text("Location Picker")),
      floatingActionButton:
          LocationPickerActionButtons(getCurrentLocation: _getCurrentLocation),
      bottomNavigationBar: Padding(
        padding: PagePadding.horizontalMin(),
        child: Row(
          children: [
            Expanded(
              child: CommonElevationButton(
                  onPressed: () {
                    if (_locationPickProvider.currentLocation != null) {
                      getLocationName();
                      _editBusinessProvider.changeCurrentLocation(
                          _locationPickProvider.currentLocation!);
                      context.pop();
                    }
                  },
                  child: Padding(
                    padding: PagePadding.allMedium(),
                    child: Text("Set current location"),
                  )),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<LocationPickProvider>(
              builder: (context, provider, child) => FlutterMap(
                mapController: provider.mapController,
                options: MapOptions(
                  center: provider
                      .currentLocation, // Başlangıç merkezi (örneğin Chicago)
                  zoom: provider.zoom, // Başlangıçta zoom düzeyi
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  provider.currentLocation != null
                      ? MarkerLayer(
                          markers: [
                            Marker(
                              point: provider.currentLocation!,
                              builder: (ctx) => Icon(
                                Icons.location_on_rounded,
                                color: context.colorScheme.primary,
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
