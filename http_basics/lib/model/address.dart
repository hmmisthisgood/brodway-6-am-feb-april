// "address": {
//   "street": "Kulas Light",
//   "suite": "Apt. 556",
//   "city": "Gwenborough",
//   "zipcode": "92998-3874",

//   "geo": {"lat": "-37.3159", "lng": "81.1496"}
// },

class Address {
  String street, suite, city, zipcode;
  Geolocation geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  factory Address.fromJson(Map json) {
    final _convertedGeo = Geolocation.fromjson(json['geo']);

    // final lat = json['geo']['lat'];
    // final long= json['geo']['lng'];

    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],

      geo: _convertedGeo,
    );
  }
}

class Geolocation {
  String latitude, longitude;

  Geolocation({required this.latitude, required this.longitude});

  factory Geolocation.fromjson(Map json) {
    return Geolocation(
      latitude: json['lat'],
      longitude: json['lng'],
    );
  }
}
