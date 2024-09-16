/// data : {"customerAddress":[{"id":820,"user_id":891,"address_ref":"","makani_number":null,"location":"hchc , hfjfhf","city":"hxhf","state":"Manipur","pin":713409,"country":"India","apartment":"","name":"hdhdrh","last_name":"hdhdfh","email":"indranil@appic.me","mobile_number":"8918624052","address_instructions":"","lat":"0.00000000","lng":"0.00000000","guest_id":null,"created_at":"2024-09-16 11:34:21","updated_at":"2024-09-16 11:34:21","deleted_at":null}],"user":{"id":891,"fullname":"mihir","lastname":"bhuta","avatar":"","country_code":null,"mobile":"","device_token":"loginsuccess","email":"mihir999@yopmail.com","dob":"","empId":"8031214143647","gender":null,"nationality":null,"emirates_id":null,"health_card":null,"citizenship_card":null,"driver_license_num":"","email_verified_at":"2024-09-04 03:43:56","password":"$2y$10$4gt9wP/DfKnLotH5Pkz.AO3uSS774e5T5PP.7Z/aKxkeYuM9bWl86","otp":0,"otp_expire_time":null,"address":"","city":"","state":"","postal_code":"","lat":"0.00000000","lng":"0.00000000","fid":null,"gid":null,"isStoppedRequest":0,"is_fb_signup":0,"is_gmail_signup":0,"is_manual_signup":1,"store_id":null,"employee_status_id":null,"signup_platform":1,"unique_no":67645496,"device_type":null}}
/// success : true
/// error : 200
/// status_code : "Successfully fetched customer address"

class CustomerAddressModel {
  CustomerAddressModel({
      Data? data, 
      bool? success, 
      num? error, 
      String? statusCode,}){
    _data = data;
    _success = success;
    _error = error;
    _statusCode = statusCode;
}

  CustomerAddressModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _error = json['error'];
    _statusCode = json['status_code'];
  }
  Data? _data;
  bool? _success;
  num? _error;
  String? _statusCode;
CustomerAddressModel copyWith({  Data? data,
  bool? success,
  num? error,
  String? statusCode,
}) => CustomerAddressModel(  data: data ?? _data,
  success: success ?? _success,
  error: error ?? _error,
  statusCode: statusCode ?? _statusCode,
);
  Data? get data => _data;
  bool? get success => _success;
  num? get error => _error;
  String? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['success'] = _success;
    map['error'] = _error;
    map['status_code'] = _statusCode;
    return map;
  }

}

/// customerAddress : [{"id":820,"user_id":891,"address_ref":"","makani_number":null,"location":"hchc , hfjfhf","city":"hxhf","state":"Manipur","pin":713409,"country":"India","apartment":"","name":"hdhdrh","last_name":"hdhdfh","email":"indranil@appic.me","mobile_number":"8918624052","address_instructions":"","lat":"0.00000000","lng":"0.00000000","guest_id":null,"created_at":"2024-09-16 11:34:21","updated_at":"2024-09-16 11:34:21","deleted_at":null}]
/// user : {"id":891,"fullname":"mihir","lastname":"bhuta","avatar":"","country_code":null,"mobile":"","device_token":"loginsuccess","email":"mihir999@yopmail.com","dob":"","empId":"8031214143647","gender":null,"nationality":null,"emirates_id":null,"health_card":null,"citizenship_card":null,"driver_license_num":"","email_verified_at":"2024-09-04 03:43:56","password":"$2y$10$4gt9wP/DfKnLotH5Pkz.AO3uSS774e5T5PP.7Z/aKxkeYuM9bWl86","otp":0,"otp_expire_time":null,"address":"","city":"","state":"","postal_code":"","lat":"0.00000000","lng":"0.00000000","fid":null,"gid":null,"isStoppedRequest":0,"is_fb_signup":0,"is_gmail_signup":0,"is_manual_signup":1,"store_id":null,"employee_status_id":null,"signup_platform":1,"unique_no":67645496,"device_type":null}

class Data {
  Data({
      List<CustomerAddress>? customerAddress, 
      User? user,}){
    _customerAddress = customerAddress;
    _user = user;
}

