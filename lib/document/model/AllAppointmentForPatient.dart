class AllAppointmentForPatient {
  bool success;
  AllAppointments allAppointments;
  PatientDetail patientDetail;
  String message;
  int code;

  AllAppointmentForPatient({this.success, this.allAppointments, this.patientDetail, this.message, this.code});

  AllAppointmentForPatient.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    allAppointments = json['all_appointments'] != null ? new AllAppointments.fromJson(json['all_appointments']) : null;
    patientDetail = json['patient_detail'] != null ? new PatientDetail.fromJson(json['patient_detail']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.allAppointments != null) {
      data['all_appointments'] = this.allAppointments.toJson();
    }
    if (this.patientDetail != null) {
      data['patient_detail'] = this.patientDetail.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class AllAppointments {
  int currentPage;
  List<Data> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  AllAppointments({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

  AllAppointments.fromJson(Map<String, dynamic> json) {
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
  String doctorName;
  String userId;
  Null bookingFor;
  String doctorId;
  String apptmtDate;
  String apptmtTime;
  String patientName;
  String patientEmail;
  String patientMobileNumber;
  Null healthIssue;
  String gender;
  String total;
  String subtotal;

  Data(
      {this.apptId,
      this.doctorName,
      this.userId,
      this.bookingFor,
      this.doctorId,
      this.apptmtDate,
      this.apptmtTime,
      this.patientName,
      this.patientEmail,
      this.patientMobileNumber,
      this.healthIssue,
      this.gender,
      this.total,
      this.subtotal});

  Data.fromJson(Map<String, dynamic> json) {
    apptId = json['appt_id'];
    doctorName = json['doctor_name'];
    userId = json['user_id'];
    bookingFor = json['booking_for'];
    doctorId = json['doctor_id'];
    apptmtDate = json['apptmt_date'];
    apptmtTime = json['apptmt_time'];
    patientName = json['patient_name'];
    patientEmail = json['patient_email'];
    patientMobileNumber = json['patient_mobile_number'];
    healthIssue = json['health_issue'];
    gender = json['gender'];
    total = json['total'];
    subtotal = json['subtotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appt_id'] = this.apptId;
    data['doctor_name'] = this.doctorName;
    data['user_id'] = this.userId;
    data['booking_for'] = this.bookingFor;
    data['doctor_id'] = this.doctorId;
    data['apptmt_date'] = this.apptmtDate;
    data['apptmt_time'] = this.apptmtTime;
    data['patient_name'] = this.patientName;
    data['patient_email'] = this.patientEmail;
    data['patient_mobile_number'] = this.patientMobileNumber;
    data['health_issue'] = this.healthIssue;
    data['gender'] = this.gender;
    data['total'] = this.total;
    data['subtotal'] = this.subtotal;
    return data;
  }
}

class PatientDetail {
  int userId;
  String userName;
  Null userMobileNum;

  PatientDetail({this.userId, this.userName, this.userMobileNum});

  PatientDetail.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userMobileNum = json['user_mobile_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_mobile_num'] = this.userMobileNum;
    return data;
  }
}
