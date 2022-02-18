import 'package:app_spacex/core/manager/launch_manager.dart';
import 'package:app_spacex/core/model/launch.dart';
import 'package:app_spacex/ui/components/image_placeholder.dart';
import 'package:flutter/material.dart';

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
  bool? isFavorite;
  late Launch launch;

  @override
  void initState() {
    launch = widget.launch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, isFavorite);
        return true;
      },
      child: FutureBuilder<List<dynamic>>(
          //future: Future.wait([DatabaseManager().isFavorite(launch.id)]),
          builder: (context, snapshot) {
        if (snapshot.hasData) {
          launch = snapshot.data?[0];
          isFavorite = snapshot.data?[1];
        }
        return Scaffold(
            appBar: AppBar(
              title: Text(launch.name ?? ''),
              actions: isFavorite != null
                  ? [
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
                    ]
                  : null,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
                          launch.links?.patch?.large ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, child, stack) {
                            return const ImagePlaceholder();
                          },
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
                        snapshot.hasData
                            ? _LaunchDetail(launch.details ?? '')
                            : Container(),
                      ],
                    ),
                  )
                ],
              ),
            ));
      }),
    );
  }
}

class _LaunchDetail extends StatelessWidget {
  final String detail;

  const _LaunchDetail(this.detail);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Detail",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(detail)
      ],
    );
  }
}
