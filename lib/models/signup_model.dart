class SignUpModel {
  Data? data;
  int? statusCode;
  bool? success;
  String? token;

  SignUpModel({this.data, this.statusCode, this.success, this.token});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    statusCode = json['status_code'];
    success = json['success'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status_code'] = this.statusCode;
    data['success'] = this.success;
    data['token'] = this.token;
    return data;
  }
}

class Data {
  String? address;
  String? avatar;
  dynamic citizenshipCard;
  String? city;
  dynamic countryCode;
  dynamic deviceToken;
  dynamic deviceType;
  String? dob;
  String? driverLicenseNum;
  String? email;
  dynamic emailVerifiedAt;
  dynamic emiratesId;
  String? empId;
  dynamic employeeStatusId;
  dynamic fid;
  String? fullname;
  dynamic gender;
  dynamic gid;
  dynamic healthCard;
  int? id;
  int? isFbSignup;
  int? isGmailSignup;
  int? isManualSignup;
  int? isStoppedRequest;
  String? lastname;
  String? lat;
  String? lng;
  String? mobile;
  dynamic nationality;
  int? otp;
  dynamic otpExpireTime;
  String? password;
  String? postalCode;
  int? signupPlatform;
  String? state;
  dynamic storeId;
  dynamic uniqueNo;

  Data(
      {this.address,
        this.avatar,
        this.citizenshipCard,
        this.city,
        this.countryCode,
        this.deviceToken,
        this.deviceType,
        this.dob,
        this.driverLicenseNum,
        this.email,
        this.emailVerifiedAt,
        this.emiratesId,
        this.empId,
        this.employeeStatusId,
        this.fid,
        this.fullname,
        this.gender,
        this.gid,
        this.healthCard,
        this.id,
        this.isFbSignup,
        this.isGmailSignup,
        this.isManualSignup,
        this.isStoppedRequest,
        this.lastname,
        this.lat,
        this.lng,
        this.mobile,
        this.nationality,
        this.otp,
        this.otpExpireTime,
        this.password,
        this.postalCode,
        this.signupPlatform,
        this.state,
        this.storeId,
        this.uniqueNo});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    avatar = json['avatar'];
    citizenshipCard = json['citizenship_card'];
    city = json['city'];
    countryCode = json['country_code'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
    dob = json['dob'];
    driverLicenseNum = json['driver_license_num'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    emiratesId = json['emirates_id'];
    empId = json['empId'];
    employeeStatusId = json['employee_status_id'];
    fid = json['fid'];
    fullname = json['fullname'];
    gender = json['gender'];
    gid = json['gid'];
    healthCard = json['health_card'];
    id = json['id'];
    isFbSignup = json['is_fb_signup'];
    isGmailSignup = json['is_gmail_signup'];
    isManualSignup = json['is_manual_signup'];
    isStoppedRequest = json['isStoppedRequest'];
    lastname = json['lastname'];
    lat = json['lat'];
    lng = json['lng'];
    mobile = json['mobile'];
    nationality = json['nationality'];
    otp = json['otp'];
    otpExpireTime = json['otp_expire_time'];
    password = json['password'];
    postalCode = json['postal_code'];
    signupPlatform = json['signup_platform'];
    state = json['state'];
    storeId = json['store_id'];
    uniqueNo = json['unique_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['avatar'] = avatar;
    data['citizenship_card'] = citizenshipCard;
    data['city'] = city;
    data['country_code'] = countryCode;
    data['device_token'] = deviceToken;
    data['device_type'] = deviceType;
    data['dob'] = dob;
    data['driver_license_num'] = driverLicenseNum;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['emirates_id'] = emiratesId;
    data['empId'] = empId;
    data['employee_status_id'] = employeeStatusId;
    data['fid'] = fid;
    data['fullname'] = fullname;
    data['gender'] = gender;
    data['gid'] = gid;
    data['health_card'] = healthCard;
    data['id'] = id;
    data['is_fb_signup'] = isFbSignup;
    data['is_gmail_signup'] = isGmailSignup;
    data['is_manual_signup'] = isManualSignup;
    data['isStoppedRequest'] = isStoppedRequest;
    data['lastname'] = lastname;
    data['lat'] = lat;
    data['lng'] = lng;
    data['mobile'] = mobile;
    data['nationality'] = nationality;
    data['otp'] = otp;
    data['otp_expire_time'] = otpExpireTime;
    data['password'] = password;
    data['postal_code'] = postalCode;
    data['signup_platform'] = signupPlatform;
    data['state'] = state;
    data['store_id'] = storeId;
    data['unique_no'] = uniqueNo;
    return data;
  }
}
