import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';
import 'package:qrmenu/core/init/provider/location_pick_provider.dart';

import '../../../../core/constans/enum/image_keys.dart';
import '../../../../product/widget/elevation_button.dart';

class LocationPickerActionButtons extends StatelessWidget {
  const LocationPickerActionButtons(
      {super.key, required this.getCurrentLocation});
  final Future<void> Function() getCurrentLocation;
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationPickProvider>(
      builder: (context, provider, child) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CommonElevationButton(
              onPressed: () => provider.resetRotation(),
              child: ImageKeys.compass_north.imageIcon(color: Colors.white)),
          CommonElevationButton(
              onPressed: provider.zoomIn,
              child: const Icon(Icons.zoom_in_outlined)),
          CommonElevationButton(
              onPressed: provider.zoomOut,
              child: const Icon(Icons.zoom_out_outlined)),
          FloatingActionButton(
            onPressed: () => getCurrentLocation(),
            child: provider.currentLocation != null
                ? Icon(Icons.my_location_rounded, color: Colors.white)
                : Icon(Icons.location_searching, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
