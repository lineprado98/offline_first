class AddressEntity {
  final String? district;
  final String? zipcode;
  final String? city;
  final String? cityCode;
  final String? number;
  final String? street;
  final String? complement;
  final String? addressId;
  final String? state;
  final String? country;

  AddressEntity({
    this.district,
    this.zipcode,
    this.city,
    this.cityCode,
    this.number,
    this.street,
    this.complement,
    this.addressId,
    this.state,
    this.country,
  });

  Map<String, dynamic> toJson() {
    return {
      'district': district,
      'zipcode': zipcode,
      'city': city,
      'cityCode': cityCode,
      'number': number,
      'street': street,
      'complement': complement,
      'addressId': addressId,
      'state': state,
      'country': country,
    };
  }
}
