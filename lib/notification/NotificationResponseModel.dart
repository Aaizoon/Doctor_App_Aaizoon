class NotificationResponseModel {
  List<Notifications> notifications;
  bool success;
  String message;
  int code;

  NotificationResponseModel({this.notifications, this.success, this.message, this.code});

  NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = new List<Notifications>();
      json['notifications'].forEach((v) {
        notifications.add(new Notifications.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notifications != null) {
      data['notifications'] = this.notifications.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class Notifications {
  int id;
  String message;
  String sentAt;

  Notifications({this.id, this.message, this.sentAt});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    sentAt = json['sent_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['sent_at'] = this.sentAt;
    return data;
  }
}