  Data.fromJson(dynamic json) {
    if (json['customerAddress'] != null) {
      _customerAddress = [];
      json['customerAddress'].forEach((v) {
        _customerAddress?.add(CustomerAddress.fromJson(v));
      });
    }
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  List<CustomerAddress>? _customerAddress;
  User? _user;
Data copyWith({  List<CustomerAddress>? customerAddress,
  User? user,
}) => Data(  customerAddress: customerAddress ?? _customerAddress,
  user: user ?? _user,
);
  List<CustomerAddress>? get customerAddress => _customerAddress;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_customerAddress != null) {
      map['customerAddress'] = _customerAddress?.map((v) => v.toJson()).toList();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 891
/// fullname : "mihir"
/// lastname : "bhuta"
/// avatar : ""
/// country_code : null
/// mobile : ""
/// device_token : "loginsuccess"
/// email : "mihir999@yopmail.com"
/// dob : ""
/// empId : "8031214143647"
/// gender : null
/// nationality : null
/// emirates_id : null
/// health_card : null
/// citizenship_card : null
/// driver_license_num : ""
/// email_verified_at : "2024-09-04 03:43:56"
/// password : "$2y$10$4gt9wP/DfKnLotH5Pkz.AO3uSS774e5T5PP.7Z/aKxkeYuM9bWl86"
/// otp : 0
/// otp_expire_time : null
/// address : ""
/// city : ""
/// state : ""
/// postal_code : ""
/// lat : "0.00000000"
/// lng : "0.00000000"
/// fid : null
/// gid : null
/// isStoppedRequest : 0
/// is_fb_signup : 0
/// is_gmail_signup : 0
/// is_manual_signup : 1
/// store_id : null
/// employee_status_id : null
/// signup_platform : 1
/// unique_no : 67645496
/// device_type : null

class User {
  User({
      num? id, 
      String? fullname, 
      String? lastname, 
      String? avatar, 
      dynamic countryCode, 
      String? mobile, 
      String? deviceToken, 
      String? email, 
      String? dob, 
      String? empId, 
      dynamic gender, 
      dynamic nationality, 
      dynamic emiratesId, 
      dynamic healthCard, 
      dynamic citizenshipCard, 
      String? driverLicenseNum, 
      String? emailVerifiedAt, 
      String? password, 
      num? otp, 
      dynamic otpExpireTime, 
      String? address, 
      String? city, 
      String? state, 
      String? postalCode, 
      String? lat, 
      String? lng, 
      dynamic fid, 
      dynamic gid, 
      num? isStoppedRequest, 
      num? isFbSignup, 
      num? isGmailSignup, 
      num? isManualSignup, 
      dynamic storeId, 
      dynamic employeeStatusId, 
      num? signupPlatform, 
      num? uniqueNo, 
      dynamic deviceType,}){
    _id = id;
    _fullname = fullname;
    _lastname = lastname;
    _avatar = avatar;
    _countryCode = countryCode;
    _mobile = mobile;
    _deviceToken = deviceToken;
    _email = email;
    _dob = dob;
    _empId = empId;
    _gender = gender;
    _nationality = nationality;
    _emiratesId = emiratesId;
    _healthCard = healthCard;
    _citizenshipCard = citizenshipCard;
    _driverLicenseNum = driverLicenseNum;
    _emailVerifiedAt = emailVerifiedAt;
    _password = password;
    _otp = otp;
    _otpExpireTime = otpExpireTime;
    _address = address;
    _city = city;
    _state = state;
    _postalCode = postalCode;
    _lat = lat;
    _lng = lng;
    _fid = fid;
    _gid = gid;
    _isStoppedRequest = isStoppedRequest;
    _isFbSignup = isFbSignup;
    _isGmailSignup = isGmailSignup;
    _isManualSignup = isManualSignup;
    _storeId = storeId;
    _employeeStatusId = employeeStatusId;
    _signupPlatform = signupPlatform;
    _uniqueNo = uniqueNo;
    _deviceType = deviceType;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _fullname = json['fullname'];
    _lastname = json['lastname'];
    _avatar = json['avatar'];
    _countryCode = json['country_code'];
    _mobile = json['mobile'];
    _deviceToken = json['device_token'];
    _email = json['email'];
    _dob = json['dob'];
    _empId = json['empId'];
    _gender = json['gender'];
    _nationality = json['nationality'];
    _emiratesId = json['emirates_id'];
    _healthCard = json['health_card'];
    _citizenshipCard = json['citizenship_card'];
    _driverLicenseNum = json['driver_license_num'];
    _emailVerifiedAt = json['email_verified_at'];
    _password = json['password'];
    _otp = json['otp'];
    _otpExpireTime = json['otp_expire_time'];
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _postalCode = json['postal_code'];
    _lat = json['lat'];
    _lng = json['lng'];
    _fid = json['fid'];
    _gid = json['gid'];
    _isStoppedRequest = json['isStoppedRequest'];
    _isFbSignup = json['is_fb_signup'];
    _isGmailSignup = json['is_gmail_signup'];
    _isManualSignup = json['is_manual_signup'];
    _storeId = json['store_id'];
    _employeeStatusId = json['employee_status_id'];
    _signupPlatform = json['signup_platform'];
    _uniqueNo = json['unique_no'];
    _deviceType = json['device_type'];
  }
  num? _id;
  String? _fullname;
  String? _lastname;
  String? _avatar;
  dynamic _countryCode;
  String? _mobile;
  String? _deviceToken;
  String? _email;
  String? _dob;
  String? _empId;
  dynamic _gender;
  dynamic _nationality;
  dynamic _emiratesId;
  dynamic _healthCard;
  dynamic _citizenshipCard;
  String? _driverLicenseNum;
  String? _emailVerifiedAt;
  String? _password;
  num? _otp;
  dynamic _otpExpireTime;
  String? _address;
  String? _city;
  String? _state;
  String? _postalCode;
  String? _lat;
  String? _lng;
  dynamic _fid;
  dynamic _gid;
  num? _isStoppedRequest;
  num? _isFbSignup;
  num? _isGmailSignup;
  num? _isManualSignup;
  dynamic _storeId;
  dynamic _employeeStatusId;
  num? _signupPlatform;
  num? _uniqueNo;
  dynamic _deviceType;
User copyWith({  num? id,
  String? fullname,
  String? lastname,
  String? avatar,
  dynamic countryCode,
  String? mobile,
  String? deviceToken,
  String? email,
  String? dob,
  String? empId,
  dynamic gender,
  dynamic nationality,
  dynamic emiratesId,
  dynamic healthCard,
  dynamic citizenshipCard,
  String? driverLicenseNum,
  String? emailVerifiedAt,
  String? password,
  num? otp,
  dynamic otpExpireTime,
  String? address,
  String? city,
  String? state,
  String? postalCode,
  String? lat,
  String? lng,
  dynamic fid,
  dynamic gid,
  num? isStoppedRequest,
  num? isFbSignup,
  num? isGmailSignup,
  num? isManualSignup,
  dynamic storeId,
  dynamic employeeStatusId,
  num? signupPlatform,
  num? uniqueNo,
  dynamic deviceType,
}) => User(  id: id ?? _id,
  fullname: fullname ?? _fullname,
  lastname: lastname ?? _lastname,
  avatar: avatar ?? _avatar,
  countryCode: countryCode ?? _countryCode,
  mobile: mobile ?? _mobile,
  deviceToken: deviceToken ?? _deviceToken,
  email: email ?? _email,
  dob: dob ?? _dob,
  empId: empId ?? _empId,
  gender: gender ?? _gender,
  nationality: nationality ?? _nationality,
  emiratesId: emiratesId ?? _emiratesId,
  healthCard: healthCard ?? _healthCard,
  citizenshipCard: citizenshipCard ?? _citizenshipCard,
  driverLicenseNum: driverLicenseNum ?? _driverLicenseNum,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  password: password ?? _password,
  otp: otp ?? _otp,
  otpExpireTime: otpExpireTime ?? _otpExpireTime,
  address: address ?? _address,
  city: city ?? _city,
  state: state ?? _state,
  postalCode: postalCode ?? _postalCode,
  lat: lat ?? _lat,
  lng: lng ?? _lng,
  fid: fid ?? _fid,
  gid: gid ?? _gid,
  isStoppedRequest: isStoppedRequest ?? _isStoppedRequest,
  isFbSignup: isFbSignup ?? _isFbSignup,
  isGmailSignup: isGmailSignup ?? _isGmailSignup,
  isManualSignup: isManualSignup ?? _isManualSignup,
  storeId: storeId ?? _storeId,
  employeeStatusId: employeeStatusId ?? _employeeStatusId,
  signupPlatform: signupPlatform ?? _signupPlatform,
  uniqueNo: uniqueNo ?? _uniqueNo,
  deviceType: deviceType ?? _deviceType,
);
  num? get id => _id;
  String? get fullname => _fullname;
  String? get lastname => _lastname;
  String? get avatar => _avatar;
  dynamic get countryCode => _countryCode;
  String? get mobile => _mobile;
  String? get deviceToken => _deviceToken;
  String? get email => _email;
  String? get dob => _dob;
  String? get empId => _empId;
  dynamic get gender => _gender;
  dynamic get nationality => _nationality;
  dynamic get emiratesId => _emiratesId;
  dynamic get healthCard => _healthCard;
  dynamic get citizenshipCard => _citizenshipCard;
  String? get driverLicenseNum => _driverLicenseNum;
  String? get emailVerifiedAt => _emailVerifiedAt;
  String? get password => _password;
  num? get otp => _otp;
  dynamic get otpExpireTime => _otpExpireTime;
  String? get address => _address;
  String? get city => _city;
  String? get state => _state;
  String? get postalCode => _postalCode;
  String? get lat => _lat;
  String? get lng => _lng;
  dynamic get fid => _fid;
  dynamic get gid => _gid;
  num? get isStoppedRequest => _isStoppedRequest;
  num? get isFbSignup => _isFbSignup;
  num? get isGmailSignup => _isGmailSignup;
  num? get isManualSignup => _isManualSignup;
  dynamic get storeId => _storeId;
  dynamic get employeeStatusId => _employeeStatusId;
  num? get signupPlatform => _signupPlatform;
  num? get uniqueNo => _uniqueNo;
  dynamic get deviceType => _deviceType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fullname'] = _fullname;
    map['lastname'] = _lastname;
    map['avatar'] = _avatar;
    map['country_code'] = _countryCode;
    map['mobile'] = _mobile;
    map['device_token'] = _deviceToken;
    map['email'] = _email;
    map['dob'] = _dob;
    map['empId'] = _empId;
    map['gender'] = _gender;
    map['nationality'] = _nationality;
    map['emirates_id'] = _emiratesId;
    map['health_card'] = _healthCard;
    map['citizenship_card'] = _citizenshipCard;
    map['driver_license_num'] = _driverLicenseNum;
    map['email_verified_at'] = _emailVerifiedAt;
    map['password'] = _password;
    map['otp'] = _otp;
    map['otp_expire_time'] = _otpExpireTime;
    map['address'] = _address;
    map['city'] = _city;
    map['state'] = _state;
    map['postal_code'] = _postalCode;
    map['lat'] = _lat;
    map['lng'] = _lng;
    map['fid'] = _fid;
    map['gid'] = _gid;
    map['isStoppedRequest'] = _isStoppedRequest;
    map['is_fb_signup'] = _isFbSignup;
    map['is_gmail_signup'] = _isGmailSignup;
    map['is_manual_signup'] = _isManualSignup;
    map['store_id'] = _storeId;
    map['employee_status_id'] = _employeeStatusId;
    map['signup_platform'] = _signupPlatform;
    map['unique_no'] = _uniqueNo;
    map['device_type'] = _deviceType;
    return map;
  }

}

/// id : 820
/// user_id : 891
/// address_ref : ""
/// makani_number : null
/// location : "hchc , hfjfhf"
/// city : "hxhf"
/// state : "Manipur"
/// pin : 713409
/// country : "India"
/// apartment : ""
/// name : "hdhdrh"
/// last_name : "hdhdfh"
/// email : "indranil@appic.me"
/// mobile_number : "8918624052"
/// address_instructions : ""
/// lat : "0.00000000"
/// lng : "0.00000000"
/// guest_id : null
/// created_at : "2024-09-16 11:34:21"
/// updated_at : "2024-09-16 11:34:21"
/// deleted_at : null

class CustomerAddress {
  CustomerAddress({
      num? id, 
      num? userId, 
      String? addressRef, 
      dynamic makaniNumber, 
      String? location, 
      String? city, 
      String? state, 
      num? pin, 
      String? country, 
      String? apartment, 
      String? name, 
      String? lastName, 
      String? email, 
      String? mobileNumber, 
      String? addressInstructions, 
      String? lat, 
      String? lng, 
      dynamic guestId, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt,}){
    _id = id;
    _userId = userId;
    _addressRef = addressRef;
    _makaniNumber = makaniNumber;
    _location = location;
    _city = city;
    _state = state;
    _pin = pin;
    _country = country;
    _apartment = apartment;
    _name = name;
    _lastName = lastName;
    _email = email;
    _mobileNumber = mobileNumber;
    _addressInstructions = addressInstructions;
    _lat = lat;
    _lng = lng;
    _guestId = guestId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  CustomerAddress.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _addressRef = json['address_ref'];
    _makaniNumber = json['makani_number'];
    _location = json['location'];
    _city = json['city'];
    _state = json['state'];
    _pin = json['pin'];
    _country = json['country'];
    _apartment = json['apartment'];
    _name = json['name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _mobileNumber = json['mobile_number'];
    _addressInstructions = json['address_instructions'];
    _lat = json['lat'];
    _lng = json['lng'];
    _guestId = json['guest_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  num? _userId;
  String? _addressRef;
  dynamic _makaniNumber;
  String? _location;
  String? _city;
  String? _state;
  num? _pin;
  String? _country;
  String? _apartment;
  String? _name;
  String? _lastName;
  String? _email;
  String? _mobileNumber;
  String? _addressInstructions;
  String? _lat;
  String? _lng;
  dynamic _guestId;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
CustomerAddress copyWith({  num? id,
  num? userId,
  String? addressRef,
  dynamic makaniNumber,
  String? location,
  String? city,
  String? state,
  num? pin,
  String? country,
  String? apartment,
  String? name,
  String? lastName,
  String? email,
  String? mobileNumber,
  String? addressInstructions,
  String? lat,
  String? lng,
  dynamic guestId,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => CustomerAddress(  id: id ?? _id,
  userId: userId ?? _userId,
  addressRef: addressRef ?? _addressRef,
  makaniNumber: makaniNumber ?? _makaniNumber,
  location: location ?? _location,
  city: city ?? _city,
  state: state ?? _state,
  pin: pin ?? _pin,
  country: country ?? _country,
  apartment: apartment ?? _apartment,
  name: name ?? _name,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  mobileNumber: mobileNumber ?? _mobileNumber,
  addressInstructions: addressInstructions ?? _addressInstructions,
  lat: lat ?? _lat,
  lng: lng ?? _lng,
  guestId: guestId ?? _guestId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get addressRef => _addressRef;
  dynamic get makaniNumber => _makaniNumber;
  String? get location => _location;
  String? get city => _city;
  String? get state => _state;
  num? get pin => _pin;
  String? get country => _country;
  String? get apartment => _apartment;
  String? get name => _name;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get mobileNumber => _mobileNumber;
  String? get addressInstructions => _addressInstructions;
  String? get lat => _lat;
  String? get lng => _lng;
  dynamic get guestId => _guestId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['address_ref'] = _addressRef;
    map['makani_number'] = _makaniNumber;
    map['location'] = _location;
    map['city'] = _city;
    map['state'] = _state;
    map['pin'] = _pin;
    map['country'] = _country;
    map['apartment'] = _apartment;
    map['name'] = _name;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['mobile_number'] = _mobileNumber;
    map['address_instructions'] = _addressInstructions;
    map['lat'] = _lat;
    map['lng'] = _lng;
    map['guest_id'] = _guestId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}