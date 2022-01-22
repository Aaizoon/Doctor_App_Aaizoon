class VerifyMobileModel {
  Success success;
  String message;
  int status;

  VerifyMobileModel({this.success, this.message, this.status});

  VerifyMobileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] != null ? new Success.fromJson(json['success']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Success {
  int id;
  String name;
  String email;
  String mobileNumber;
  String userType;
  String isActive;
  String isProfileComplete;
  Null deviceId;
  String emailVerifiedFlag;
  String emailVerifiedToken;
  Null emailVerifiedAt;
  String mobileVerifiedFlag;
  String mobileVerifiedToken;
  String mobileVerifiedAt;
  String createdAt;
  String updatedAt;
  Null vendorId;

  Success(
      {this.id,
      this.name,
      this.email,
      this.mobileNumber,
      this.userType,
      this.isActive,
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
      this.vendorId});

  Success.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    userType = json['user_type'];
    isActive = json['is_active'];
    isProfileComplete = json['is_profile_complete'];
    deviceId = json['device_id'];
    emailVerifiedFlag = json['email_verified_flag'];
    emailVerifiedToken = json['email_verified_token'];
    emailVerifiedAt = json['email_verified_at'];
    mobileVerifiedFlag = json['mobile_verified_flag'];
    mobileVerifiedToken = json['mobile_verified_token'];
    mobileVerifiedAt = json['mobile_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    vendorId = json['vendor_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['user_type'] = this.userType;
    data['is_active'] = this.isActive;
    data['is_profile_complete'] = this.isProfileComplete;
    data['device_id'] = this.deviceId;
    data['email_verified_flag'] = this.emailVerifiedFlag;
    data['email_verified_token'] = this.emailVerifiedToken;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['mobile_verified_flag'] = this.mobileVerifiedFlag;
    data['mobile_verified_token'] = this.mobileVerifiedToken;
    data['mobile_verified_at'] = this.mobileVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['vendor_id'] = this.vendorId;
    return data;
  }
}
