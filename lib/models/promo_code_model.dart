/// data : {"get_promoccode_details":{"id":4,"code_name":"TUE10"},"carts":[{"id":10660,"product_id":93,"product_name":"Fabby Furever Deo Fresh Deodorant for Dog, Cats and Pups, Odour Neutralizer with Lavender Oil, Long-Lasting Fragrance Perfume, Freshening Deodorizer Spray for All Breeds, Alcohol & Paraben Free, 200ml","user_id":891,"store_id":1,"unit_price_excl_vat":"900.00","single_unit_price_excl_vat":"450.00","vat_rate":"0","cart_count":2,"is_offer":0,"offer_type":0,"offer_rate":"0.00","offer_value":0,"discount_price":"0.00","discounted_qty":0,"prescription_order_status":0,"order_id":0,"buy_now":null,"guest_id":null,"total_value":900,"product":{"id":93,"product_name":"Fabby Furever Deo Fresh Deodorant for Dog, Cats and Pups, Odour Neutralizer with Lavender Oil, Long-Lasting Fragrance Perfume, Freshening Deodorizer Spray for All Breeds, Alcohol & Paraben Free, 200ml","unit":null}},{"id":10662,"product_id":129,"product_name":"cat shampoo","user_id":891,"store_id":1,"unit_price_excl_vat":"899.00","single_unit_price_excl_vat":"899.00","vat_rate":"0","cart_count":1,"is_offer":0,"offer_type":0,"offer_rate":"0.00","offer_value":0,"discount_price":"0.00","discounted_qty":0,"prescription_order_status":0,"order_id":0,"buy_now":null,"guest_id":null,"total_value":899,"product":{"id":129,"product_name":"cat shampoo","unit":null}},{"id":10663,"product_id":127,"product_name":"Bow Maintainence Accessories","user_id":891,"store_id":1,"unit_price_excl_vat":"200.00","single_unit_price_excl_vat":"200.00","vat_rate":"0","cart_count":1,"is_offer":0,"offer_type":0,"offer_rate":"0.00","offer_value":0,"discount_price":"0.00","discounted_qty":0,"prescription_order_status":0,"order_id":0,"buy_now":null,"guest_id":null,"total_value":200,"product":{"id":127,"product_name":"Bow Maintainence Accessories","unit":null}},{"id":10664,"product_id":128,"product_name":"Protective Gear (Gloves & Arm Guards)","user_id":891,"store_id":1,"unit_price_excl_vat":"899.00","single_unit_price_excl_vat":"899.00","vat_rate":"0","cart_count":1,"is_offer":0,"offer_type":0,"offer_rate":"0.00","offer_value":0,"discount_price":"0.00","discounted_qty":0,"prescription_order_status":0,"order_id":0,"buy_now":null,"guest_id":null,"total_value":899,"product":{"id":128,"product_name":"Protective Gear (Gloves & Arm Guards)","unit":null}}],"dicount":"300","sub_total":2898,"total":2598,"user":{"id":891,"fullname":"mihir","lastname":"bhuta","avatar":"","country_code":null,"mobile":"","device_token":"loginsuccess","email":"mihir999@yopmail.com","dob":"","empId":"8031214143647","gender":null,"nationality":null,"emirates_id":null,"health_card":null,"citizenship_card":null,"driver_license_num":"","email_verified_at":"2024-09-04 03:43:56","password":"$2y$10$4gt9wP/DfKnLotH5Pkz.AO3uSS774e5T5PP.7Z/aKxkeYuM9bWl86","otp":0,"otp_expire_time":null,"address":"","city":"","state":"","postal_code":"","lat":"0.00000000","lng":"0.00000000","fid":null,"gid":null,"isStoppedRequest":0,"is_fb_signup":0,"is_gmail_signup":0,"is_manual_signup":1,"store_id":null,"employee_status_id":null,"signup_platform":1,"unique_no":67645496,"device_type":null}}
/// success : true
/// error : "Coupon Applied"
/// status_code : 200

