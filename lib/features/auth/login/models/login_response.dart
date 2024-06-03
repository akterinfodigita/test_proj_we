class LoginResponse {
  LoginResponse({
    this.data,
    this.user,
  });

  LoginResponse.fromJson(dynamic json) {
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }
  LoginData? data;
  UserData? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class UserData {
  UserData({
    this.id,
    this.prefixId,
    this.photoUrl,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.street,
    this.houseNumber,
    this.zipCode,
    this.city,
    this.country,
    this.countryIsoCode,
    this.phoneNumber,
    this.fullPhoneNumber,
    this.languageId,
    this.createdAt,
  });

  UserData.fromJson(dynamic json) {
    id = json['id'];
    prefixId = json['prefix_id'];
    photoUrl = json['photo_url'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    name = json['name'];
    email = json['email'];
    street = json['street'];
    houseNumber = json['house_number'];
    zipCode = json['zip_code'];
    city = json['city'];
    country = json['country'];
    countryIsoCode = json['country_iso_code'];
    phoneNumber = json['phone_number'];
    fullPhoneNumber = json['full_phone_number'] ?? '';
    languageId = json['language_id'];
    createdAt = json['created_at'];
  }
  int? id;
  String? prefixId;
  String? photoUrl;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
  String? street;
  String? houseNumber;
  String? zipCode;
  String? city;
  String? country;
  String? countryIsoCode;
  String? phoneNumber;
  dynamic fullPhoneNumber;
  int? languageId;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['prefix_id'] = prefixId;
    map['photo_url'] = photoUrl;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['name'] = name;
    map['email'] = email;
    map['street'] = street;
    map['house_number'] = houseNumber;
    map['zip_code'] = zipCode;
    map['city'] = city;
    map['country'] = country;
    map['country_iso_code'] = countryIsoCode;
    map['phone_number'] = phoneNumber;
    map['full_phone_number'] = fullPhoneNumber;
    map['language_id'] = languageId;
    map['created_at'] = createdAt;
    return map;
  }
}

class LoginData {
  LoginData({
    this.token,
  });

  LoginData.fromJson(dynamic json) {
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }
  Token? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (token != null) {
      map['token'] = token?.toJson();
    }
    return map;
  }
}

class Token {
  Token({
    this.accessToken,
    this.tokenType,
  });

  Token.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }
  String? accessToken;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    return map;
  }
}
