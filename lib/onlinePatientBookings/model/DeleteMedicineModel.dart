class DeleteMedicineModel {
  Data data;
  String message;
  int status;

  DeleteMedicineModel({this.data, this.message, this.status});

  DeleteMedicineModel.fromJson(Map<String, dynamic> json) {
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
  DoctorDetails doctorDetails;
  PatientDetails patientDetails;

  Data({this.doctorDetails, this.patientDetails});

  Data.fromJson(Map<String, dynamic> json) {
    doctorDetails = json['doctor_details'] != null
        ? new DoctorDetails.fromJson(json['doctor_details'])
        : null;
    patientDetails = json['patient_details'] != null
        ? new PatientDetails.fromJson(json['patient_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctorDetails != null) {
      data['doctor_details'] = this.doctorDetails.toJson();
    }
    if (this.patientDetails != null) {
      data['patient_details'] = this.patientDetails.toJson();
    }
    return data;
  }
}

class DoctorDetails {
  int id;
  String name;
  String email;
  String mobileNumber;
  String isActive;
  String profilePic;
  String collegeAttended;
  String dateOfBirth;
  String qualification;
  String address;
  String specialistIn;
  int doctorFee;
  String doctorOnlineFee;
  String isPreconsultation;
  String preConsultationFee;
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

  DoctorDetails(
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

  DoctorDetails.fromJson(Map<String, dynamic> json) {
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

class PatientDetails {
  int id;
  String name;
  String email;
  String mobileNumber;
  String isActive;
  String profilePic;
  String age;
  String gender;
  String dateOfBirth;
  String emergencyMobile;
  String address;
  String occupation;
  String bloodDonar;
  String bloodGroup;
  String height;
  String weight;
  String disability;
  String elergies;
  String dailyMedicine;
  String chronicDesease;
  String surgeries;
  String heartProblem;
  String smoking;
  String tobacco;
  String gym;
  String alcohol;
  String drugs;

  PatientDetails(
      {this.id,
        this.name,
        this.email,
        this.mobileNumber,
        this.isActive,
        this.profilePic,
        this.age,
        this.gender,
        this.dateOfBirth,
        this.emergencyMobile,
        this.address,
        this.occupation,
        this.bloodDonar,
        this.bloodGroup,
        this.height,
        this.weight,
        this.disability,
        this.elergies,
        this.dailyMedicine,
        this.chronicDesease,
        this.surgeries,
        this.heartProblem,
        this.smoking,
        this.tobacco,
        this.gym,
        this.alcohol,
        this.drugs});

  PatientDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    isActive = json['is_active'];
    profilePic = json['profile_pic'];
    age = json['age'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    emergencyMobile = json['emergency_mobile'];
    address = json['address'];
    occupation = json['occupation'];
    bloodDonar = json['blood_donar'];
    bloodGroup = json['blood_group'];
    height = json['height'];
    weight = json['weight'];
    disability = json['disability'];
    elergies = json['elergies'];
    dailyMedicine = json['daily_medicine'];
    chronicDesease = json['chronic_desease'];
    surgeries = json['surgeries'];
    heartProblem = json['heart_problem'];
    smoking = json['smoking'];
    tobacco = json['tobacco'];
    gym = json['gym'];
    alcohol = json['alcohol'];
    drugs = json['drugs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['is_active'] = this.isActive;
    data['profile_pic'] = this.profilePic;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['emergency_mobile'] = this.emergencyMobile;
    data['address'] = this.address;
    data['occupation'] = this.occupation;
    data['blood_donar'] = this.bloodDonar;
    data['blood_group'] = this.bloodGroup;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['disability'] = this.disability;
    data['elergies'] = this.elergies;
    data['daily_medicine'] = this.dailyMedicine;
    data['chronic_desease'] = this.chronicDesease;
    data['surgeries'] = this.surgeries;
    data['heart_problem'] = this.heartProblem;
    data['smoking'] = this.smoking;
    data['tobacco'] = this.tobacco;
    data['gym'] = this.gym;
    data['alcohol'] = this.alcohol;
    data['drugs'] = this.drugs;
    return data;
  }
}
