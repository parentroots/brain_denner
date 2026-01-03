class ContactModel {
  String? id;
  String? email;
  String? phone;
  String? whatsApp;
  String? createdAt;
  String? updatedAt;
  int? v;

  ContactModel({
    this.id,
    this.email,
    this.phone,
    this.whatsApp,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    id: json['_id'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    whatsApp: json['whatsApp'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    v: json['__v'] as int?,
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'email': email,
    'phone': phone,
    'whatsApp': whatsApp,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': v,
  };
}
