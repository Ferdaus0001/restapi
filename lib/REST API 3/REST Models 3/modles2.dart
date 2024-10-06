/// postId : 1
/// id : 1
/// name : "id labore ex et quam laborum"
/// email : "Eliseo@gardner.biz"
/// body : "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"

class Modles2 {
  Modles2({
      num? postId, 
      num? id, 
      String? name, 
      String? email, 
      String? body,}){
    _postId = postId;
    _id = id;
    _name = name;
    _email = email;
    _body = body;
}

  Modles2.fromJson(dynamic json) {
    _postId = json['postId'];
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _body = json['body'];
  }
  num? _postId;
  num? _id;
  String? _name;
  String? _email;
  String? _body;
Modles2 copyWith({  num? postId,
  num? id,
  String? name,
  String? email,
  String? body,
}) => Modles2(  postId: postId ?? _postId,
  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  body: body ?? _body,
);
  num? get postId => _postId;
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postId'] = _postId;
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['body'] = _body;
    return map;
  }

}