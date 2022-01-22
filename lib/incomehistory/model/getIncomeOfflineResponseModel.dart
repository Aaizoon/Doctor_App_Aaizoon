// To parse this JSON data, do
//
//     final getIncomeOfflineResponseModel = getIncomeOfflineResponseModelFromJson(jsonString);

import 'dart:convert';

GetIncomeOfflineResponseModel getIncomeOfflineResponseModelFromJson(String str) => GetIncomeOfflineResponseModel.fromJson(json.decode(str));

String getIncomeOfflineResponseModelToJson(GetIncomeOfflineResponseModel data) => json.encode(data.toJson());

class GetIncomeOfflineResponseModel {
  GetIncomeOfflineResponseModel({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory GetIncomeOfflineResponseModel.fromJson(Map<String, dynamic> json) => GetIncomeOfflineResponseModel(
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
  });

  String requestedYear;
  String requestedMonth;
  String totalEarning;
  AppointmentList appointmentList;
  DoctorDetails doctorDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    requestedYear: json["requested_year"],
    requestedMonth: json["requested_month"],
    totalEarning: json["total_earning"],
    appointmentList: AppointmentList.fromJson(json["appointment_list"]),
    doctorDetails: DoctorDetails.fromJson(json["doctor_details"]),
  );

  Map<String, dynamic> toJson() => {
    "requested_year": requestedYear,
    "requested_month": requestedMonth,
    "total_earning": totalEarning,
    "appointment_list": appointmentList.toJson(),
    "doctor_details": doctorDetails.toJson(),
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
    this.apptId,
    this.userId,
    this.doctorId,
    this.uniquePayId,
    this.paymentId,
    this.apptmtDate,
    this.apptmtTime,
    this.apptmtEndDate,
    this.apptmtEndTime,
    this.appointmentAt,
    this.bookingFullName,
    this.bookingEmail,
    this.bookingMobile,
    this.bookingAddress,
    this.notes,
    this.isEmergency,
    this.bookingFor,
    this.healthIssue,
    this.age,
    this.gender,
    this.doctorFee,
    this.preConsultationFee,
    this.total,
    this.subtotal,
    this.isDeleted,
    this.isApproved,
    this.bookingStatus,
    this.createdAt,
    this.updatedAt,
  });

  int apptId;
  int userId;
  int doctorId;
  String uniquePayId;
  int paymentId;
  DateTime apptmtDate;
  String apptmtTime;
  DateTime apptmtEndDate;
  String apptmtEndTime;
  dynamic appointmentAt;
  String bookingFullName;
  String bookingEmail;
  String bookingMobile;
  String bookingAddress;
  String notes;
  String isEmergency;
  dynamic bookingFor;
  String healthIssue;
  String age;
  String gender;
  int doctorFee;
  dynamic preConsultationFee;
  int total;
  int subtotal;
  String isDeleted;
  String isApproved;
  String bookingStatus;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    apptId: json["appt_id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    uniquePayId: json["unique_pay_id"],
    paymentId: json["payment_id"],
    apptmtDate: DateTime.parse(json["apptmt_date"]),
    apptmtTime: json["apptmt_time"],
    apptmtEndDate: DateTime.parse(json["apptmt_end_date"]),
    apptmtEndTime: json["apptmt_end_time"],
    appointmentAt: json["appointment_at"],
    bookingFullName: json["booking_full_name"],
    bookingEmail: json["booking_email"],
    bookingMobile: json["booking_mobile"],
    bookingAddress: json["booking_address"],
    notes: json["notes"],
    isEmergency: json["is_emergency"],
    bookingFor: json["booking_for"],
    healthIssue: json["health_issue"],
    age: json["age"] == null ? null : json["age"],
    gender: json["gender"],
    doctorFee: json["doctor_fee"],
    preConsultationFee: json["pre_consultation_fee"],
    total: json["total"],
    subtotal: json["subtotal"],
    isDeleted: json["is_deleted"],
    isApproved: json["is_approved"],
    bookingStatus: json["booking_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "appt_id": apptId,
    "user_id": userId,
    "doctor_id": doctorId,
    "unique_pay_id": uniquePayId,
    "payment_id": paymentId,
    "apptmt_date": "${apptmtDate.year.toString().padLeft(4, '0')}-${apptmtDate.month.toString().padLeft(2, '0')}-${apptmtDate.day.toString().padLeft(2, '0')}",
    "apptmt_time": apptmtTime,
    "apptmt_end_date": "${apptmtEndDate.year.toString().padLeft(4, '0')}-${apptmtEndDate.month.toString().padLeft(2, '0')}-${apptmtEndDate.day.toString().padLeft(2, '0')}",
    "apptmt_end_time": apptmtEndTime,
    "appointment_at": appointmentAt,
    "booking_full_name": bookingFullName,
    "booking_email": bookingEmail,
    "booking_mobile": bookingMobile,
    "booking_address": bookingAddress,
    "notes": notes,
    "is_emergency": isEmergency,
    "booking_for": bookingFor,
    "health_issue": healthIssue,
    "age": age == null ? null : age,
    "gender": gender,
    "doctor_fee": doctorFee,
    "pre_consultation_fee": preConsultationFee,
    "total": total,
    "subtotal": subtotal,
    "is_deleted": isDeleted,
    "is_approved": isApproved,
    "booking_status": bookingStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
  dynamic emailVerifiedToken;
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
