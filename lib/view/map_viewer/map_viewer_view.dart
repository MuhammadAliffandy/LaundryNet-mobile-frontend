import 'dart:async';

import 'package:alvamind_library/widget/atom/app_pin_point.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/organism/card_pinpoin_delivery/card_pinpoin_delivery.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../../app/theme/app_colors.dart';

class MapViewerView extends StatefulWidget {
  static const routeName = '/map-viewer-screen';

  const MapViewerView({super.key});

  @override
  State<MapViewerView> createState() => _MapViewerViewState();
}

class _MapViewerViewState extends State<MapViewerView> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  Set<Marker> markers = {};
  initMarkers() async {
    markers = {};

    markers.add(
      Marker(
        markerId: const MarkerId("1"),
        position: const LatLng(30.488774662306618, 31.032559163868427),
        icon: await const AppPinPoint(
          image: 'https://picsum.photos/220/300',
        ).toBitmapDescriptor(),
        onTap: () {
          final navigator = Navigator.of(context);
          modal(navigator);
        },
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    initMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: body(),
      floatingActionButton: searchForm(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }

  Widget body() {
    return Ink(
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: LatLng(30.488774662306618, 31.032559163868427),
          zoom: 14,
        ),
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Widget searchForm() {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.padding * 2),
      child: SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width - AppSizes.padding * 2,
        child: AppCardContainer(
          boxShadow: const [
            BoxShadow(
              color: AppColors.blackLv7,
              offset: Offset(0, 4),
              blurRadius: 60,
              spreadRadius: 0,
            ),
          ],
          child: AddressCard(
            countLocationUser: 'Lokasi anda ( dalam 10 km )',
            locationUser: 'Margahayu, Bandung',
            onChanged: (value) {
              // TODO
            },
          ),
        ),
      ),
    );
  }

  modal(NavigatorState navigator) {
    return AppModal.show(
      navigator,
      backgroundColor: AppColors.white,
      price: false,
      children: [
        Expanded(
          child: AppButton(
            onTap: () {},
            text: 'Selanjutnya',
            rounded: true,
          ),
        ),
      ],
    );
  }
}
