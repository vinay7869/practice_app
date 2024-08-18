class TaskModel {
  int? id;
  String? task;
  int? status;

  TaskModel({this.id, this.task, this.status});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    task = json['task'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task'] = task;
    data['status'] = status;
    return data;
  }
}
