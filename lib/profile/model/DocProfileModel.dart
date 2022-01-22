class DocProfileModel {
  Data data;
  String message;
  String success;

  DocProfileModel({this.data, this.message, this.success});

  DocProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  List<ProfileDetail> profileDetail;
  List<Clinic> clinic;

  Data({this.profileDetail, this.clinic});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['profile_detail'] != null) {
      profileDetail = new List<ProfileDetail>();
      json['profile_detail'].forEach((v) {
        profileDetail.add(new ProfileDetail.fromJson(v));
      });
    }
    if (json['clinic'] != null) {
      clinic = new List<Clinic>();
      json['clinic'].forEach((v) {
        clinic.add(new Clinic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profileDetail != null) {
      data['profile_detail'] =
          this.profileDetail.map((v) => v.toJson()).toList();
    }
    if (this.clinic != null) {
      data['clinic'] = this.clinic.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileDetail {
  int id;
  String name;
  String email;
  String mobileNumber;
  String isActive;
  String profilePic;
  Null collegeAttended;
  String dateOfBirth;
  String qualification;
  String address;
  String specialistIn;
  int doctorFee;
  String doctorOnlineFee;
  String isPreconsultation;
  Null preConsultationFee;
  String bed;
  Null noOfBed;
  String ventilator;
  String bloodBank;
  String emergency;
  String ambulance;
  Null ambulanceContact;
  String medicalLicense;
  String experience;
  String isVideoChat;

  ProfileDetail(
      {this.id,
        this.name,
        this.email,
        this.mobileNumber,
        this.isActive,
        this.profilePic,
        this.collegeAttended,
        this.dateOfBirth,
        this.qualification,
        this.address,
        this.specialistIn,
        this.doctorFee,
        this.doctorOnlineFee,
        this.isPreconsultation,
        this.preConsultationFee,
        this.bed,
        this.noOfBed,
        this.ventilator,
        this.bloodBank,
        this.emergency,
        this.ambulance,
        this.ambulanceContact,
        this.medicalLicense,
        this.experience,
        this.isVideoChat});

  ProfileDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    isActive = json['is_active'];
    profilePic = json['profile_pic'];
    collegeAttended = json['college_attended'];
    dateOfBirth = json['date_of_birth'];
    qualification = json['qualification'];
    address = json['address'];
    specialistIn = json['specialist_in'];
    doctorFee = json['doctor_fee'];
    doctorOnlineFee = json['doctor_online_fee'];
    isPreconsultation = json['is_preconsultation'];
    preConsultationFee = json['pre_consultation_fee'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['is_active'] = this.isActive;
    data['profile_pic'] = this.profilePic;
    data['college_attended'] = this.collegeAttended;
    data['date_of_birth'] = this.dateOfBirth;
    data['qualification'] = this.qualification;
    data['address'] = this.address;
    data['specialist_in'] = this.specialistIn;
    data['doctor_fee'] = this.doctorFee;
    data['doctor_online_fee'] = this.doctorOnlineFee;
    data['is_preconsultation'] = this.isPreconsultation;
    data['pre_consultation_fee'] = this.preConsultationFee;
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
    return data;
  }
}

class Clinic {
  int id;
  String clinicName;
  String clinicAddress;
  Null pinCode;
  List<Availability> availability;

  Clinic(
      {this.id,
        this.clinicName,
        this.clinicAddress,
        this.pinCode,
        this.availability});

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicName = json['clinic_name'];
    clinicAddress = json['clinic_address'];
    pinCode = json['pin_code'];
    if (json['availability'] != null) {
      availability = new List<Availability>();
      json['availability'].forEach((v) {
        availability.add(new Availability.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clinic_name'] = this.clinicName;
    data['clinic_address'] = this.clinicAddress;
    data['pin_code'] = this.pinCode;
    if (this.availability != null) {
      data['availability'] = this.availability.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Availability {
  int id;
  int doctorId;
  int clinicId;
  String dayWeek;
  String consultationDuration;
  String morningSlot;
  String eveningSlot;

  Availability(
      {this.id,
        this.doctorId,
        this.clinicId,
        this.dayWeek,
        this.consultationDuration,
        this.morningSlot,
        this.eveningSlot});

  Availability.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    clinicId = json['clinic_id'];
    dayWeek = json['day_week'];
    consultationDuration = json['consultation_duration'];
    morningSlot = json['morningSlot'];
    eveningSlot = json['eveningSlot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['clinic_id'] = this.clinicId;
    data['day_week'] = this.dayWeek;
    data['consultation_duration'] = this.consultationDuration;
    data['morningSlot'] = this.morningSlot;
    data['eveningSlot'] = this.eveningSlot;
    return data;
  }
}