class PromoCodeModel {
  PromoCodeModel({
      Data? data, 
      bool? success, 
      String? error, 
      num? statusCode,}){
    _data = data;
    _success = success;
    _error = error;
    _statusCode = statusCode;
}

  PromoCodeModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _error = json['error'];
    _statusCode = json['status_code'];
  }
  Data? _data;
  bool? _success;
  String? _error;
  num? _statusCode;
PromoCodeModel copyWith({  Data? data,
  bool? success,
  String? error,
  num? statusCode,
}) => PromoCodeModel(  data: data ?? _data,
  success: success ?? _success,
  error: error ?? _error,
  statusCode: statusCode ?? _statusCode,
);
  Data? get data => _data;
  bool? get success => _success;
  String? get error => _error;
  num? get statusCode => _statusCode;

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

/// get_promoccode_details : {"id":4,"code_name":"TUE10"}
/// carts : [{"id":10660,"product_id":93,"product_name":"Fabby Furever Deo Fresh Deodorant for Dog, Cats and Pups, Odour Neutralizer with Lavender Oil, Long-Lasting Fragrance Perfume, Freshening Deodorizer Spray for All Breeds, Alcohol & Paraben Free, 200ml","user_id":891,"store_id":1,"unit_price_excl_vat":"900.00","single_unit_price_excl_vat":"450.00","vat_rate":"0","cart_count":2,"is_offer":0,"offer_type":0,"offer_rate":"0.00","offer_value":0,"discount_price":"0.00","discounted_qty":0,"prescription_order_status":0,"order_id":0,"buy_now":null,"guest_id":null,"total_value":900,"product":{"id":93,"product_name":"Fabby Furever Deo Fresh Deodorant for Dog, Cats and Pups, Odour Neutralizer with Lavender Oil, Long-Lasting Fragrance Perfume, Freshening Deodorizer Spray for All Breeds, Alcohol & Paraben Free, 200ml","unit":null}},{"id":10662,"product_id":129,"product_name":"cat shampoo","user_id":891,"store_id":1,"unit_price_excl_vat":"899.00","single_unit_price_excl_vat":"899.00","vat_rate":"0","cart_count":1,"is_offer":0,"offer_type":0,"offer_rate":"0.00","offer_value":0,"discount_price":"0.00","discounted_qty":0,"prescription_order_status":0,"order_id":0,"buy_now":null,"guest_id":null,"total_value":899,"product":{"id":129,"product_name":"cat shampoo","unit":null}},{"id":10663,"product_id":127,"product_name":"Bow Maintainence Accessories","user_id":891,"store_id":1,"unit_price_excl_vat":"200.00","single_unit_price_excl_vat":"200.00","vat_rate":"0","cart_count":1,"is_offer":0,"offer_type":0,"offer_rate":"0.00","offer_value":0,"discount_price":"0.00","discounted_qty":0,"prescription_order_status":0,"order_id":0,"buy_now":null,"guest_id":null,"total_value":200,"product":{"id":127,"product_name":"Bow Maintainence Accessories","unit":null}},{"id":10664,"product_id":128,"product_name":"Protective Gear (Gloves & Arm Guards)","user_id":891,"store_id":1,"unit_price_excl_vat":"899.00","single_unit_price_excl_vat":"899.00","vat_rate":"0","cart_count":1,"is_offer":0,"offer_type":0,"offer_rate":"0.00","offer_value":0,"discount_price":"0.00","discounted_qty":0,"prescription_order_status":0,"order_id":0,"buy_now":null,"guest_id":null,"total_value":899,"product":{"id":128,"product_name":"Protective Gear (Gloves & Arm Guards)","unit":null}}]
/// dicount : "300"
/// sub_total : 2898
/// total : 2598
/// user : {"id":891,"fullname":"mihir","lastname":"bhuta","avatar":"","country_code":null,"mobile":"","device_token":"loginsuccess","email":"mihir999@yopmail.com","dob":"","empId":"8031214143647","gender":null,"nationality":null,"emirates_id":null,"health_card":null,"citizenship_card":null,"driver_license_num":"","email_verified_at":"2024-09-04 03:43:56","password":"$2y$10$4gt9wP/DfKnLotH5Pkz.AO3uSS774e5T5PP.7Z/aKxkeYuM9bWl86","otp":0,"otp_expire_time":null,"address":"","city":"","state":"","postal_code":"","lat":"0.00000000","lng":"0.00000000","fid":null,"gid":null,"isStoppedRequest":0,"is_fb_signup":0,"is_gmail_signup":0,"is_manual_signup":1,"store_id":null,"employee_status_id":null,"signup_platform":1,"unique_no":67645496,"device_type":null}

