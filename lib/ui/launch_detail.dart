import 'package:app_spacex/core/manager/launch_manager.dart';
import 'package:app_spacex/core/model/launch.dart';
import 'package:app_spacex/core/model/launchpad.dart';
import 'package:app_spacex/ui/components/image_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LaunchDetailArguments {
  Launch launch;

  LaunchDetailArguments({required this.launch});
}

class LaunchDetail extends StatefulWidget {
  static const route = "/launch";

  final Launch launch;

  const LaunchDetail(this.launch, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LaunchDetailState();
}

class _LaunchDetailState extends State<LaunchDetail> {
  late Launch launch;

  @override
  void initState() {
    launch = widget.launch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool? isFavorite = LaunchManager().isLaunchFavorite(launch.id);

    Launchpad? launchpad = launch.launchpad;

    LatLng position =
        LatLng(launchpad?.latitude ?? 0, launchpad?.longitude ?? 0);

    final Map<String, Marker> _markers = {};
    void _onMapCreated(GoogleMapController controller) {
      setState(() {
        _markers.clear();
        if (launchpad != null) {
          final marker = Marker(
            markerId: MarkerId(launchpad.id),
            position: position,
            infoWindow: InfoWindow(
              title: launchpad.name,
              snippet: launchpad.fullName,
            ),
          );
          _markers[launchpad.id] = marker;
        }
      });
    }

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, isFavorite);
        return true;
      },
      child: Scaffold(
          appBar: AppBar(title: Text(launch.name ?? ''), actions: [
            IconButton(
                onPressed: () async {
                  bool currentlyFavorite = isFavorite ?? false;
                  await LaunchManager().toggleFavorite(launch);
                  setState(() {
                    isFavorite = !currentlyFavorite;
                  });
                },
                icon: Icon(isFavorite ?? false
                    ? Icons.favorite
                    : Icons.favorite_border))
          ]),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: Image.network(
                          launch.links?.patch?.large ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, child, stack) {
                            return const ImagePlaceholder();
                          },
                        ),
                      ),
                      Text(
                        launch.name ?? '',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text("Flight Number : ${launch.flightNumber}"),
                      const SizedBox(
                        height: 12,
                      ),
                      Text("Date : ${launch.dateUTC ?? "unknown"}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                          "Fire Date : ${launch.staticFireDateUTC ?? "unknown"}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Detail",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(launch.details ?? "none")
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                launch.launchpad != null
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: GoogleMap(
                          mapType: MapType.hybrid,
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: position,
                            zoom: 15.0,
                          ),
                          markers: _markers.values.toSet(),
                          scrollGesturesEnabled: false,
                          rotateGesturesEnabled: false,
                        ),
                      )
                    : Container(),
              ],
            ),
          )),
    );
  }
}
