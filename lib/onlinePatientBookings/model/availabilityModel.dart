class AvailabilityModel {
  List<Data> data;
  String message;
  int status;

  AvailabilityModel({this.data, this.message, this.status});

  AvailabilityModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int id;
  int userId;
  String dateOfBirth;
  String collegeAttended;
  String qualification;
  String address;
  String gender;
  String specialistIn;
  String doctorOnlineFee;
  int doctorFee;
  String isPreconsultation;
  String preConsultationFee;
  String profilePic;
  String bed;
  String noOfBed;
  String ventilator;
  String bloodBank;
  String emergency;
  String ambulance;
  String ambulanceContact;
  String medicalLicense;
  String experience;
  String isVideoChat;
  int isAvlForOnlineConst;
  int onlineConsultationTime;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.userId,
        this.dateOfBirth,
        this.collegeAttended,
        this.qualification,
        this.address,
        this.gender,
        this.specialistIn,
        this.doctorOnlineFee,
        this.doctorFee,
        this.isPreconsultation,
        this.preConsultationFee,
        this.profilePic,
        this.bed,
        this.noOfBed,
        this.ventilator,
        this.bloodBank,
        this.emergency,
        this.ambulance,
        this.ambulanceContact,
        this.medicalLicense,
        this.experience,
        this.isVideoChat,
        this.isAvlForOnlineConst,
        this.onlineConsultationTime,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    dateOfBirth = json['date_of_birth'];
    collegeAttended = json['college_attended'];
    qualification = json['qualification'];
    address = json['address'];
    gender = json['gender'];
    specialistIn = json['specialist_in'];
    doctorOnlineFee = json['doctor_online_fee'];
    doctorFee = json['doctor_fee'];
    isPreconsultation = json['is_preconsultation'];
    preConsultationFee = json['pre_consultation_fee'];
    profilePic = json['profile_pic'];
    bed = json['bed'];
    noOfBed = json['no_of_bed'];
    ventilator = json['ventilator'];
    bloodBank = json['blood_bank'];
    emergency = json['emergency'];
    ambulance = json['ambulance'];
    ambulanceContact = json['ambulance_contact'];
    medicalLicense = json['medical_license'];
    experience = json['experience'];
    isVideoChat = json['is_video_chat'];
    isAvlForOnlineConst = json['is_avl_for_online_const'];
    onlineConsultationTime = json['online_consultation_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['date_of_birth'] = this.dateOfBirth;
    data['college_attended'] = this.collegeAttended;
    data['qualification'] = this.qualification;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['specialist_in'] = this.specialistIn;
    data['doctor_online_fee'] = this.doctorOnlineFee;
    data['doctor_fee'] = this.doctorFee;
    data['is_preconsultation'] = this.isPreconsultation;
    data['pre_consultation_fee'] = this.preConsultationFee;
    data['profile_pic'] = this.profilePic;
    data['bed'] = this.bed;
    data['no_of_bed'] = this.noOfBed;
    data['ventilator'] = this.ventilator;
    data['blood_bank'] = this.bloodBank;
    data['emergency'] = this.emergency;
    data['ambulance'] = this.ambulance;
    data['ambulance_contact'] = this.ambulanceContact;
    data['medical_license'] = this.medicalLicense;
    data['experience'] = this.experience;
    data['is_video_chat'] = this.isVideoChat;
    data['is_avl_for_online_const'] = this.isAvlForOnlineConst;
    data['online_consultation_time'] = this.onlineConsultationTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
