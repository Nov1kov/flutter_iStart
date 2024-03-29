import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Repository {
  List<RoutineJob> routineJobs;
  List<ItJob> itJobs;

  static final Repository _instance = Repository._internal();

  factory Repository() {
    return _instance;
  }

  void load() async {
    String jsonRJobsString = await rootBundle.loadString('assets/routin_jobs.json');
    routineJobs = parseRJobsToJson(jsonRJobsString);
    String jsonItJobsString = await rootBundle.loadString('assets/it_jobs.json');
    itJobs = parseIJobsToJson(jsonItJobsString);
  }

  Repository._internal() {}

  List<RoutineJob> parseRJobsToJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    var parsedList = parsed.map<RoutineJob>((json) => new RoutineJob.fromJson(json));
    return parsedList.toList();
  }

  List<ItJob> parseIJobsToJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    var parsedList = parsed.map<ItJob>((json) => new ItJob.fromJson(json));
    return parsedList.toList();
  }
}

class ItJob{
  final String name;
  final String description;
  final String salary;
  final String image;
  final String link_text;
  final List<String> links;
  int predictRate;

  ItJob({this.name, this.description, this.salary, this.image, this.link_text, this.links});

  factory ItJob.fromJson(Map<String, dynamic> json) {
    return new ItJob(
      name: json['name'] as String,
      description: json['description'] as String,
      salary: json['salary'] as String,
      image: json['image'] as String,
      link_text: json['link_text'] as String,
      links: new List<String>.from(json['links']),
    );
  }
}

class Prediction{
  final String name;
  final int rate;

  Prediction(this.name, this.rate);

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return new Prediction(
      json['name'] as String,
      json['rate'] as int,
    );
  }
}

class RoutineJob {
  final String name;
  final String image;
  final List<Prediction> predictions;

  RoutineJob({this.name, this.predictions, this.image});

  factory RoutineJob.fromJson(Map<String, dynamic> json) {
    var predictionsJson = json['predictions'];
    var mapped = predictionsJson.map<Prediction>((j) => new Prediction.fromJson(j)).toList();
    return new RoutineJob(
      name: json['name'] as String,
      image: json['image'] as String,
      predictions: mapped,
    );
  }
}
