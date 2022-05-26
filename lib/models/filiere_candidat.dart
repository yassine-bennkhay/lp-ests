class FilierCandidat {
  int id;
  String intitule;
  FilierCandidat({required this.id, required this.intitule});
  factory FilierCandidat.fromJson(Map<String, dynamic> fCandidatJson) {
    return FilierCandidat(
        id: fCandidatJson['id'], intitule: fCandidatJson['Intitule']);
  }
}
