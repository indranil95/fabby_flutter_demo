/// data : {"customerAddress":[{"id":818,"user_id":891,"address_ref":"","makani_number":null,"location":"kalna ,shyamrai para ,p.o-kalna,d.t-burdwan,pin-713409 kalna ,shyamrai para ,p.o-kalna,d.t-burdwan,pin-713409 k","city":"kalna","state":"West Bengal","pin":713409,"country":"India","apartment":"","name":"indranil","last_name":"Goswami","email":"indranil@appic.me","mobile_number":"8918624052","address_instructions":"","lat":"0.00000000","lng":"0.00000000","guest_id":null,"created_at":"2024-09-13 17:14:35","updated_at":"2024-09-13 17:14:35","deleted_at":null},{"id":819,"user_id":891,"address_ref":"","makani_number":null,"location":"jcjc , jfjc","city":"kalna","state":"Rajasthan","pin":713409,"country":"India","apartment":"","name":"indranil","last_name":"goswami","email":"indranil@appic.me","mobile_number":"8918624052","address_instructions":"","lat":"0.00000000","lng":"0.00000000","guest_id":null,"created_at":"2024-09-16 11:07:59","updated_at":"2024-09-16 11:07:59","deleted_at":null},{"id":820,"user_id":891,"address_ref":"","makani_number":null,"location":"hchc , hfjfhf","city":"hxhf","state":"Manipur","pin":713409,"country":"India","apartment":"","name":"hdhdrh","last_name":"hdhdfh","email":"indranil@appic.me","mobile_number":"8918624052","address_instructions":"","lat":"0.00000000","lng":"0.00000000","guest_id":null,"created_at":"2024-09-16 11:34:21","updated_at":"2024-09-16 11:34:21","deleted_at":null}]}
/// success : true
/// error : 200
/// status_code : "Successfully fetched customer address"

class CheckoutModel {
  CheckoutModel({
      Data? data, 
      bool? success, 
      num? error, 
      String? statusCode,}){
    _data = data;
    _success = success;
    _error = error;
    _statusCode = statusCode;
}

  CheckoutModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _error = json['error'];
    _statusCode = json['status_code'];
  }
  Data? _data;
  bool? _success;
  num? _error;
  String? _statusCode;
CheckoutModel copyWith({  Data? data,
  bool? success,
  num? error,
  String? statusCode,
}) => CheckoutModel(  data: data ?? _data,
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

/// customerAddress : [{"id":818,"user_id":891,"address_ref":"","makani_number":null,"location":"kalna ,shyamrai para ,p.o-kalna,d.t-burdwan,pin-713409 kalna ,shyamrai para ,p.o-kalna,d.t-burdwan,pin-713409 k","city":"kalna","state":"West Bengal","pin":713409,"country":"India","apartment":"","name":"indranil","last_name":"Goswami","email":"indranil@appic.me","mobile_number":"8918624052","address_instructions":"","lat":"0.00000000","lng":"0.00000000","guest_id":null,"created_at":"2024-09-13 17:14:35","updated_at":"2024-09-13 17:14:35","deleted_at":null},{"id":819,"user_id":891,"address_ref":"","makani_number":null,"location":"jcjc , jfjc","city":"kalna","state":"Rajasthan","pin":713409,"country":"India","apartment":"","name":"indranil","last_name":"goswami","email":"indranil@appic.me","mobile_number":"8918624052","address_instructions":"","lat":"0.00000000","lng":"0.00000000","guest_id":null,"created_at":"2024-09-16 11:07:59","updated_at":"2024-09-16 11:07:59","deleted_at":null},{"id":820,"user_id":891,"address_ref":"","makani_number":null,"location":"hchc , hfjfhf","city":"hxhf","state":"Manipur","pin":713409,"country":"India","apartment":"","name":"hdhdrh","last_name":"hdhdfh","email":"indranil@appic.me","mobile_number":"8918624052","address_instructions":"","lat":"0.00000000","lng":"0.00000000","guest_id":null,"created_at":"2024-09-16 11:34:21","updated_at":"2024-09-16 11:34:21","deleted_at":null}]

class Data {
  Data({
      List<CustomerAddress>? customerAddress,}){
    _customerAddress = customerAddress;
}

  Data.fromJson(dynamic json) {
    if (json['customerAddress'] != null) {
      _customerAddress = [];
      json['customerAddress'].forEach((v) {
        _customerAddress?.add(CustomerAddress.fromJson(v));
      });
    }
  }
  List<CustomerAddress>? _customerAddress;
Data copyWith({  List<CustomerAddress>? customerAddress,
}) => Data(  customerAddress: customerAddress ?? _customerAddress,
);
  List<CustomerAddress>? get customerAddress => _customerAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_customerAddress != null) {
      map['customerAddress'] = _customerAddress?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 818
/// user_id : 891
/// address_ref : ""
/// makani_number : null
/// location : "kalna ,shyamrai para ,p.o-kalna,d.t-burdwan,pin-713409 kalna ,shyamrai para ,p.o-kalna,d.t-burdwan,pin-713409 k"
/// city : "kalna"
/// state : "West Bengal"
/// pin : 713409
/// country : "India"
/// apartment : ""
/// name : "indranil"
/// last_name : "Goswami"
/// email : "indranil@appic.me"
/// mobile_number : "8918624052"
/// address_instructions : ""
/// lat : "0.00000000"
/// lng : "0.00000000"
/// guest_id : null
/// created_at : "2024-09-13 17:14:35"
/// updated_at : "2024-09-13 17:14:35"
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