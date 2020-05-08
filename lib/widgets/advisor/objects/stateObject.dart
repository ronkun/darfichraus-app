import 'package:crimsy/widgets/advisor/objects/colorChoice.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum AdvisorCardSettings { edit_color, delete }

class AdvisorCardObject {
  String uuid;
  int sortID;
  String title;
  Color color;
  LinearGradient gradient;
  IconData icon;
  Map<DateTime, List<TaskObject>> tasks;
  List<Image> crisisRestrictionsIcons;

  AdvisorCardObject(String title, IconData icon) {
    this.title = title;
    this.icon = icon;
    // ColorChoice choice = ColorChoices.choices[Random().nextInt(ColorChoices.choices.length)];
    ColorChoice choice = ColorChoices.choices[2];
    this.color = choice.primary;
    this.gradient = LinearGradient(colors: choice.gradient, begin: Alignment.bottomCenter, end: Alignment.topCenter);
    tasks = Map<DateTime, List<TaskObject>>();
    this.uuid = Uuid().v1();
    this.crisisRestrictionsIcons = crisisRestrictionsIcons; 
  }

  AdvisorCardObject.import(String uuidS, String title, int sortID, ColorChoice color, IconData icon, Map<DateTime, List<TaskObject>> tasks) {
    this.sortID = sortID;
    this.title = title;
    this.color = color.primary;
    this.gradient = LinearGradient(colors: color.gradient, begin: Alignment.bottomCenter, end: Alignment.topCenter);
    this.icon = icon;
    this.tasks = tasks;
    this.uuid = uuidS;
  }

  

  int taskAmount() {
    int amount = 0;
    tasks.values.forEach((list) {
      amount += list.length;
    });
    return amount;
  }

  //List<TaskObject> tasks;

  double percentComplete() {
    if (tasks.isEmpty) {
      return 1.0;
    }
    int completed = 0;
    int amount = 0;
    tasks.values.forEach((list) {
      amount += list.length;
      list.forEach((task) {
        if (task.isCompleted()) {
          completed++;
        }
      });
    });
    return completed / amount;
  }
}

class TaskObject {
  DateTime date;
  String task;
  bool _completed;

  TaskObject(String task, DateTime date) {
    this.task = task;
    this.date = date;
    this._completed = false;
  }

  TaskObject.import(String task, DateTime date, bool completed) {
    this.task = task;
    this.date = date;
    this._completed = completed;
  }

  void setComplete(bool value) {
    _completed = value;
  }

  isCompleted() => _completed;
}
