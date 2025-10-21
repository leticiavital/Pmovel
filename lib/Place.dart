class Place {
  String? type;
  List<Features>? features;

  Place({this.type, this.features});

  Place.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  String? type;
  Properties? properties;
  Geometry? geometry;

  Features({this.type, this.properties, this.geometry});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    return data;
  }
}

class Properties {
  String? name;
  String? country;
  String? countryCode;
  String? region;
  String? state;
  String? county;
  String? city;
  String? municipality;
  String? postcode;
  String? district;
  String? suburb;
  String? street;
  String? housenumber;
  String? iso31662;
  double? lon;
  double? lat;
  String? stateCode;
  String? formatted;
  String? addressLine1;
  String? addressLine2;
  List<String>? categories;
  List<String>? details;
  Datasource? datasource;
  String? openingHours;
  Contact? contact;
  Facilities? facilities;
  String? placeId;

  Properties(
      {this.name,
        this.country,
        this.countryCode,
        this.region,
        this.state,
        this.county,
        this.city,
        this.municipality,
        this.postcode,
        this.district,
        this.suburb,
        this.street,
        this.housenumber,
        this.iso31662,
        this.lon,
        this.lat,
        this.stateCode,
        this.formatted,
        this.addressLine1,
        this.addressLine2,
        this.categories,
        this.details,
        this.datasource,
        this.openingHours,
        this.contact,
        this.facilities,
        this.placeId});

  Properties.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    countryCode = json['country_code'];
    region = json['region'];
    state = json['state'];
    county = json['county'];
    city = json['city'];
    municipality = json['municipality'];
    postcode = json['postcode'];
    district = json['district'];
    suburb = json['suburb'];
    street = json['street'];
    housenumber = json['housenumber'];
    iso31662 = json['iso3166_2'];
    lon = json['lon'];
    lat = json['lat'];
    stateCode = json['state_code'];
    formatted = json['formatted'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    categories = json['categories'].cast<String>();
    details = json['details'].cast<String>();
    datasource = json['datasource'] != null
        ? new Datasource.fromJson(json['datasource'])
        : null;
    openingHours = json['opening_hours'];
    contact =
    json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    facilities = json['facilities'] != null
        ? new Facilities.fromJson(json['facilities'])
        : null;
    placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.datasource != null) {
      data['datasource'] = this.datasource!.toJson();
    }
    data['opening_hours'] = this.openingHours;
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    if (this.facilities != null) {
      data['facilities'] = this.facilities!.toJson();
    }
    data['place_id'] = this.placeId;
    return data;
  }
}

class Datasource {
  String? sourcename;
  String? attribution;
  String? license;
  String? url;
  Raw? raw;

  Datasource(
      {this.sourcename, this.attribution, this.license, this.url, this.raw});

  Datasource.fromJson(Map<String, dynamic> json) {
    sourcename = json['sourcename'];
    attribution = json['attribution'];
    license = json['license'];
    url = json['url'];
    raw = json['raw'] != null ? new Raw.fromJson(json['raw']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sourcename'] = this.sourcename;
    data['attribution'] = this.attribution;
    data['license'] = this.license;
    data['url'] = this.url;
    if (this.raw != null) {
      data['raw'] = this.raw!.toJson();
    }
    return data;
  }
}

class Raw {
  String? name;
  String? phone;
  int? osmId;
  String? amenity;
  String? osmType;
  String? addrStreet;
  String? openingHours;
  String? internetAccess;
  int? addrHousenumber;
  String? addrCity;
  String? addrState;
  String? healthcare;
  String? addrSuburb;
  String? addrCountry;
  int? addrPostcode;
  String? healthcareSpeciality;

  Raw(
      {this.name,
        this.phone,
        this.osmId,
        this.amenity,
        this.osmType,
        this.addrStreet,
        this.openingHours,
        this.internetAccess,
        this.addrHousenumber,
        this.addrCity,
        this.addrState,
        this.healthcare,
        this.addrSuburb,
        this.addrCountry,
        this.addrPostcode,
        this.healthcareSpeciality});

  Raw.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    osmId = json['osm_id'];
    amenity = json['amenity'];
    osmType = json['osm_type'];
    addrStreet = json['addr:street'];
    openingHours = json['opening_hours'];
    internetAccess = json['internet_access'];
    addrHousenumber = json['addr:housenumber'];
    addrCity = json['addr:city'];
    addrState = json['addr:state'];
    healthcare = json['healthcare'];
    addrSuburb = json['addr:suburb'];
    addrCountry = json['addr:country'];
    addrPostcode = json['addr:postcode'];
    healthcareSpeciality = json['healthcare:speciality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? phone;

  Contact({this.phone});

  Contact.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    return data;
  }
}

class Facilities {
  bool? internetAccess;

  Facilities({this.internetAccess});

  Facilities.fromJson(Map<String, dynamic> json) {
    internetAccess = json['internet_access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['internet_access'] = this.internetAccess;
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}