class Bac {
  int id;
  String name;
  Bac({required this.id, required this.name});
  factory Bac.fromJson(Map<String, dynamic> parsedBacJson) {
    return Bac(id: parsedBacJson['id'], name: parsedBacJson['Intitule']);
  }
}
