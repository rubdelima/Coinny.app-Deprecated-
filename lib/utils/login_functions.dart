import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learn/classes.dart';


Future<String?> getPersonToken() async {
  final storage = new FlutterSecureStorage();
  String? person =  await storage.read(key: "Person");
  return person;
}

Future<void> savePersonToken(String token) async {
  final storage = new FlutterSecureStorage();
  await storage.write(key: "Person", value: token);
}

Future<Person?> loadLocalPerson() async {
  const storage = FlutterSecureStorage();
  String? person =  await storage.read(key: "Person");
  if (person == null) {return null;}
  if(person.contains("@")){
    return loadParent(person);}
  return loadChildren(person);
}

Future<void> clearLocalPerson() async {
  const storage = FlutterSecureStorage();
  storage.delete(key: "Person");
}