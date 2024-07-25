import 'package:isar/isar.dart';
part 'customer_collection.g.dart';

@Collection()
class CustomerColletion {
  Id id = Isar.autoIncrement;
  String? uid;
  String? shopcode;

  CustomerColletion({this.shopcode, this.uid});

  factory CustomerColletion.fromJson(Map<String, dynamic> json) {
    return CustomerColletion(
      uid: json['uid'],
      shopcode: json['shopcode'],
    );
  }
}
