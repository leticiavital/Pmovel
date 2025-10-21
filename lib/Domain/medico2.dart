class Medico2 {
  List<Doctors>? doctors;
  int? page;
  int? total;

  Medico2({this.doctors, this.page, this.total});

  Medico2.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(new Doctors.fromJson(v));
      });
    }
    page = json['page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['total'] = this.total;
    return data;
  }
}

class Doctors {
  String? id;
  int? npi;
  String? name;
  String? gender;
  String? phone;
  Address? address;
  List<String>? credentials;
  List<String>? specialties;

  Doctors(
      {this.id,
        this.npi,
        required this.name,
        this.gender,
        this.phone,
        this.address,
        this.credentials,
        this.specialties});

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    npi = json['npi'];
    name = json['name'];
    gender = json['gender'];
    phone = json['phone'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    credentials = json['credentials'].cast<String>();
    specialties = json['specialties'].cast<String>();
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
    line1 = json['line1'];
    line2 = json['line2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
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