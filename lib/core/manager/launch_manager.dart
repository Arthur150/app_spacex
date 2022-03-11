import 'dart:math';

import 'package:app_spacex/core/manager/api_manager.dart';
import 'package:app_spacex/core/manager/database_manager.dart';
import 'package:app_spacex/core/model/launch.dart';
import 'package:app_spacex/core/model/list_type.dart';
import 'package:flutter/material.dart';

class LaunchManager {
  List<Launch>? _upcomingLaunches;

  List<Launch> get upcomingLaunches => _upcomingLaunches ?? [];

  List<Launch>? _pastLaunches;

  List<Launch> get pastLaunches => _pastLaunches ?? [];

  List<Launch>? _favoriteLaunches;

  List<Launch> get favoriteLaunches => _favoriteLaunches ?? [];

  static final LaunchManager _instance = LaunchManager._internal();

  factory LaunchManager() => _instance;

  LaunchManager._internal();

  Future<bool> initData() async {
    await Future.wait([loadAllUpcomingLaunches()]);
    await Future.wait([loadAllPastLaunches()]);
    return true;
  }

  Future<void> loadAllUpcomingLaunches() async {
    try {
      var response = await ApiManager().getAllUpcomingLaunches();
      if (response.data != null) {
        _upcomingLaunches = List<dynamic>.from(response.data!)
            .map((json) => Launch.fromJson(json))
            .toList();
      }
    } catch (e) {
      debugPrint("Erreur : $e");
    }
  }

  Future<void> loadAllPastLaunches() async {
    try {
      var response = await ApiManager().getAllPastLaunches();
      if (response.data != null) {
        _pastLaunches = List<dynamic>.from(response.data!)
            .map((json) => Launch.fromJson(json))
            .toList();
      }
    } catch (e) {
      debugPrint("Erreur : $e");
    }
  }

  List<Launch> getLaunches(ListType type) {
    switch (type) {
      case ListType.upcomings:
        return upcomingLaunches;
      case ListType.previous:
        return pastLaunches;
      default:
        List<Launch> launches = [];
        return launches;
    }
  }

  bool isLaunchFavorite(String launchId) {
    try {
      return _favoriteLaunches?.firstWhere((launch) => launch.id == launchId) !=
          null;
    } catch (e) {
      // Launch not found
      return false;
    }
  }

  Future<void> toggleFavorite(Launch launchToUpdate) async {
    /*bool isFavorite = await DatabaseManager().isFavorite(launchToUpdate.id);
    await DatabaseManager().toggleFavorite(isFavorite, launchToUpdate);
    if (isFavorite) {
      _favoriteLaunches
          ?.removeWhere((Launch launch) => launch.id == launchToUpdate.id);
    } else {
      _favoriteLaunches ??= [];
      _favoriteLaunches?.add(launchToUpdate);
    }*/
  }
}
