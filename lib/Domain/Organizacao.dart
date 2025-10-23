class Organizations {
  String id;
  int npi;
  String name;
  String phone;
  Address address;
  List<String> specialties;

  Organizations({
    required this.id,
    required this.npi,
    required this.name,
    required this.phone,
    required this.address,
    required this.specialties,
  });

  Organizations.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        npi = json['npi'] ?? 0,
        name = json['name'] ?? '',
        phone = json['phone'] ?? '',
        address = (json['address'] != null)
            ? Address.fromJson(json['address'])
            : Address(city: '', state: ''),
        specialties = (json['specialties'] != null)
            ? List<String>.from(json['specialties'])
            : [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['npi'] = npi;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address.toJson();
    data['specialties'] = specialties;
    return data;
  }
}

class Address {
  String? city;
  String? state;

  Address({this.city, this.state});

  Address.fromJson(Map<String, dynamic> json)
      : city = json['city'],
        state = json['state'];

  Map<String, dynamic> toJson() => {
    'city': city,
    'state': state,
  };
}
