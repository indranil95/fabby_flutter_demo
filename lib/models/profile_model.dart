import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  List<Datum>? data;
  bool? success;
  int? error;
  String? statusCode;

  ProfileModel({
    this.data,
    this.success,
    this.error,
    this.statusCode,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    success: json["success"],
    error: json["error"],
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
    "error": error,
    "status_code": statusCode,
  };
}

class Datum {
  int? id;
  String? fullname;
  String? lastname;
  String? avatar;
  String? countryCode;
  String? mobile;
  String? deviceToken;
  String? email;
  String? dob;
  String? empId;
  String? gender;
  String? nationality;
  String? emiratesId;
  String? healthCard;
  String? citizenshipCard;
  String? driverLicenseNum;
  DateTime? emailVerifiedAt;
  String? password;
  int? otp;
  dynamic otpExpireTime;
  String? address;
  String? city;
  String? state;
  String? postalCode;
  String? lat;
  String? lng;
  dynamic fid;
  String? gid;
  int? isStoppedRequest;
  int? isFbSignup;
  int? isGmailSignup;
  int? isManualSignup;
  dynamic storeId;
  dynamic employeeStatusId;
  int? signupPlatform;
  int? uniqueNo;
  dynamic deviceType;

  Datum({
    this.id,
    this.fullname,
    this.lastname,
    this.avatar,
    this.countryCode,
    this.mobile,
    this.deviceToken,
    this.email,
    this.dob,
    this.empId,
    this.gender,
    this.nationality,
    this.emiratesId,
    this.healthCard,
    this.citizenshipCard,
    this.driverLicenseNum,
    this.emailVerifiedAt,
    this.password,
    this.otp,
    this.otpExpireTime,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.lat,
    this.lng,
    this.fid,
    this.gid,
    this.isStoppedRequest,
    this.isFbSignup,
    this.isGmailSignup,
    this.isManualSignup,
    this.storeId,
    this.employeeStatusId,
    this.signupPlatform,
    this.uniqueNo,
    this.deviceType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    fullname: json["fullname"],
    lastname: json["lastname"],
    avatar: json["avatar"],
    countryCode: json["country_code"],
    mobile: json["mobile"],
    deviceToken: json["device_token"],
    email: json["email"],
    dob: json["dob"],
    empId: json["empId"],
    gender: json["gender"],
    nationality: json["nationality"],
    emiratesId: json["emirates_id"],
    healthCard: json["health_card"],
    citizenshipCard: json["citizenship_card"],
    driverLicenseNum: json["driver_license_num"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
    password: json["password"],
    otp: json["otp"],
    otpExpireTime: json["otp_expire_time"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    postalCode: json["postal_code"],
    lat: json["lat"],
    lng: json["lng"],
    fid: json["fid"],
    gid: json["gid"],
    isStoppedRequest: json["isStoppedRequest"],
    isFbSignup: json["is_fb_signup"],
    isGmailSignup: json["is_gmail_signup"],
    isManualSignup: json["is_manual_signup"],
    storeId: json["store_id"],
    employeeStatusId: json["employee_status_id"],
    signupPlatform: json["signup_platform"],
    uniqueNo: json["unique_no"],
    deviceType: json["device_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "lastname": lastname,
    "avatar": avatar,
    "country_code": countryCode,
    "mobile": mobile,
    "device_token": deviceToken,
    "email": email,
    "dob": dob,
    "empId": empId,
    "gender": gender,
    "nationality": nationality,
    "emirates_id": emiratesId,
    "health_card": healthCard,
    "citizenship_card": citizenshipCard,
    "driver_license_num": driverLicenseNum,
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "password": password,
    "otp": otp,
    "otp_expire_time": otpExpireTime,
    "address": address,
    "city": city,
    "state": state,
    "postal_code": postalCode,
    "lat": lat,
    "lng": lng,
    "fid": fid,
    "gid": gid,
    "isStoppedRequest": isStoppedRequest,
    "is_fb_signup": isFbSignup,
    "is_gmail_signup": isGmailSignup,
    "is_manual_signup": isManualSignup,
    "store_id": storeId,
    "employee_status_id": employeeStatusId,
    "signup_platform": signupPlatform,
    "unique_no": uniqueNo,
    "device_type": deviceType,
  };
}