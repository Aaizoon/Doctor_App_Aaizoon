class UpdateFindingsModel {
  Data data;
  String message;
  int status;

  UpdateFindingsModel({this.data, this.message, this.status});

  UpdateFindingsModel.fromJson(Map<String, dynamic> json) {
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
  String bloodPressure;
  String oxygenSaturation;
  String bodyTemp;
  String weight;
  String otherFinding;
  String followUpDate;
  String refferedDoctor;
  String createdAt;
  String updatedAt;
  int id;

  Data(
      {this.doctorId,
        this.userId,
        this.bloodPressure,
        this.oxygenSaturation,
        this.bodyTemp,
        this.weight,
        this.otherFinding,
        this.followUpDate,
        this.refferedDoctor,
        this.createdAt,
        this.updatedAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    userId = json['user_id'];
    bloodPressure = json['blood_pressure'];
    oxygenSaturation = json['oxygen_saturation'];
    bodyTemp = json['body_temp'];
    weight = json['weight'];
    otherFinding = json['other_finding'];
    followUpDate = json['follow_up_date'];
    refferedDoctor = json['reffered_doctor'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['user_id'] = this.userId;
    data['blood_pressure'] = this.bloodPressure;
    data['oxygen_saturation'] = this.oxygenSaturation;
    data['body_temp'] = this.bodyTemp;
    data['weight'] = this.weight;
    data['other_finding'] = this.otherFinding;
    data['follow_up_date'] = this.followUpDate;
    data['reffered_doctor'] = this.refferedDoctor;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}
