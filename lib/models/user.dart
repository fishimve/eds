const String usersTableName = 'users';
const String addressesTableName = 'addresses';
const String geoTableName = 'geo';
const String companiesTableName = 'companies';

class UsersTable {
  static const String id = 'id';
  static const String name = 'name';
  static const String username = 'username';
  static const String email = 'email';
  static const String phone = 'phone';
  static const String website = 'website';
  static const String address = 'address';
  static const String company = 'company';
}

class User {
  final int? id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;
  User({
    this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  static User fromMap(Map<dynamic, dynamic> map) {
    return User(
      id: map[UsersTable.id] as int,
      name: map[UsersTable.name] as String,
      username: map[UsersTable.username] as String,
      email: map[UsersTable.email] as String,
      phone: map[UsersTable.phone] as String,
      website: map[UsersTable.website] as String,
      address: Address.fromMap(map[UsersTable.address]),
      company: Company.fromMap(map[UsersTable.company]),
    );
  }

  Map<String, dynamic> toMap() => {
        UsersTable.id: id,
        UsersTable.name: name,
        UsersTable.username: username,
        UsersTable.email: email,
        UsersTable.phone: phone,
        UsersTable.website: website,
      };
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

  static Address fromMap(Map<dynamic, dynamic> map) => Address(
          street: map['street'] as String,
          suite: map['suite'] as String,
          city: map['city'] as String,
          zipcode: map['zipcode'] as String,
          geo: {
            'lat': map['geo']['lat'],
            'lng': map['geo']['lng'],
          });

  Map<String, dynamic> toMap() => {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
      };
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

  static Company fromMap(Map<dynamic, dynamic> map) => Company(
        name: map['name'] as String,
        catchPhrase: map['catchPhrase'] as String,
        bs: map['bs'] as String,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'catchPhrase': catchPhrase,
        'bs': bs,
      };
}
