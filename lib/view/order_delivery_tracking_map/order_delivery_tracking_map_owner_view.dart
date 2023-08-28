import 'dart:async';
import 'package:alvamind_library/widget/atom/app_divider.dart';
import 'package:alvamind_library/widget/atom/app_pin_point.dart';
import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_card_container.dart';
import 'package:alvamind_library/widget/molecule/app_modal.dart';
import 'package:alvamind_library/widget/organism/card_pinpoin_delivery/address_content.dart';
import 'package:alvamind_library/widget/organism/item_card/item_card_list.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:laundrynet_mobile_frontend/app/theme/app_sizes.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../../app/theme/app_colors.dart';

class OrderDeliveryTrackingMapOwnerView extends StatefulWidget {
  static const viewAsOwner = '/order-delivery-tracking-map-owner-screen';

  const OrderDeliveryTrackingMapOwnerView({super.key});

  @override
  State<OrderDeliveryTrackingMapOwnerView> createState() => _OrderDeliveryTrackingMapOwnerViewState();
}

class _OrderDeliveryTrackingMapOwnerViewState extends State<OrderDeliveryTrackingMapOwnerView> with SingleTickerProviderStateMixin {
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

          final navigator = Navigator.of(context);
          modal(navigator);

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
      padding: EdgeInsets.only(
        top: AppSizes.padding * 2,
        left: AppSizes.padding,
        right: AppSizes.padding,
      ),
      child: AppCardContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AddressContent(
              deliveryAddress: 'Zabiniec 12/222, 31-215\nCracow, Poland',
              deliveryTime: 'Hari ini, 21 Juni 2023',
            ),
            AppDivider(
              thickness: 2,
              color: AppColors.blackLv8,
            ),
            ItemCardList(
              padding: EdgeInsets.all(AppSizes.padding / 2),
              dateProfileItem: '+62 85177812345',
              starImageCount: '50',
              title: 'Anton Kurniawan',
              dateProgress: '2 Agustus 2023',
              address: 'Jl. Sukamenak DPR RI KOM Kabupaten Prov...',
              isProfile: true,
              isOwner: false,
              isList: true,
              showHeartButton: false,
              textLeftButton: 'Detail Alamat',
              textRightButton: 'Petunjuk Peta',
              fontSizeButton: 12,
              rightIconButton: Icons.location_on,
              onTapLeftButton: () {
                // TODO
              },
              onTapRightButton: () {
                // TODO
              },
              boxShadow: const [
                BoxShadow(
                  color: AppColors.blackLv7,
                  offset: Offset(0, 4),
                  blurRadius: 60,
                  spreadRadius: 0,
                ),
              ],
            ),
          ],
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
            text: 'Petunjuk Arah Google Map',
            rounded: true,
          ),
        ),
      ],
    );
  }
}
