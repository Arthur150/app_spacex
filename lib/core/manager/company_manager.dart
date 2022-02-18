import 'package:app_spacex/core/manager/api_manager.dart';
import 'package:app_spacex/core/model/company.dart';
import 'package:flutter/material.dart';

class CompanyManager {
  static final CompanyManager _instance = CompanyManager._internal();

  factory CompanyManager() => _instance;

  CompanyManager._internal();

  Future<Company?> getCompany() async {
    Company? company;
    try {
      var response = await ApiManager().getCompanyInfo();
      if (response.data != null) {
        company = Company.fromJson(response.data!);
      }
    } catch (e) {
      debugPrint("Erreur : $e");
    }
    return company;
  }
}
