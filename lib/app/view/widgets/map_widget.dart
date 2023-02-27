import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapZoomPanBehavior _zoomPanBehavior;

  late double latitude = -22.859352775021673;
  late double longitude = -47.04971628178976;
  String url = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  @override
  void initState() {
    super.initState();

    _zoomPanBehavior = MapZoomPanBehavior(
        focalLatLng: MapLatLng(latitude, longitude),
        zoomLevel: 10,
        // enableDoubleTapZooming: true,
        enablePinching: true);
  }

  @override
  Widget build(BuildContext context) {
    return SfMaps(
      layers: [
        MapTileLayer(
            urlTemplate: url,
            zoomPanBehavior: _zoomPanBehavior,
            initialFocalLatLng: MapLatLng(latitude, longitude),
            initialMarkersCount: 5,
            markerBuilder: (BuildContext context, int index) {
              return MapMarker(
                latitude: latitude,
                longitude: longitude,
                // iconColor: Colors.red,
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
              );
            }),
      ],
    );
  }
}
