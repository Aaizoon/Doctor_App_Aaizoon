class PatientListModel {
  AppointmentList appointmentList;
  String message;
  int code;

  PatientListModel({this.appointmentList, this.message, this.code});

  PatientListModel.fromJson(Map<String, dynamic> json) {
    appointmentList = json['appointment_list'] != null
        ? new AppointmentList.fromJson(json['appointment_list'])
        : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointmentList != null) {
      data['appointment_list'] = this.appointmentList.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class AppointmentList {
  int currentPage;
  List<Data> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  String prevPageUrl;
  int to;
  int total;

  AppointmentList(
      {this.currentPage,
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
        this.total});

  AppointmentList.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int apptId;
  String profilePic;
  int userId;
  String isEmergency;
  String age;
  String gender;
  String healthIssue;
  int doctorId;
  String apptmtDate;
  String apptmtTime;
  String bookingFullName;
  String bookingEmail;
  String bookingMobile;
  String bookingAddress;
  String notes;
  String isBooking;

  Data(
      {this.apptId,
        this.profilePic,
        this.userId,
        this.isEmergency,
        this.age,
        this.gender,
        this.healthIssue,
        this.doctorId,
        this.apptmtDate,
        this.apptmtTime,
        this.bookingFullName,
        this.bookingEmail,
        this.bookingMobile,
        this.bookingAddress,
        this.notes,
        this.isBooking});

  Data.fromJson(Map<String, dynamic> json) {
    apptId = json['appt_id'];
    profilePic = json['profile_pic'];
    userId = json['user_id'];
    isEmergency = json['is_emergency'];
    age = json['age'];
    gender = json['gender'];
    healthIssue = json['health_issue'];
    doctorId = json['doctor_id'];
    apptmtDate = json['apptmt_date'];
    apptmtTime = json['apptmt_time'];
    bookingFullName = json['booking_full_name'];
    bookingEmail = json['booking_email'];
    bookingMobile = json['booking_mobile'];
    bookingAddress = json['booking_address'];
    notes = json['notes'];
    isBooking = json['is_booking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appt_id'] = this.apptId;
    data['profile_pic'] = this.profilePic;
    data['user_id'] = this.userId;
    data['is_emergency'] = this.isEmergency;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['health_issue'] = this.healthIssue;
    data['doctor_id'] = this.doctorId;
    data['apptmt_date'] = this.apptmtDate;
    data['apptmt_time'] = this.apptmtTime;
    data['booking_full_name'] = this.bookingFullName;
    data['booking_email'] = this.bookingEmail;
    data['booking_mobile'] = this.bookingMobile;
    data['booking_address'] = this.bookingAddress;
    data['notes'] = this.notes;
    data['is_booking'] = this.isBooking;
    return data;
  }
}
