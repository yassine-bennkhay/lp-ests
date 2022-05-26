class Diplome {
  int id;
  String intitule;
  String abreviation;
  Diplome(
      {required this.id, required this.intitule, required this.abreviation});
  factory Diplome.fromJson(Map<String, dynamic> diplomeJson) {
    return Diplome(
        id: diplomeJson['id'],
        intitule: diplomeJson['Intitule'],
        abreviation: diplomeJson['abreviation']);
  }
}
