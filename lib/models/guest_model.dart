class GuestModel {
  GuestModel({
    required this.data,
    required this.success,
    required this.statusCode,
    required this.token,
  });
  late final Data data;
  late final bool success;
  late final int statusCode;
  late final String token;

  GuestModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    success = json['success'];
    statusCode = json['status_code'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = data.toJson();
    data['success'] = success;
    data['status_code'] = statusCode;
    data['token'] = token;
    return data;
  }
}

class Data {
  Data({
    required this.user,
    required this.guestId,
  });
  late final User user;
  late final String guestId;

  Data.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    guestId = json['guestId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user.toJson();
    data['guestId'] = guestId;
    return data;
  }
}

class User {
  User({
    required this.id,
    required this.fullname,
    required this.lastname,
    required this.avatar,
    this.countryCode,
    required this.mobile,
    this.deviceToken,
    required this.email,
    required this.dob,
    required this.empId,
    required this.gender,
    this.nationality,
    this.emiratesId,
    this.healthCard,
    this.citizenshipCard,
    required this.driverLicenseNum,
    this.emailVerifiedAt,
    required this.password,
    required this.otp,
    this.otpExpireTime,
    required this.address,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.lat,
    required this.lng,
    this.fid,
    this.gid,
    required this.isStoppedRequest,
    required this.isFbSignup,
    required this.isGmailSignup,
    required this.isManualSignup,
    required this.storeId,
    this.employeeStatusId,
    required this.signupPlatform,
    this.uniqueNo,
    this.deviceType,
  });
  late final int id;
  late final String fullname;
  late final String lastname;
  late final String avatar;
  late final Null countryCode;
  late final String mobile;
  late final Null deviceToken;
  late final String email;
  late final String dob;
  late final String empId;
  late final String gender;
  late final Null nationality;
  late final Null emiratesId;
  late final Null healthCard;
  late final Null citizenshipCard;
  late final String driverLicenseNum;
  late final Null emailVerifiedAt;
  late final String password;
  late final int otp;
  late final Null otpExpireTime;
  late final String address;
  late final String city;
  late final String state;
  late final String postalCode;
  late final String lat;
  late final String lng;
  late final Null fid;
  late final Null gid;
  late final int isStoppedRequest;
  late final int isFbSignup;
  late final int isGmailSignup;
  late final int isManualSignup;
  late final int storeId;
  late final Null employeeStatusId;
  late final int signupPlatform;
  late final Null uniqueNo;
  late final Null deviceType;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fullname = json['fullname'];
    lastname = json['lastname'];
    avatar = json['avatar'];
    countryCode = null;
    mobile = json['mobile'];
    deviceToken = null;
    email = json['email'];
    dob = json['dob'];
    empId = json['empId'];
    gender = json['gender'];
    nationality = null;
    emiratesId = null;
    healthCard = null;
    citizenshipCard = null;
    driverLicenseNum = json['driver_license_num'];
    emailVerifiedAt = null;
    password = json['password'];
    otp = json['otp'];
    otpExpireTime = null;
    address = json['address'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    lat = json['lat'];
    lng = json['lng'];
    fid = null;
    gid = null;
    isStoppedRequest = json['isStoppedRequest'];
    isFbSignup = json['is_fb_signup'];
    isGmailSignup = json['is_gmail_signup'];
    isManualSignup = json['is_manual_signup'];
    storeId = json['store_id'];
    employeeStatusId = null;
    signupPlatform = json['signup_platform'];
    uniqueNo = null;
    deviceType = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['lastname'] = lastname;
    data['avatar'] = avatar;
    data['country_code'] = countryCode;
    data['mobile'] = mobile;
    data['device_token'] = deviceToken;
    data['email'] = email;
    data['dob'] = dob;
    data['empId'] = empId;
    data['gender'] = gender;
    data['nationality'] = nationality;
    data['emirates_id'] = emiratesId;
    data['health_card'] = healthCard;
    data['citizenship_card'] = citizenshipCard;
    data['driver_license_num'] = driverLicenseNum;
    data['email_verified_at'] = emailVerifiedAt;
    data['password'] = password;
    data['otp'] = otp;
    data['otp_expire_time'] = otpExpireTime;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['postal_code'] = postalCode;
    data['lat'] = lat;
    data['lng'] = lng;
    data['fid'] = fid;
    data['gid'] = gid;
    data['isStoppedRequest'] = isStoppedRequest;
    data['is_fb_signup'] = isFbSignup;
    data['is_gmail_signup'] = isGmailSignup;
    data['is_manual_signup'] = isManualSignup;
    data['store_id'] = storeId;
    data['employee_status_id'] = employeeStatusId;
    data['signup_platform'] = signupPlatform;
    data['unique_no'] = uniqueNo;
    data['device_type'] = deviceType;
    return data;
  }
}