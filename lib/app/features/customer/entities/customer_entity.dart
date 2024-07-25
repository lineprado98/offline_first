import 'package:offline_first/app/features/customer/entities/address_entity.dart';

class CustomerEntity {
  final String? uid;
  final String? shopcode;
  final String? code;
  final String? ddi;
  final num? debitValue;
  final num? creditValue;
  final String? flag;
  final num? id;
  final bool? active;
  final String? name;
  final dynamic birthdate;
  final String? cpfCnpj;
  final String? rg;
  final bool? physicalPerson;
  final bool? juridicalPerson;
  final dynamic gender;
  final dynamic mother;
  final dynamic father;
  final String? extraInfo;
  final String? email;
  final String? obs;
  final String? phone;
  final String? addressId;
  List<AddressEntity>? addresses;
  final num? salesQty;
  final num? salesValue;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CustomerEntity({
    required this.uid,
    required this.shopcode,
    required this.code,
    required this.ddi,
    required this.debitValue,
    required this.creditValue,
    required this.flag,
    required this.id,
    required this.active,
    required this.name,
    required this.birthdate,
    required this.cpfCnpj,
    required this.rg,
    required this.physicalPerson,
    required this.juridicalPerson,
    required this.gender,
    required this.mother,
    required this.father,
    required this.extraInfo,
    required this.email,
    required this.obs,
    required this.phone,
    required this.addressId,
    this.addresses,
    required this.salesQty,
    required this.salesValue,
    required this.createdAt,
    required this.updatedAt,
  });
  factory CustomerEntity.empty() {
    return CustomerEntity(
      uid: '',
      shopcode: '',
      code: '',
      ddi: '',
      debitValue: 0,
      creditValue: 0,
      flag: '',
      id: 0,
      active: false,
      name: '',
      birthdate: '',
      cpfCnpj: '',
      rg: '',
      physicalPerson: false,
      juridicalPerson: false,
      gender: '',
      mother: '',
      father: '',
      extraInfo: '',
      email: '',
      obs: '',
      phone: '',
      addressId: '',
      addresses: [],
      salesQty: 0,
      salesValue: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  CustomerEntity copywith({
    String? uid,
    String? shopcode,
    String? code,
    String? ddi,
    num? debitValue,
    num? creditValue,
    String? flag,
    num? id,
    bool? active,
    String? name,
    dynamic birthdate,
    String? cpfCnpj,
    String? rg,
    bool? physicalPerson,
    bool? juridicalPerson,
    dynamic gender,
    dynamic mother,
    dynamic father,
    String? extraInfo,
    String? email,
    String? obs,
    String? phone,
    String? addressId,
    List<AddressEntity>? addresses,
    num? salesQty,
    num? salesValue,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CustomerEntity(
      uid: uid ?? this.uid,
      shopcode: shopcode ?? this.shopcode,
      code: code ?? this.code,
      ddi: ddi ?? this.ddi,
      debitValue: debitValue ?? this.debitValue,
      creditValue: creditValue ?? this.creditValue,
      flag: flag ?? this.flag,
      id: id ?? this.id,
      active: active ?? this.active,
      name: name ?? this.name,
      birthdate: birthdate ?? this.birthdate,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      rg: rg ?? this.rg,
      physicalPerson: physicalPerson ?? this.physicalPerson,
      juridicalPerson: juridicalPerson ?? this.juridicalPerson,
      gender: gender ?? this.gender,
      mother: mother ?? this.mother,
      father: father ?? this.father,
      extraInfo: extraInfo ?? this.extraInfo,
      email: email ?? this.email,
      obs: obs ?? this.obs,
      phone: phone ?? this.phone,
      addressId: addressId ?? this.addressId,
      addresses: addresses ?? this.addresses,
      salesQty: salesQty ?? this.salesQty,
      salesValue: salesValue ?? this.salesValue,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'shopcode': shopcode,
      'code': code,
      'ddi': ddi,
      'debitValue': debitValue,
      'creditValue': creditValue,
      'flag': flag,
      'id': id,
      'active': active,
      'name': name,
      'birthdate': birthdate?.toString(), // Assumindo que birthdate é do tipo DateTime ou String
      'cpfCnpj': cpfCnpj,
      'rg': rg,
      'physicalPerson': physicalPerson,
      'juridicalPerson': juridicalPerson,
      'gender': gender,
      'mother': mother,
      'father': father,
      'extraInfo': extraInfo,
      'email': email,
      'obs': obs,
      'phone': phone,
      'addressId': addressId,
      'addresses': addresses?.map((address) => address.toJson()).toList(),
      'salesQty': salesQty,
      'salesValue': salesValue,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
