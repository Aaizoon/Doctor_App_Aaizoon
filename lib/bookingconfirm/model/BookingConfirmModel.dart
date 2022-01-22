class BookingConfirmModel {
  bool success;
  Data data;
  String message;

  BookingConfirmModel({this.success, this.data, this.message});

  BookingConfirmModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String apptId;
  String isApproved;
  UserInfo userInfo;

  Data({this.apptId, this.isApproved, this.userInfo});

  Data.fromJson(Map<String, dynamic> json) {
    apptId = json['appt_id'];
    isApproved = json['is_approved'];
    userInfo = json['user_info'] != null ? new UserInfo.fromJson(json['user_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appt_id'] = this.apptId;
    data['is_approved'] = this.isApproved;
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo.toJson();
    }
    return data;
  }
}

class UserInfo {
  String name;
  String mobileNumber;

  UserInfo({this.name, this.mobileNumber});

  UserInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile_number'] = this.mobileNumber;
    return data;
  }
}
