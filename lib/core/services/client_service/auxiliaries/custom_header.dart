import 'i_custom_header.dart';

class CustomHeader implements ICustomHeader {
  CustomHeader();
  @override
  Future<Map<String, dynamic>> getHeaderAutenticated() async {
    //Vai pegar do sharedP
    const token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlzcyI6IkFQSSBWb2xsLm1lZCIsImV4cCI6MTcxODg5OTUwNH0.EU-zJNBdyzgIfdHQ0Jt1dGS-RLf1sCQAKlAhwXmAfzc';
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }
}
