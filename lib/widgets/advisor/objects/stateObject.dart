enum AdvisorCardSettings { edit_color, delete }

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
