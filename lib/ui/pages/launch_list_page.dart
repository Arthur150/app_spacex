import 'package:app_spacex/core/manager/launch_manager.dart';
import 'package:app_spacex/core/model/launch.dart';
import 'package:app_spacex/core/model/list_type.dart';
import 'package:app_spacex/ui/components/launch_list.dart';
import 'package:flutter/material.dart';

class LaunchListPage extends StatefulWidget {
  final ListType type;

  const LaunchListPage({Key? key, this.type = ListType.upcomings})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _LaunchListPageState();
}

class _LaunchListPageState extends State<LaunchListPage> {
  @override
  Widget build(BuildContext context) {
    return LaunchList(
      launches: LaunchManager().getLaunches(widget.type),
      onFavoriteChanged: (Launch launch, bool shouldToggle) async {
        if (shouldToggle) {
          await LaunchManager().toggleFavorite(launch);
        }
        setState(() {});
      },
    );
  }
}
