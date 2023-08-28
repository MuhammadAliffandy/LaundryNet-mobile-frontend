import 'dart:async';

import 'package:alvamind_library/widget/atom/app_pin_point.dart';

import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';

import 'package:alvamind_library/widget/organism/card_pinpoin_delivery/address_content.dart';
import 'package:alvamind_library/widget/organism/card_pinpoin_delivery/courier_content.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class OrderDeliveryTrackingMapCustomerView extends StatefulWidget {
  static const viewAsCustomer = '/order-delivery-tracking-map-customer-screen';

  const OrderDeliveryTrackingMapCustomerView({super.key});

  @override
  State<OrderDeliveryTrackingMapCustomerView> createState() => _OrderDeliveryTrackingMapCustomerViewState();
}

class _OrderDeliveryTrackingMapCustomerViewState extends State<OrderDeliveryTrackingMapCustomerView> with SingleTickerProviderStateMixin {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  AnimationController? _animationController;
  Animation<Offset>? _animationOffset;

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
          isShow = !isShow;
          _startAnimated();
          setState(() {});
        },
      ),
    );

    setState(() {});
  }

  _startAnimated() {
    if (isShow) {
      _animationController!.forward();
    } else {
      _animationController!.reverse();
    }
  }

  @override
  void initState() {
    initMarkers();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animationOffset = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    ));
    super.initState();
  }

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: SlideTransition(
        position: _animationOffset!,
        child: cardDelivery(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: body(),
    );
  }

  Widget body() {
    return Ink(
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        zoomControlsEnabled: false,
        mapType: MapType.hybrid,
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

  Widget cardDelivery() {
    return Padding(
        padding: EdgeInsets.only(top: AppSizes.padding * 2),
        child: AppColumnInk(
          children: [
            AppCardContainer(
              margin: EdgeInsets.symmetric(horizontal: AppSizes.padding),
              child: CourierContent(
                deliveryAddress: const AddressContent(
                  deliveryAddress: 'Zabiniec 12/222, 31-215\nCracow, Poland',
                  deliveryTime: 'Hari ini, 21 Juni 2023',
                ),
                idCourier: 'Joole D Kurir',
                nameCourier: 'ID #1234567',
                onTapCallButton: () {
                  // TODO
                },
                onTapChatButton: () {
                  // TODO
                },
              ),
            ),
          ],
        ));
  }
}
