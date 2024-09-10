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
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['success'] = success;
    _data['status_code'] = statusCode;
    _data['token'] = token;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['guestId'] = guestId;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fullname'] = fullname;
    _data['lastname'] = lastname;
    _data['avatar'] = avatar;
    _data['country_code'] = countryCode;
    _data['mobile'] = mobile;
    _data['device_token'] = deviceToken;
    _data['email'] = email;
    _data['dob'] = dob;
    _data['empId'] = empId;
    _data['gender'] = gender;
    _data['nationality'] = nationality;
    _data['emirates_id'] = emiratesId;
    _data['health_card'] = healthCard;
    _data['citizenship_card'] = citizenshipCard;
    _data['driver_license_num'] = driverLicenseNum;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['password'] = password;
    _data['otp'] = otp;
    _data['otp_expire_time'] = otpExpireTime;
    _data['address'] = address;
    _data['city'] = city;
    _data['state'] = state;
    _data['postal_code'] = postalCode;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['fid'] = fid;
    _data['gid'] = gid;
    _data['isStoppedRequest'] = isStoppedRequest;
    _data['is_fb_signup'] = isFbSignup;
    _data['is_gmail_signup'] = isGmailSignup;
    _data['is_manual_signup'] = isManualSignup;
    _data['store_id'] = storeId;
    _data['employee_status_id'] = employeeStatusId;
    _data['signup_platform'] = signupPlatform;
    _data['unique_no'] = uniqueNo;
    _data['device_type'] = deviceType;
    return _data;
  }
}