import 'dart:typed_data';

import 'package:find_sport/bloc/home_screen/home_screen_bloc.dart';
import 'package:find_sport/core/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'dart:ui' as ui;

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late YandexMapController controller;
  final List<MapObject> mapObjects = [];

  Future<Uint8List> _getBytesFromAsset(
      String path, int width, int height) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List() ??
        Uint8List(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
      return Stack(
        children: [
          YandexMap(
            mapType: state.isMap == true ? MapType.map : MapType.satellite,
            mapObjects: mapObjects,
            onMapTap: (p) async {
              mapObjects.clear();
              mapObjects.add(
                PlacemarkMapObject(
                  mapId: const MapObjectId('point'),
                  point: p,
                  opacity: 1,
                  icon: PlacemarkIcon.single(
                    PlacemarkIconStyle(
                      image: BitmapDescriptor.fromBytes(await _getBytesFromAsset('assets/image/marker.png', 60, 100)),
                    ),
                  ),
                ),
              );
              context.read<HomeScreenBloc>().add(ChangedPointEvent(point: p));
              controller.moveCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(target: p),
                ),
                animation: const MapAnimation(type: MapAnimationType.smooth, duration: 1)
              );
            },
            onMapCreated: (controller) async {
              this.controller = controller;
              Point? point;
              final enable = await Geolocator.checkPermission();
              if (enable == LocationPermission.always ||
                  enable == LocationPermission.whileInUse) {
                final p = await Geolocator.getCurrentPosition();
                point = Point(latitude: p.latitude, longitude: p.longitude);
              } else {
                final status = await Geolocator.requestPermission();
                if (status == LocationPermission.always ||
                    status == LocationPermission.whileInUse) {
                  final p = await Geolocator.getCurrentPosition();
                  point = Point(latitude: p.latitude, longitude: p.longitude);
                }
              }
              if (point != null) {
                controller.moveCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: point,
                    ),
                  ),
                );
              }
            },
          ),
          Positioned(
            top: 12,
            left: 20,
            child: Container(
              height: 30,
              padding: const EdgeInsets.all(4),
              color: Colors.white,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<HomeScreenBloc>()
                          .add(ChangedMapTypeEvent(index: 0));
                    },
                    child: Text(
                      'Map',
                      style: TextStyle(
                        fontWeight: state.isMap == true
                            ? FontWeight.w500
                            : FontWeight.w400,
                        fontSize: 11,
                        color: state.isMap == true
                            ? Colors.black
                            : const Color(0xFF565656),
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<HomeScreenBloc>()
                          .add(ChangedMapTypeEvent(index: 1));
                    },
                    child: Text(
                      'Satellite',
                      style: TextStyle(
                        fontWeight: state.isMap == false
                            ? FontWeight.w500
                            : FontWeight.w400,
                        fontSize: 11,
                        color: state.isMap == false
                            ? Colors.black
                            : const Color(0xFF565656),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.paddingOf(context).bottom + 20,
            right: 20,
            child: InkWell(
              onTap: () async {
                Point? point;
                final enable = await Geolocator.checkPermission();
                if (enable == LocationPermission.always ||
                    enable == LocationPermission.whileInUse) {
                  final p = await Geolocator.getLastKnownPosition();
                  if(p != null){
                    point = Point(latitude: p.latitude, longitude: p.longitude);
                  }
                } else {
                  final status = await Geolocator.requestPermission();
                  if (status == LocationPermission.always ||
                      status == LocationPermission.whileInUse) {
                    final p = await Geolocator.getLastKnownPosition();
                    if(p != null){
                      point = Point(latitude: p.latitude, longitude: p.longitude);
                    }
                  }
                }
                if (point != null) {
                  mapObjects.clear();
                  mapObjects.add(
                    PlacemarkMapObject(
                      mapId: const MapObjectId('point'),
                      point: point,
                      opacity: 1,
                      icon: PlacemarkIcon.single(
                        PlacemarkIconStyle(
                          image: BitmapDescriptor.fromBytes(await _getBytesFromAsset('assets/image/marker.png', 60, 100)),
                        ),
                      ),
                    ),
                  );
                  context.read<HomeScreenBloc>().add(ChangedPointEvent(point: point));
                  controller.moveCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: point,
                      ),
                    ),
                    animation: const MapAnimation(type: MapAnimationType.smooth, duration: 1)
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Center(
                  child: Image.asset(
                    AppIcons.gps,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 20,
            child: Container(
              width: 30,
              padding: const EdgeInsets.all(4),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                      onTap: () async {
                        controller.moveCamera(CameraUpdate.zoomIn());
                      },
                      child: const Icon(Icons.add)),
                  const Divider(
                    color: Colors.black,
                  ),
                  InkWell(
                      onTap: () {
                        controller.moveCamera(CameraUpdate.zoomOut());
                      },
                      child: const Icon(Icons.remove)),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
