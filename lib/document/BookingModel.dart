class BookingModel {
  bool success;
  FilesUploaded filesUploaded;
  PatientDetail patientDetail;
  String message;
  int code;

  BookingModel({this.success, this.filesUploaded, this.patientDetail, this.message, this.code});

  BookingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    filesUploaded = json['files_uploaded'] != null ? new FilesUploaded.fromJson(json['files_uploaded']) : null;
    patientDetail = json['patient_detail'] != null ? new PatientDetail.fromJson(json['patient_detail']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.filesUploaded != null) {
      data['files_uploaded'] = this.filesUploaded.toJson();
    }
    if (this.patientDetail != null) {
      data['patient_detail'] = this.patientDetail.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class FilesUploaded {
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

  FilesUploaded({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

  FilesUploaded.fromJson(Map<String, dynamic> json) {
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
  int fileId;
  String apptId;
  String fileUploadId;
  String fileType;
  String fileName;
  String filePath;
  String createdAt;
  String updatedAt;
  String uploadedForPatientId;
  String uploadedById;
  String userId;
  String doctorId;
  String uniquePayId;
  String apptmtDate;
  String apptmtTime;
  String appointmentAt;
  String bookingFullName;
  String bookingEmail;
  String bookingMobile;
  String bookingAddress;
  String notes;
  String isEmergency;
  Null bookingFor;
  Null healthIssue;
  Null age;
  String gender;
  String total;
  String subtotal;
  String isDeleted;
  String isApproved;

  Data(
      {this.fileId,
      this.apptId,
      this.fileUploadId,
      this.fileType,
      this.fileName,
      this.filePath,
      this.createdAt,
      this.updatedAt,
      this.uploadedForPatientId,
      this.uploadedById,
      this.userId,
      this.doctorId,
      this.uniquePayId,
      this.apptmtDate,
      this.apptmtTime,
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
      this.total,
      this.subtotal,
      this.isDeleted,
      this.isApproved});

  Data.fromJson(Map<String, dynamic> json) {
    fileId = json['file_id'];
    apptId = json['appt_id'];
    fileUploadId = json['file_upload_id'];
    fileType = json['file_type'];
    fileName = json['file_name'];
    filePath = json['file_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    uploadedForPatientId = json['uploaded_for_patient_id'];
    uploadedById = json['uploaded_by_id'];
    userId = json['user_id'];
    doctorId = json['doctor_id'];
    uniquePayId = json['unique_pay_id'];
    apptmtDate = json['apptmt_date'];
    apptmtTime = json['apptmt_time'];
    appointmentAt = json['appointment_at'];
    bookingFullName = json['booking_full_name'];
    bookingEmail = json['booking_email'];
    bookingMobile = json['booking_mobile'];
    bookingAddress = json['booking_address'];
    notes = json['notes'];
    isEmergency = json['is_emergency'];
    bookingFor = json['booking_for'];
    healthIssue = json['health_issue'];
    age = json['age'];
    gender = json['gender'];
    total = json['total'];
    subtotal = json['subtotal'];
    isDeleted = json['is_deleted'];
    isApproved = json['is_approved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_id'] = this.fileId;
    data['appt_id'] = this.apptId;
    data['file_upload_id'] = this.fileUploadId;
    data['file_type'] = this.fileType;
    data['file_name'] = this.fileName;
    data['file_path'] = this.filePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['uploaded_for_patient_id'] = this.uploadedForPatientId;
    data['uploaded_by_id'] = this.uploadedById;
    data['user_id'] = this.userId;
    data['doctor_id'] = this.doctorId;
    data['unique_pay_id'] = this.uniquePayId;
    data['apptmt_date'] = this.apptmtDate;
    data['apptmt_time'] = this.apptmtTime;
    data['appointment_at'] = this.appointmentAt;
    data['booking_full_name'] = this.bookingFullName;
    data['booking_email'] = this.bookingEmail;
    data['booking_mobile'] = this.bookingMobile;
    data['booking_address'] = this.bookingAddress;
    data['notes'] = this.notes;
    data['is_emergency'] = this.isEmergency;
    data['booking_for'] = this.bookingFor;
    data['health_issue'] = this.healthIssue;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['total'] = this.total;
    data['subtotal'] = this.subtotal;
    data['is_deleted'] = this.isDeleted;
    data['is_approved'] = this.isApproved;
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
