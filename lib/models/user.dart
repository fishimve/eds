class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address? address;
  final String phone;
  final String website;
  final Company? company;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  static User fromMap(Map<String, dynamic> map) => User(
        id: map.containsKey('id') ? map['id'] : 0,
        name: map.containsKey('name') ? map['name'] : '-',
        username: map.containsKey('username') ? map['username'] : '-',
        email: map.containsKey('email') ? map['email'] : '-',
        phone: map.containsKey('phone') ? map['phone'] : '-',
        website: map.containsKey('website') ? map['website'] : '-',
        address:
            map.containsKey('address') ? Address.fromMap(map['address']) : null,
        company:
            map.containsKey('company') ? Company.fromMap(map['company']) : null,
      );
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Map<String, String> geo;
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  static Address fromMap(Map<String, dynamic> map) => Address(
        street: map.containsKey('street') ? map['street'] : '-',
        suite: map.containsKey('suite') ? map['suite'] : '-',
        city: map.containsKey('city') ? map['city'] : '-',
        zipcode: map.containsKey('zipcode') ? map['zipcode'] : '-',
        geo: map.containsKey('geo')
            ? {
                'latitude': map['geo']['lat'],
                'longitude': map['geo']['lng'],
              }
            : {},
      );
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  static Company fromMap(Map<String, dynamic> map) => Company(
        name: map.containsKey('name') ? map['name'] : '-',
        catchPhrase: map.containsKey('catchPhrase') ? map['catchPhrase'] : '-',
        bs: map.containsKey('bs') ? map['bs'] : '-',
      );
}
