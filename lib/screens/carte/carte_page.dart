import 'package:flutter/material.dart';
import 'package:swipe_app/widgets/entreprise/nav_bar_widget.dart';

import '../../widgets/entreprise/top_bar_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CartePage extends StatefulWidget {
  const CartePage({super.key});

  @override
  State<CartePage> createState() => _CartePageState();
}

class _CartePageState extends State<CartePage> {
  final Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;
  final LatLng _center = const LatLng(6.16372669589717, 1.2349083560805068);
  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(6.16372669589717, 1.2349083560805068),
          icon: mapMarker,
          infoWindow: InfoWindow(
            title: 'Campus Sud(Parking Resto)',
            snippet: 'Université de Lomé',
          )));
      _markers.add(Marker(
          markerId: MarkerId('id-2'),
          position: LatLng(6.163772663789804, 1.234976870066419),
          icon: mapMarker,
          infoWindow: InfoWindow(
            title: 'Campus Nord(Parking Amphi 1000)',
            snippet: 'Université de Lomé',
          )));
      _markers.add(Marker(
          markerId: MarkerId('id-2'),
          position: LatLng(6.163369991446003, 1.230068427829668),
          icon: mapMarker,
          infoWindow: InfoWindow(
            title: 'Campus Nord(Parking Amphi 1000)',
            snippet: 'Université de Lomé',
          )));
      _markers.add(Marker(
          markerId: MarkerId('id-3'),
          position: LatLng(6.162985985747373, 1.2388338864251336),
          icon: mapMarker,
          infoWindow: InfoWindow(
            title: 'Campus Nord(Parking Amphi 20 ans)',
            snippet: 'Université de Lomé',
          )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarWidget(
        automaticallyImplyLeading: true,
        title: 'Carte',
        sub_title: 'Entreprise',
        notification_icon: Icon(Icons.notifications_outlined),
        profile_icon: Icon(Icons.person_outline_rounded),
        notification_counter: 0,
      ),
      bottomNavigationBar: NavBarWidget(
        selectedIndex: 2,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15,
        ),
      ),
    );
  }
}