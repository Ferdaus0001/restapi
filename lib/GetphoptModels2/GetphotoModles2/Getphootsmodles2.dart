/// status : "success"
/// data : [{"_id":"66fd7541340ab2edbe5d0fb2","avatar":"https://res.cloudinary.com/dj2edy2rg/image/upload/v1727886656/user-images/fmlpkxlh12jckw6eizya.jpg","createdAt":"2024-10-02T16:30:57.389Z","updatedAt":"2024-10-02T16:30:57.389Z"},{"_id":"66fd801d525409eb39f41fbb","avatar":"https://res.cloudinary.com/dj2edy2rg/image/upload/v1727889437/user-images/zzdg52ym8grbdwnxwftm.jpg","createdAt":"2024-10-02T17:17:17.872Z","updatedAt":"2024-10-02T17:17:17.872Z"},{"_id":"66fd844b2ed738c4bbf07932","avatar":"https://res.cloudinary.com/dj2edy2rg/image/upload/v1727890506/user-images/qewholaksnjf2vckdhwj.jpg","createdAt":"2024-10-02T17:35:07.353Z","updatedAt":"2024-10-02T17:35:07.353Z"},{"_id":"66fdeaea89eaaba4f5b667a2","avatar":"https://res.cloudinary.com/dj2edy2rg/image/upload/v1727916778/user-images/guxjcbfxzr0ayz8yf2bq.jpg","createdAt":"2024-10-03T00:52:58.864Z","updatedAt":"2024-10-03T00:52:58.864Z"}]

class Getphootsmodles2 {
  Getphootsmodles2({
      String? status, 
      List<Data>? data, required avatar,}){
    _status = status;
    _data = data;
}

  Getphootsmodles2.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _status;
  List<Data>? _data;
Getphootsmodles2 copyWith({  String? status,
  List<Data>? data,
}) => Getphootsmodles2(  status: status ?? _status,
  data: data ?? _data, avatar: null,
);
  String? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "66fd7541340ab2edbe5d0fb2"
/// avatar : "https://res.cloudinary.com/dj2edy2rg/image/upload/v1727886656/user-images/fmlpkxlh12jckw6eizya.jpg"
/// createdAt : "2024-10-02T16:30:57.389Z"
/// updatedAt : "2024-10-02T16:30:57.389Z"

class Data {
  Data({
      String? id, 
      String? avatar, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _avatar = avatar;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _avatar = json['avatar'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _avatar;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  String? id,
  String? avatar,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  avatar: avatar ?? _avatar,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get avatar => _avatar;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['avatar'] = _avatar;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}