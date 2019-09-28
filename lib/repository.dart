import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Repository {
  List<RoutinJob> routinJobs;
  static final Repository _instance = Repository._internal();

  factory Repository() {
    return _instance;
  }

  Future<String> _loadDataAsAssets() async {
    return await rootBundle.loadString('assets/routin_jobs.json');
  }

  void load() async {
    String jsonString = await _loadDataAsAssets();
    routinJobs = parseJson(jsonString);
  }

  Repository._internal() {}

  List<RoutinJob> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    var parsedList = parsed.map<RoutinJob>((json) => new RoutinJob.fromJson(json));
    return parsedList.toList();
  }
}

class RoutinJob {
  final String name;
  final List<String> predictions;

  RoutinJob({this.name, this.predictions});

  factory RoutinJob.fromJson(Map<String, dynamic> json) {
    return new RoutinJob(
      name: json['name'] as String,
      predictions: new List<String>.from(json['predictions']),
    );
  }
}
