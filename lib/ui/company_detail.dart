import 'package:app_spacex/core/model/company.dart';
import 'package:flutter/material.dart';

class CompanyDetailArguments {
  Company company;

  CompanyDetailArguments({required this.company});
}

class CompanyDetail extends StatefulWidget {
  static const route = "/company";

  final Company company;

  const CompanyDetail(this.company, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail> {
  bool? isFavorite;
  late Company company;

  @override
  void initState() {
    company = widget.company;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, isFavorite);
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(company.name ?? ''),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        company.name ?? '',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("${company.summary}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Founder : ${company.founder}"),
                      const SizedBox(
                        height: 12,
                      ),
                      Text("Founded : ${company.founded ?? "unknown"}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("CEO : ${company.ceo ?? "unknown"}"),
                      const SizedBox(
                        height: 12,
                      ),
                      Text("CTO : ${company.cto ?? "unknown"}"),
                      const SizedBox(
                        height: 12,
                      ),
                      Text("COO : ${company.coo ?? "unknown"}"),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                          "CTO Propulsion : ${company.ctoPropulsion ?? "unknown"}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Employees : ${company.employees ?? "unknown"}"),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                          "Launch sites : ${company.launchSites ?? "unknown"}"),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
