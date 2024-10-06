/// id : 1
/// name : "Singapore Changi Airport"
/// code : "SIN"
/// location : {"latitude":1.3644,"longitude":103.9915}
/// city : "Singapore"
/// country : "Singapore"
/// timezone : "Asia/Singapore"
/// terminals : [{"name":"Terminal 1","gates":[{"gate_number":"Gate A1","airlines":["Singapore Airlines","SilkAir"]},{"gate_number":"Gate A2","airlines":["AirAsia","Scoot"]}]},{"name":"Terminal 2","gates":[{"gate_number":"Gate B1","airlines":["Emirates","Qantas"]},{"gate_number":"Gate B2","airlines":["Cathay Pacific","Malaysia Airlines"]}]},{"name":"Terminal 3","gates":[{"gate_number":"Gate C1","airlines":["Jetstar","Tigerair"]},{"gate_number":"Gate C2","airlines":["KLM","Delta Air Lines"]}]}]
/// airlines : ["Singapore Airlines","SilkAir","AirAsia","Scoot","Emirates","Qantas","Cathay Pacific","Malaysia Airlines","Jetstar","Tigerair","KLM","Delta Air Lines"]
/// services : ["Parking","Restaurants","Shops","ATM","Car Rental"]
/// contact_info : {"phone":"+65 6595 6868","email":"feedback@changiairport.com","website":"https://www.changiairport.com"}

class ProdectModles {
  ProdectModles({
      num? id, 
      String? name, 
      String? code, 
      Location? location, 
      String? city, 
      String? country, 
      String? timezone, 
      List<Terminals>? terminals, 
      List<String>? airlines, 
      List<String>? services, 
      ContactInfo? contactInfo,}){
    _id = id;
    _name = name;
    _code = code;
    _location = location;
    _city = city;
    _country = country;
    _timezone = timezone;
    _terminals = terminals;
    _airlines = airlines;
    _services = services;
    _contactInfo = contactInfo;
}

  ProdectModles.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _city = json['city'];
    _country = json['country'];
    _timezone = json['timezone'];
    if (json['terminals'] != null) {
      _terminals = [];
      json['terminals'].forEach((v) {
        _terminals?.add(Terminals.fromJson(v));
      });
    }
    _airlines = json['airlines'] != null ? json['airlines'].cast<String>() : [];
    _services = json['services'] != null ? json['services'].cast<String>() : [];
    _contactInfo = json['contact_info'] != null ? ContactInfo.fromJson(json['contact_info']) : null;
  }
  num? _id;
  String? _name;
  String? _code;
  Location? _location;
  String? _city;
  String? _country;
  String? _timezone;
  List<Terminals>? _terminals;
  List<String>? _airlines;
  List<String>? _services;
  ContactInfo? _contactInfo;
ProdectModles copyWith({  num? id,
  String? name,
  String? code,
  Location? location,
  String? city,
  String? country,
  String? timezone,
  List<Terminals>? terminals,
  List<String>? airlines,
  List<String>? services,
  ContactInfo? contactInfo,
}) => ProdectModles(  id: id ?? _id,
  name: name ?? _name,
  code: code ?? _code,
  location: location ?? _location,
  city: city ?? _city,
  country: country ?? _country,
  timezone: timezone ?? _timezone,
  terminals: terminals ?? _terminals,
  airlines: airlines ?? _airlines,
  services: services ?? _services,
  contactInfo: contactInfo ?? _contactInfo,
);
  num? get id => _id;
  String? get name => _name;
  String? get code => _code;
  Location? get location => _location;
  String? get city => _city;
  String? get country => _country;
  String? get timezone => _timezone;
  List<Terminals>? get terminals => _terminals;
  List<String>? get airlines => _airlines;
  List<String>? get services => _services;
  ContactInfo? get contactInfo => _contactInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['city'] = _city;
    map['country'] = _country;
    map['timezone'] = _timezone;
    if (_terminals != null) {
      map['terminals'] = _terminals?.map((v) => v.toJson()).toList();
    }
    map['airlines'] = _airlines;
    map['services'] = _services;
    if (_contactInfo != null) {
      map['contact_info'] = _contactInfo?.toJson();
    }
    return map;
  }

}

/// phone : "+65 6595 6868"
/// email : "feedback@changiairport.com"
/// website : "https://www.changiairport.com"

class ContactInfo {
  ContactInfo({
      String? phone, 
      String? email, 
      String? website,}){
    _phone = phone;
    _email = email;
    _website = website;
}

  ContactInfo.fromJson(dynamic json) {
    _phone = json['phone'];
    _email = json['email'];
    _website = json['website'];
  }
  String? _phone;
  String? _email;
  String? _website;
ContactInfo copyWith({  String? phone,
  String? email,
  String? website,
}) => ContactInfo(  phone: phone ?? _phone,
  email: email ?? _email,
  website: website ?? _website,
);
  String? get phone => _phone;
  String? get email => _email;
  String? get website => _website;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    map['email'] = _email;
    map['website'] = _website;
    return map;
  }

}

/// name : "Terminal 1"
/// gates : [{"gate_number":"Gate A1","airlines":["Singapore Airlines","SilkAir"]},{"gate_number":"Gate A2","airlines":["AirAsia","Scoot"]}]

class Terminals {
  Terminals({
      String? name, 
      List<Gates>? gates,}){
    _name = name;
    _gates = gates;
}

  Terminals.fromJson(dynamic json) {
    _name = json['name'];
    if (json['gates'] != null) {
      _gates = [];
      json['gates'].forEach((v) {
        _gates?.add(Gates.fromJson(v));
      });
    }
  }
  String? _name;
  List<Gates>? _gates;
Terminals copyWith({  String? name,
  List<Gates>? gates,
}) => Terminals(  name: name ?? _name,
  gates: gates ?? _gates,
);
  String? get name => _name;
  List<Gates>? get gates => _gates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_gates != null) {
      map['gates'] = _gates?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// gate_number : "Gate A1"
/// airlines : ["Singapore Airlines","SilkAir"]

class Gates {
  Gates({
      String? gateNumber, 
      List<String>? airlines,}){
    _gateNumber = gateNumber;
    _airlines = airlines;
}

  Gates.fromJson(dynamic json) {
    _gateNumber = json['gate_number'];
    _airlines = json['airlines'] != null ? json['airlines'].cast<String>() : [];
  }
  String? _gateNumber;
  List<String>? _airlines;
Gates copyWith({  String? gateNumber,
  List<String>? airlines,
}) => Gates(  gateNumber: gateNumber ?? _gateNumber,
  airlines: airlines ?? _airlines,
);
  String? get gateNumber => _gateNumber;
  List<String>? get airlines => _airlines;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gate_number'] = _gateNumber;
    map['airlines'] = _airlines;
    return map;
  }

}

/// latitude : 1.3644
/// longitude : 103.9915

class Location {
  Location({
      num? latitude, 
      num? longitude,}){
    _latitude = latitude;
    _longitude = longitude;
}

  Location.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  num? _latitude;
  num? _longitude;
Location copyWith({  num? latitude,
  num? longitude,
}) => Location(  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
);
  num? get latitude => _latitude;
  num? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }

}