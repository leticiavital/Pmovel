class FeaturesCollection {
  String? type;
  List<Features>? features;

  FeaturesCollection({this.type, this.features});

  FeaturesCollection.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['features'] != null) {
      features = [];
      json['features'].forEach((v) {
        features!.add(Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    final features = this.features;
    if (features != null) {
      data['features'] = features.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  late String type;
  late Properties properties;
  late Geometry geometry;

  Features({required this.type, required this.properties, required this.geometry});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = (json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null)!;
    geometry = (json['geometry'] != null
        ? Geometry.fromJson(json['geometry'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['properties'] = this.properties.toJson();
    data['geometry'] = this.geometry.toJson();
    return data;
  }
}

class Properties {
  late String name;
  late String country;
  late String countryCode;
  late String region;
  late String state;
  late String county;
  late String city;
  late String municipality;
  late String postcode;
  late String district;
  late String suburb;
  late String street;
  late String housenumber;
  late String iso31662;
  late double lon;
  late double lat;
  late String stateCode;
  late String formatted;
  late String addressLine1;
  late String addressLine2;
  late List<String> categories;
  late List<String> details;
  late Datasource datasource;
  late String openingHours;
  late Contact contact;
  late Facilities facilities;
  late String placeId;

  Properties({
    required this.name,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.state,
    required this.county,
    required this.city,
    required this.municipality,
    required this.postcode,
    required this.district,
    required this.suburb,
    required this.street,
    required this.housenumber,
    required this.iso31662,
    required this.lon,
    required this.lat,
    required this.stateCode,
    required this.formatted,
    required this.addressLine1,
    required this.addressLine2,
    required this.categories,
    required this.details,
    required this.datasource,
    required this.openingHours,
    required this.contact,
    required this.facilities,
    required this.placeId
  });

  Properties.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    country = json['country'] ?? '';
    countryCode = json['country_code'] ?? '';
    region = json['region'] ?? '';
    state = json['state'] ?? '';
    county = json['county'] ?? '';
    city = json['city'] ?? '';
    municipality = json['municipality'] ?? '';
    postcode = json['postcode'] ?? '';
    district = json['district'] ?? '';
    suburb = json['suburb'] ?? '';
    street = json['street'] ?? '';
    housenumber = json['housenumber'] ?? '';
    iso31662 = json['iso3166_2'] ?? '';
    lon = json['lon']?.toDouble() ?? 0.0;
    lat = json['lat']?.toDouble() ?? 0.0;
    stateCode = json['state_code'] ?? '';
    formatted = json['formatted'] ?? '';
    addressLine1 = json['address_line1'] ?? '';
    addressLine2 = json['address_line2'] ?? '';
    categories = json['categories'] != null ? List<String>.from(json['categories']) : [];
    details = json['details'] != null ? List<String>.from(json['details']) : [];
    datasource = json['datasource'] != null
        ? Datasource.fromJson(json['datasource'])
        : Datasource(sourcename: '', attribution: '', license: '', url: '', raw: Raw.empty());
    openingHours = json['opening_hours'] ?? '';
    contact = json['contact'] != null
        ? Contact.fromJson(json['contact'])
        : Contact(phone: '');
    facilities = json['facilities'] != null
        ? Facilities.fromJson(json['facilities'])
        : Facilities(internetAccess: false);
    placeId = json['place_id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['region'] = this.region;
    data['state'] = this.state;
    data['county'] = this.county;
    data['city'] = this.city;
    data['municipality'] = this.municipality;
    data['postcode'] = this.postcode;
    data['district'] = this.district;
    data['suburb'] = this.suburb;
    data['street'] = this.street;
    data['housenumber'] = this.housenumber;
    data['iso3166_2'] = this.iso31662;
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    data['state_code'] = this.stateCode;
    data['formatted'] = this.formatted;
    data['address_line1'] = this.addressLine1;
    data['address_line2'] = this.addressLine2;
    data['categories'] = this.categories;
    data['details'] = this.details;
    data['datasource'] = this.datasource.toJson();
    data['opening_hours'] = this.openingHours;
    data['contact'] = this.contact.toJson();
    data['facilities'] = this.facilities.toJson();
    data['place_id'] = this.placeId;
    return data;
  }
}

class Datasource {
  late String sourcename;
  late String attribution;
  late String license;
  late String url;
  late Raw raw;

  Datasource({
    required this.sourcename,
    required this.attribution,
    required this.license,
    required this.url,
    required this.raw
  });

  Datasource.fromJson(Map<String, dynamic> json) {
    sourcename = json['sourcename'] ?? '';
    attribution = json['attribution'] ?? '';
    license = json['license'] ?? '';
    url = json['url'] ?? '';
    raw = json['raw'] != null ? Raw.fromJson(json['raw']) : Raw.empty();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sourcename'] = this.sourcename;
    data['attribution'] = this.attribution;
    data['license'] = this.license;
    data['url'] = this.url;
    data['raw'] = this.raw.toJson();
    return data;
  }
}

class Raw {
  late String name;
  late String phone;
  late int osmId;
  late String amenity;
  late String osmType;
  late String addrStreet;
  late String openingHours;
  late String internetAccess;
  late int addrHousenumber;
  late String addrCity;
  late String addrState;
  late String healthcare;
  late String addrSuburb;
  late String addrCountry;
  late int addrPostcode;
  late String healthcareSpeciality;

  Raw({
    required this.name,
    required this.phone,
    required this.osmId,
    required this.amenity,
    required this.osmType,
    required this.addrStreet,
    required this.openingHours,
    required this.internetAccess,
    required this.addrHousenumber,
    required this.addrCity,
    required this.addrState,
    required this.healthcare,
    required this.addrSuburb,
    required this.addrCountry,
    required this.addrPostcode,
    required this.healthcareSpeciality
  });

  Raw.empty()
      : name = '',
        phone = '',
        osmId = 0,
        amenity = '',
        osmType = '',
        addrStreet = '',
        openingHours = '',
        internetAccess = '',
        addrHousenumber = 0,
        addrCity = '',
        addrState = '',
        healthcare = '',
        addrSuburb = '',
        addrCountry = '',
        addrPostcode = 0,
        healthcareSpeciality = '';

  Raw.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    phone = json['phone'] ?? '';
    osmId = json['osm_id'] ?? 0;
    amenity = json['amenity'] ?? '';
    osmType = json['osm_type'] ?? '';
    addrStreet = json['addr:street'] ?? '';
    openingHours = json['opening_hours'] ?? '';
    internetAccess = json['internet_access'] ?? '';
    addrHousenumber = json['addr:housenumber'] ?? 0;
    addrCity = json['addr:city'] ?? '';
    addrState = json['addr:state'] ?? '';
    healthcare = json['healthcare'] ?? '';
    addrSuburb = json['addr:suburb'] ?? '';
    addrCountry = json['addr:country'] ?? '';
    addrPostcode = json['addr:postcode'] ?? 0;
    healthcareSpeciality = json['healthcare:speciality'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['osm_id'] = this.osmId;
    data['amenity'] = this.amenity;
    data['osm_type'] = this.osmType;
    data['addr:street'] = this.addrStreet;
    data['opening_hours'] = this.openingHours;
    data['internet_access'] = this.internetAccess;
    data['addr:housenumber'] = this.addrHousenumber;
    data['addr:city'] = this.addrCity;
    data['addr:state'] = this.addrState;
    data['healthcare'] = this.healthcare;
    data['addr:suburb'] = this.addrSuburb;
    data['addr:country'] = this.addrCountry;
    data['addr:postcode'] = this.addrPostcode;
    data['healthcare:speciality'] = this.healthcareSpeciality;
    return data;
  }
}

class Contact {
  late String phone;

  Contact({required this.phone});

  Contact.fromJson(Map<String, dynamic> json) {
    phone = json['phone'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phone'] = this.phone;
    return data;
  }
}

class Facilities {
  late bool internetAccess;

  Facilities({required this.internetAccess});

  Facilities.fromJson(Map<String, dynamic> json) {
    internetAccess = json['internet_access'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['internet_access'] = this.internetAccess;
    return data;
  }
}

class Geometry {
  late String type;
  late List<double> coordinates;

  Geometry({required this.type, required this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? '';
    coordinates = json['coordinates'] != null
        ? List<double>.from(json['coordinates'].map((x) => x.toDouble()))
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}