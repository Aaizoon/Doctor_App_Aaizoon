class GivenLabTesTModel {
  Data data;
  String message;
  int status;

  GivenLabTesTModel({this.data, this.message, this.status});

  GivenLabTesTModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String doctorId;
  String userId;
  String labId;
  String testId;
  String createdAt;
  String updatedAt;
  int id;

  Data(
      {this.doctorId,
        this.userId,
        this.labId,
        this.testId,
        this.createdAt,
        this.updatedAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    userId = json['user_id'];
    labId = json['lab_id'];
    testId = json['test_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['user_id'] = this.userId;
    data['lab_id'] = this.labId;
    data['test_id'] = this.testId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}
