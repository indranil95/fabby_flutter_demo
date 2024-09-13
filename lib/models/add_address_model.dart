/// data : {"name":"indranil","last_name":"Goswami","email":"indranil@appic.me","mobile_number":"8918624052","location":"kalna ,shyamrai para ,p.o-kalna,d.t-burdwan,pin-713409 kalna ,shyamrai para ,p.o-kalna,d.t-burdwan,pin-713409 k","city":"kalna","state":"West Bengal","pin":"713409","guest_id":null,"user_id":891,"country":"India","updated_at":"2024-09-13 17:14:35","created_at":"2024-09-13 17:14:35","id":818}
/// success : true
/// error : 200
/// status_code : "Success"

class AddAddressModel {
  AddAddressModel({
      Data? data, 
      bool? success, 
      num? error, 
      String? statusCode,}){
    _data = data;
    _success = success;
    _error = error;
    _statusCode = statusCode;
}

  AddAddressModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _error = json['error'];
    _statusCode = json['status_code'];
  }
  Data? _data;
  bool? _success;
  num? _error;
  String? _statusCode;
AddAddressModel copyWith({  Data? data,
  bool? success,
  num? error,
  String? statusCode,
}) => AddAddressModel(  data: data ?? _data,
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

/// name : "indranil"
/// last_name : "Goswami"
/// email : "indranil@appic.me"
/// mobile_number : "8918624052"
/// location : "kalna ,shyamrai para ,p.o-kalna,d.t-burdwan,pin-713409 kalna ,shyamrai para ,p.o-kalna,d.t-burdwan,pin-713409 k"
/// city : "kalna"
/// state : "West Bengal"
/// pin : "713409"
/// guest_id : null
/// user_id : 891
/// country : "India"
/// updated_at : "2024-09-13 17:14:35"
/// created_at : "2024-09-13 17:14:35"
/// id : 818

class Data {
  Data({
      String? name, 
      String? lastName, 
      String? email, 
      String? mobileNumber, 
      String? location, 
      String? city, 
      String? state, 
      String? pin, 
      dynamic guestId, 
      num? userId, 
      String? country, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _name = name;
    _lastName = lastName;
    _email = email;
    _mobileNumber = mobileNumber;
    _location = location;
    _city = city;
    _state = state;
    _pin = pin;
    _guestId = guestId;
    _userId = userId;
    _country = country;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _mobileNumber = json['mobile_number'];
    _location = json['location'];
    _city = json['city'];
    _state = json['state'];
    _pin = json['pin'];
    _guestId = json['guest_id'];
    _userId = json['user_id'];
    _country = json['country'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _name;
  String? _lastName;
  String? _email;
  String? _mobileNumber;
  String? _location;
  String? _city;
  String? _state;
  String? _pin;
  dynamic _guestId;
  num? _userId;
  String? _country;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
Data copyWith({  String? name,
  String? lastName,
  String? email,
  String? mobileNumber,
  String? location,
  String? city,
  String? state,
  String? pin,
  dynamic guestId,
  num? userId,
  String? country,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => Data(  name: name ?? _name,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  mobileNumber: mobileNumber ?? _mobileNumber,
  location: location ?? _location,
  city: city ?? _city,
  state: state ?? _state,
  pin: pin ?? _pin,
  guestId: guestId ?? _guestId,
  userId: userId ?? _userId,
  country: country ?? _country,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String? get name => _name;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get mobileNumber => _mobileNumber;
  String? get location => _location;
  String? get city => _city;
  String? get state => _state;
  String? get pin => _pin;
  dynamic get guestId => _guestId;
  num? get userId => _userId;
  String? get country => _country;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['mobile_number'] = _mobileNumber;
    map['location'] = _location;
    map['city'] = _city;
    map['state'] = _state;
    map['pin'] = _pin;
    map['guest_id'] = _guestId;
    map['user_id'] = _userId;
    map['country'] = _country;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}