class Data {
  Data({
      GetPromoccodeDetails? getPromoccodeDetails, 
      List<Carts>? carts, 
      String? dicount, 
      num? subTotal, 
      num? total, 
      User? user,}){
    _getPromoccodeDetails = getPromoccodeDetails;
    _carts = carts;
    _dicount = dicount;
    _subTotal = subTotal;
    _total = total;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _getPromoccodeDetails = json['get_promoccode_details'] != null ? GetPromoccodeDetails.fromJson(json['get_promoccode_details']) : null;
    if (json['carts'] != null) {
      _carts = [];
      json['carts'].forEach((v) {
        _carts?.add(Carts.fromJson(v));
      });
    }
    _dicount = json['dicount'];
    _subTotal = json['sub_total'];
    _total = json['total'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  GetPromoccodeDetails? _getPromoccodeDetails;
  List<Carts>? _carts;
  String? _dicount;
  num? _subTotal;
  num? _total;
  User? _user;
Data copyWith({  GetPromoccodeDetails? getPromoccodeDetails,
  List<Carts>? carts,
  String? dicount,
  num? subTotal,
  num? total,
  User? user,
}) => Data(  getPromoccodeDetails: getPromoccodeDetails ?? _getPromoccodeDetails,
  carts: carts ?? _carts,
  dicount: dicount ?? _dicount,
  subTotal: subTotal ?? _subTotal,
  total: total ?? _total,
  user: user ?? _user,
);
  GetPromoccodeDetails? get getPromoccodeDetails => _getPromoccodeDetails;
  List<Carts>? get carts => _carts;
  String? get dicount => _dicount;
  num? get subTotal => _subTotal;
  num? get total => _total;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_getPromoccodeDetails != null) {
      map['get_promoccode_details'] = _getPromoccodeDetails?.toJson();
    }
    if (_carts != null) {
      map['carts'] = _carts?.map((v) => v.toJson()).toList();
    }
    map['dicount'] = _dicount;
    map['sub_total'] = _subTotal;
    map['total'] = _total;
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

/// id : 10660
/// product_id : 93
/// product_name : "Fabby Furever Deo Fresh Deodorant for Dog, Cats and Pups, Odour Neutralizer with Lavender Oil, Long-Lasting Fragrance Perfume, Freshening Deodorizer Spray for All Breeds, Alcohol & Paraben Free, 200ml"
/// user_id : 891
/// store_id : 1
/// unit_price_excl_vat : "900.00"
/// single_unit_price_excl_vat : "450.00"
/// vat_rate : "0"
/// cart_count : 2
/// is_offer : 0
/// offer_type : 0
/// offer_rate : "0.00"
/// offer_value : 0
/// discount_price : "0.00"
/// discounted_qty : 0
/// prescription_order_status : 0
/// order_id : 0
/// buy_now : null
/// guest_id : null
/// total_value : 900
/// product : {"id":93,"product_name":"Fabby Furever Deo Fresh Deodorant for Dog, Cats and Pups, Odour Neutralizer with Lavender Oil, Long-Lasting Fragrance Perfume, Freshening Deodorizer Spray for All Breeds, Alcohol & Paraben Free, 200ml","unit":null}

class Carts {
  Carts({
      num? id, 
      num? productId, 
      String? productName, 
      num? userId, 
      num? storeId, 
      String? unitPriceExclVat, 
      String? singleUnitPriceExclVat, 
      String? vatRate, 
      num? cartCount, 
      num? isOffer, 
      num? offerType, 
      String? offerRate, 
      num? offerValue, 
      String? discountPrice, 
      num? discountedQty, 
      num? prescriptionOrderStatus, 
      num? orderId, 
      dynamic buyNow, 
      dynamic guestId, 
      num? totalValue, 
      Product? product,}){
    _id = id;
    _productId = productId;
    _productName = productName;
    _userId = userId;
    _storeId = storeId;
    _unitPriceExclVat = unitPriceExclVat;
    _singleUnitPriceExclVat = singleUnitPriceExclVat;
    _vatRate = vatRate;
    _cartCount = cartCount;
    _isOffer = isOffer;
    _offerType = offerType;
    _offerRate = offerRate;
    _offerValue = offerValue;
    _discountPrice = discountPrice;
    _discountedQty = discountedQty;
    _prescriptionOrderStatus = prescriptionOrderStatus;
    _orderId = orderId;
    _buyNow = buyNow;
    _guestId = guestId;
    _totalValue = totalValue;
    _product = product;
}

  Carts.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _productName = json['product_name'];
    _userId = json['user_id'];
    _storeId = json['store_id'];
    _unitPriceExclVat = json['unit_price_excl_vat'];
    _singleUnitPriceExclVat = json['single_unit_price_excl_vat'];
    _vatRate = json['vat_rate'];
    _cartCount = json['cart_count'];
    _isOffer = json['is_offer'];
    _offerType = json['offer_type'];
    _offerRate = json['offer_rate'];
    _offerValue = json['offer_value'];
    _discountPrice = json['discount_price'];
    _discountedQty = json['discounted_qty'];
    _prescriptionOrderStatus = json['prescription_order_status'];
    _orderId = json['order_id'];
    _buyNow = json['buy_now'];
    _guestId = json['guest_id'];
    _totalValue = json['total_value'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  num? _id;
  num? _productId;
  String? _productName;
  num? _userId;
  num? _storeId;
  String? _unitPriceExclVat;
  String? _singleUnitPriceExclVat;
  String? _vatRate;
  num? _cartCount;
  num? _isOffer;
  num? _offerType;
  String? _offerRate;
  num? _offerValue;
  String? _discountPrice;
  num? _discountedQty;
  num? _prescriptionOrderStatus;
  num? _orderId;
  dynamic _buyNow;
  dynamic _guestId;
  num? _totalValue;
  Product? _product;
Carts copyWith({  num? id,
  num? productId,
  String? productName,
  num? userId,
  num? storeId,
  String? unitPriceExclVat,
  String? singleUnitPriceExclVat,
  String? vatRate,
  num? cartCount,
  num? isOffer,
  num? offerType,
  String? offerRate,
  num? offerValue,
  String? discountPrice,
  num? discountedQty,
  num? prescriptionOrderStatus,
  num? orderId,
  dynamic buyNow,
  dynamic guestId,
  num? totalValue,
  Product? product,
}) => Carts(  id: id ?? _id,
  productId: productId ?? _productId,
  productName: productName ?? _productName,
  userId: userId ?? _userId,
  storeId: storeId ?? _storeId,
  unitPriceExclVat: unitPriceExclVat ?? _unitPriceExclVat,
  singleUnitPriceExclVat: singleUnitPriceExclVat ?? _singleUnitPriceExclVat,
  vatRate: vatRate ?? _vatRate,
  cartCount: cartCount ?? _cartCount,
  isOffer: isOffer ?? _isOffer,
  offerType: offerType ?? _offerType,
  offerRate: offerRate ?? _offerRate,
  offerValue: offerValue ?? _offerValue,
  discountPrice: discountPrice ?? _discountPrice,
  discountedQty: discountedQty ?? _discountedQty,
  prescriptionOrderStatus: prescriptionOrderStatus ?? _prescriptionOrderStatus,
  orderId: orderId ?? _orderId,
  buyNow: buyNow ?? _buyNow,
  guestId: guestId ?? _guestId,
  totalValue: totalValue ?? _totalValue,
  product: product ?? _product,
);
  num? get id => _id;
  num? get productId => _productId;
  String? get productName => _productName;
  num? get userId => _userId;
  num? get storeId => _storeId;
  String? get unitPriceExclVat => _unitPriceExclVat;
  String? get singleUnitPriceExclVat => _singleUnitPriceExclVat;
  String? get vatRate => _vatRate;
  num? get cartCount => _cartCount;
  num? get isOffer => _isOffer;
  num? get offerType => _offerType;
  String? get offerRate => _offerRate;
  num? get offerValue => _offerValue;
  String? get discountPrice => _discountPrice;
  num? get discountedQty => _discountedQty;
  num? get prescriptionOrderStatus => _prescriptionOrderStatus;
  num? get orderId => _orderId;
  dynamic get buyNow => _buyNow;
  dynamic get guestId => _guestId;
  num? get totalValue => _totalValue;
  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['product_name'] = _productName;
    map['user_id'] = _userId;
    map['store_id'] = _storeId;
    map['unit_price_excl_vat'] = _unitPriceExclVat;
    map['single_unit_price_excl_vat'] = _singleUnitPriceExclVat;
    map['vat_rate'] = _vatRate;
    map['cart_count'] = _cartCount;
    map['is_offer'] = _isOffer;
    map['offer_type'] = _offerType;
    map['offer_rate'] = _offerRate;
    map['offer_value'] = _offerValue;
    map['discount_price'] = _discountPrice;
    map['discounted_qty'] = _discountedQty;
    map['prescription_order_status'] = _prescriptionOrderStatus;
    map['order_id'] = _orderId;
    map['buy_now'] = _buyNow;
    map['guest_id'] = _guestId;
    map['total_value'] = _totalValue;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }

}

/// id : 93
/// product_name : "Fabby Furever Deo Fresh Deodorant for Dog, Cats and Pups, Odour Neutralizer with Lavender Oil, Long-Lasting Fragrance Perfume, Freshening Deodorizer Spray for All Breeds, Alcohol & Paraben Free, 200ml"
/// unit : null

class Product {
  Product({
      num? id, 
      String? productName, 
      dynamic unit,}){
    _id = id;
    _productName = productName;
    _unit = unit;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _productName = json['product_name'];
    _unit = json['unit'];
  }
  num? _id;
  String? _productName;
  dynamic _unit;
Product copyWith({  num? id,
  String? productName,
  dynamic unit,
}) => Product(  id: id ?? _id,
  productName: productName ?? _productName,
  unit: unit ?? _unit,
);
  num? get id => _id;
  String? get productName => _productName;
  dynamic get unit => _unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_name'] = _productName;
    map['unit'] = _unit;
    return map;
  }

}

/// id : 4
/// code_name : "TUE10"

class GetPromoccodeDetails {
  GetPromoccodeDetails({
      num? id, 
      String? codeName,}){
    _id = id;
    _codeName = codeName;
}

  GetPromoccodeDetails.fromJson(dynamic json) {
    _id = json['id'];
    _codeName = json['code_name'];
  }
  num? _id;
  String? _codeName;
GetPromoccodeDetails copyWith({  num? id,
  String? codeName,
}) => GetPromoccodeDetails(  id: id ?? _id,
  codeName: codeName ?? _codeName,
);
  num? get id => _id;
  String? get codeName => _codeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code_name'] = _codeName;
    return map;
  }

}