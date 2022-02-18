import 'dart:math';

import 'package:app_spacex/core/manager/api_manager.dart';
import 'package:app_spacex/core/model/launch.dart';
import 'package:flutter/material.dart';

class LaunchManager {
  List<Launch>? _launches;

  List<Launch> get launches => _launches ?? [];

  List<Launch>? _favoriteLaunches;

  List<Launch> get favoriteLaunches => _favoriteLaunches ?? [];

  static final LaunchManager _instance = LaunchManager._internal();

  factory LaunchManager() => _instance;

  LaunchManager._internal();

  int get _launchListLength => _launches?.length ?? 0;

  /// Initialise les spots :
  /// - Via l'API pour la liste complète
  /// - Via la BDD pour les spots favoris
  Future<bool> initData() async {
    await Future.wait([loadAllUpcomingLaunches()]);
    return true;
  }

  /// Charge et renvoie la liste complète de spots
  Future<void> loadAllUpcomingLaunches() async {
    // Calling API
    try {
      var response = await ApiManager().getAllUpcomingLaunches();
      if (response.data != null) {
        _launches = List<dynamic>.from(response.data!)
            .map((json) => Launch.fromJson(json))
            .toList();
      }
    } catch (e) {
      debugPrint("Erreur : $e");
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
