class Informacoes {
  String? id;
  String? phone;
  String? email;
  String? website;

  Informacoes({this.id, this.phone, this.email, this.website});

  Informacoes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    email = json['email'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['website'] = this.website;
    return data;
  }
}
