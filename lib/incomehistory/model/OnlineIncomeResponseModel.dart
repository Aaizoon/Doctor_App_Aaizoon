// To parse this JSON data, do
//
//     final getIncomeOnlineResponseModel = getIncomeOnlineResponseModelFromJson(jsonString);

import 'dart:convert';

GetIncomeOnlineResponseModel getIncomeOnlineResponseModelFromJson(String str) => GetIncomeOnlineResponseModel.fromJson(json.decode(str));

String getIncomeOnlineResponseModelToJson(GetIncomeOnlineResponseModel data) => json.encode(data.toJson());

class GetIncomeOnlineResponseModel {
  GetIncomeOnlineResponseModel({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory GetIncomeOnlineResponseModel.fromJson(Map<String, dynamic> json) => GetIncomeOnlineResponseModel(
    data: Data.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "status": status,
  };
}

class Data {
  Data({
    this.requestedYear,
    this.requestedMonth,
    this.totalEarning,
    this.appointmentList,
    this.doctorDetails,
    this.doctorProfile,
  });

  String requestedYear;
  String requestedMonth;
  String totalEarning;
  AppointmentList appointmentList;
  DoctorDetails doctorDetails;
  List<DoctorProfile> doctorProfile;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    requestedYear: json["requested_year"],
    requestedMonth: json["requested_month"],
    totalEarning: json["total_earning"],
    appointmentList: AppointmentList.fromJson(json["appointment_list"]),
    doctorDetails: DoctorDetails.fromJson(json["doctor_details"]),
    doctorProfile: List<DoctorProfile>.from(json["doctorProfile"].map((x) => DoctorProfile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "requested_year": requestedYear,
    "requested_month": requestedMonth,
    "total_earning": totalEarning,
    "appointment_list": appointmentList.toJson(),
    "doctor_details": doctorDetails.toJson(),
    "doctorProfile": List<dynamic>.from(doctorProfile.map((x) => x.toJson())),
  };
}

class AppointmentList {
  AppointmentList({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory AppointmentList.fromJson(Map<String, dynamic> json) => AppointmentList(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  Datum({
    this.id,
    this.doctorId,
    this.patientId,
    this.uniquePayId,
    this.paymentId,
    this.apptmtDate,
    this.apptmtTime,
    this.apptmtEndDate,
    this.apptmtEndTime,
    this.doctorFee,
    this.preConsultationFee,
    this.total,
    this.subtotal,
    this.bookingStatus,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.email,
    this.mobileNumber,
    this.userType,
    this.cityId,
    this.verify,
    this.isActive,
    this.docSpecialistId,
    this.isProfileComplete,
    this.deviceId,
    this.emailVerifiedFlag,
    this.emailVerifiedToken,
    this.emailVerifiedAt,
    this.mobileVerifiedFlag,
    this.mobileVerifiedToken,
    this.mobileVerifiedAt,
    this.password,
    this.rememberToken,
    this.parentId,
    this.relationshipId,
  });

  int id;
  int doctorId;
  int patientId;
  String uniquePayId;
  int paymentId;
  DateTime apptmtDate;
  String apptmtTime;
  DateTime apptmtEndDate;
  String apptmtEndTime;
  int doctorFee;
  dynamic preConsultationFee;
  int total;
  double subtotal;
  String bookingStatus;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String email;
  String mobileNumber;
  String userType;
  int cityId;
  String verify;
  String isActive;
  dynamic docSpecialistId;
  String isProfileComplete;
  String deviceId;
  int emailVerifiedFlag;
  String emailVerifiedToken;
  dynamic emailVerifiedAt;
  int mobileVerifiedFlag;
  String mobileVerifiedToken;
  dynamic mobileVerifiedAt;
  String password;
  dynamic rememberToken;
  dynamic parentId;
  dynamic relationshipId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    doctorId: json["doctor_id"],
    patientId: json["patient_id"],
    uniquePayId: json["unique_pay_id"],
    paymentId: json["payment_id"],
    apptmtDate: DateTime.parse(json["apptmt_date"]),
    apptmtTime: json["apptmt_time"],
    apptmtEndDate: DateTime.parse(json["apptmt_end_date"]),
    apptmtEndTime: json["apptmt_end_time"],
    doctorFee: json["doctor_fee"],
    preConsultationFee: json["pre_consultation_fee"],
    total: json["total"],
    subtotal: json["subtotal"].toDouble(),
    bookingStatus: json["booking_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    name: json["name"],
    email: json["email"],
    mobileNumber: json["mobile_number"],
    userType: json["user_type"],
    cityId: json["city_id"],
    verify: json["verify"],
    isActive: json["is_active"],
    docSpecialistId: json["doc_specialist_id"],
    isProfileComplete: json["is_profile_complete"],
    deviceId: json["device_id"],
    emailVerifiedFlag: json["email_verified_flag"],
    emailVerifiedToken: json["email_verified_token"],
    emailVerifiedAt: json["email_verified_at"],
    mobileVerifiedFlag: json["mobile_verified_flag"],
    mobileVerifiedToken: json["mobile_verified_token"],
    mobileVerifiedAt: json["mobile_verified_at"],
    password: json["password"],
    rememberToken: json["remember_token"],
    parentId: json["parent_id"],
    relationshipId: json["relationship_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "patient_id": patientId,
    "unique_pay_id": uniquePayId,
    "payment_id": paymentId,
    "apptmt_date": "${apptmtDate.year.toString().padLeft(4, '0')}-${apptmtDate.month.toString().padLeft(2, '0')}-${apptmtDate.day.toString().padLeft(2, '0')}",
    "apptmt_time": apptmtTime,
    "apptmt_end_date": "${apptmtEndDate.year.toString().padLeft(4, '0')}-${apptmtEndDate.month.toString().padLeft(2, '0')}-${apptmtEndDate.day.toString().padLeft(2, '0')}",
    "apptmt_end_time": apptmtEndTime,
    "doctor_fee": doctorFee,
    "pre_consultation_fee": preConsultationFee,
    "total": total,
    "subtotal": subtotal,
    "booking_status": bookingStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "name": name,
    "email": email,
    "mobile_number": mobileNumber,
    "user_type": userType,
    "city_id": cityId,
    "verify": verify,
    "is_active": isActive,
    "doc_specialist_id": docSpecialistId,
    "is_profile_complete": isProfileComplete,
    "device_id": deviceId,
    "email_verified_flag": emailVerifiedFlag,
    "email_verified_token": emailVerifiedToken,
    "email_verified_at": emailVerifiedAt,
    "mobile_verified_flag": mobileVerifiedFlag,
    "mobile_verified_token": mobileVerifiedToken,
    "mobile_verified_at": mobileVerifiedAt,
    "password": password,
    "remember_token": rememberToken,
    "parent_id": parentId,
    "relationship_id": relationshipId,
  };
}

class DoctorDetails {
  DoctorDetails({
    this.id,
    this.name,
    this.email,
    this.mobileNumber,
    this.userType,
    this.cityId,
    this.verify,
    this.isActive,
    this.docSpecialistId,
    this.isProfileComplete,
    this.deviceId,
    this.emailVerifiedFlag,
    this.emailVerifiedToken,
    this.emailVerifiedAt,
    this.mobileVerifiedFlag,
    this.mobileVerifiedToken,
    this.mobileVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.parentId,
    this.relationshipId,
  });

  int id;
  String name;
  String email;
  String mobileNumber;
  String userType;
  int cityId;
  String verify;
  String isActive;
  int docSpecialistId;
  String isProfileComplete;
  String deviceId;
  int emailVerifiedFlag;
  String emailVerifiedToken;
  dynamic emailVerifiedAt;
  int mobileVerifiedFlag;
  String mobileVerifiedToken;
  dynamic mobileVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic parentId;
  dynamic relationshipId;

  factory DoctorDetails.fromJson(Map<String, dynamic> json) => DoctorDetails(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobileNumber: json["mobile_number"],
    userType: json["user_type"],
    cityId: json["city_id"],
    verify: json["verify"],
    isActive: json["is_active"],
    docSpecialistId: json["doc_specialist_id"],
    isProfileComplete: json["is_profile_complete"],
    deviceId: json["device_id"],
    emailVerifiedFlag: json["email_verified_flag"],
    emailVerifiedToken: json["email_verified_token"],
    emailVerifiedAt: json["email_verified_at"],
    mobileVerifiedFlag: json["mobile_verified_flag"],
    mobileVerifiedToken: json["mobile_verified_token"],
    mobileVerifiedAt: json["mobile_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    parentId: json["parent_id"],
    relationshipId: json["relationship_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile_number": mobileNumber,
    "user_type": userType,
    "city_id": cityId,
    "verify": verify,
    "is_active": isActive,
    "doc_specialist_id": docSpecialistId,
    "is_profile_complete": isProfileComplete,
    "device_id": deviceId,
    "email_verified_flag": emailVerifiedFlag,
    "email_verified_token": emailVerifiedToken,
    "email_verified_at": emailVerifiedAt,
    "mobile_verified_flag": mobileVerifiedFlag,
    "mobile_verified_token": mobileVerifiedToken,
    "mobile_verified_at": mobileVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "parent_id": parentId,
    "relationship_id": relationshipId,
  };
}

class DoctorProfile {
  DoctorProfile({
    this.id,
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
    this.updatedAt,
  });

  int id;
  int userId;
  DateTime dateOfBirth;
  dynamic collegeAttended;
  String qualification;
  String address;
  String gender;
  String specialistIn;
  String doctorOnlineFee;
  int doctorFee;
  String isPreconsultation;
  dynamic preConsultationFee;
  String profilePic;
  String bed;
  dynamic noOfBed;
  String ventilator;
  String bloodBank;
  String emergency;
  String ambulance;
  dynamic ambulanceContact;
  String medicalLicense;
  String experience;
  String isVideoChat;
  int isAvlForOnlineConst;
  int onlineConsultationTime;
  DateTime createdAt;
  DateTime updatedAt;

  factory DoctorProfile.fromJson(Map<String, dynamic> json) => DoctorProfile(
    id: json["id"],
    userId: json["user_id"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    collegeAttended: json["college_attended"],
    qualification: json["qualification"],
    address: json["address"],
    gender: json["gender"],
    specialistIn: json["specialist_in"],
    doctorOnlineFee: json["doctor_online_fee"],
    doctorFee: json["doctor_fee"],
    isPreconsultation: json["is_preconsultation"],
    preConsultationFee: json["pre_consultation_fee"],
    profilePic: json["profile_pic"],
    bed: json["bed"],
    noOfBed: json["no_of_bed"],
    ventilator: json["ventilator"],
    bloodBank: json["blood_bank"],
    emergency: json["emergency"],
    ambulance: json["ambulance"],
    ambulanceContact: json["ambulance_contact"],
    medicalLicense: json["medical_license"],
    experience: json["experience"],
    isVideoChat: json["is_video_chat"],
    isAvlForOnlineConst: json["is_avl_for_online_const"],
    onlineConsultationTime: json["online_consultation_time"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "college_attended": collegeAttended,
    "qualification": qualification,
    "address": address,
    "gender": gender,
    "specialist_in": specialistIn,
    "doctor_online_fee": doctorOnlineFee,
    "doctor_fee": doctorFee,
    "is_preconsultation": isPreconsultation,
    "pre_consultation_fee": preConsultationFee,
    "profile_pic": profilePic,
    "bed": bed,
    "no_of_bed": noOfBed,
    "ventilator": ventilator,
    "blood_bank": bloodBank,
    "emergency": emergency,
    "ambulance": ambulance,
    "ambulance_contact": ambulanceContact,
    "medical_license": medicalLicense,
    "experience": experience,
    "is_video_chat": isVideoChat,
    "is_avl_for_online_const": isAvlForOnlineConst,
    "online_consultation_time": onlineConsultationTime,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
