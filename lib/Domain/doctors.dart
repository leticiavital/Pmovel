class Doctors {
  late String id;
  late int npi;
  late String name;
  late String gender;
  late String phone;
  late Address address;
  late List<String> credentials;
  late List<String> specialties;

  Doctors(
      {required this.id,
        required this.npi,
        required this.name,
        required this.gender,
        required this.phone,
        required this.address,
        required this.credentials,
        required this.specialties});

  Doctors.fromJson(Map<String, dynamic> json) {

    id = json['id'] ?? '';
    npi = json['npi'] ?? '';
    name = json['name'] ?? '';
    gender = json['gender'] ?? '';
    phone = json['phone'] ?? '';
    address = (json['address'] != null ? new Address.fromJson(json['address']) : null)!;
    credentials = json['credentials'].cast<String>() ?? '';
    specialties = json['specialties'].cast<String>() ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['npi'] = this.npi;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['credentials'] = this.credentials;
    data['specialties'] = this.specialties;
    return data;
  }
}


class Address {
  String? line1;
  String? line2;
  String? city;
  String? state;
  String? country;
  String? zip;

  Address(
      {this.line1, this.line2, this.city, this.state, this.country, this.zip});

  Address.fromJson(Map<String, dynamic> json) {
    line1 = json['line1'] ?? '';
    line2 = json['line2'] ?? '';
    city = json['city'] ?? '';
    state = json['state'] ?? '';
    country = json['country'] ?? '';
    zip = json['zip'] ?? '';
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line1'] = this.line1;
    data['line2'] = this.line2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip'] = this.zip;
    return data;
  }
}

