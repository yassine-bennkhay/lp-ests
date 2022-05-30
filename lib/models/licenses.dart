class License {
  int id;
  late final String name, description, img;

  License({
    required this.id,
    required this.name,
    required this.img,
    required this.description,
  });
  factory License.fromJson(Map<String, dynamic> comingJson) {
    return License(
        id: comingJson['id'],
        img: "assets/images/hat.png",
        name: comingJson['Intitule'],
        description: comingJson['description']);
  }
}

class LicenseList {
  List<License> licenses;
  LicenseList({
    required this.licenses,
  });
  factory LicenseList.fromJson(List<dynamic> parsedJson) {
    List<License> listOfLisenses = [];
    listOfLisenses = parsedJson.map((i) => License.fromJson(i)).toList();
    return LicenseList(licenses: listOfLisenses);
  }
}

// List<License> licenses = [
//   License(
//     id: 1,
//     img: "assets/images/hat.png",
//     name: "LP informatique",
//     description:
//         "La licenceprofessionnelle en Mécatronique se propose de compléter la formation des techniciens supérieurs possédant une spécialité de base centrée sur la mécanique, l'électronique ou l'automatique pour leur apporter les connaissances technologiques transversales essentielles dans un contexte de conception et fabrication intégrée de systèmes complexes automatisés. Cette formation consiste donc à former en un an des cadres intermédiaires capables de concevoir et de développer des systèmes mécaniques intégrés, de contrôler et de commander des systèmes complexes mécatroniques. Ils pourront intervenir à la fois sur la mécanique, l’électronique et l’informatique et gérer les différentes étapes de projets  professionnelle en Mécatronique se propose de compléter la formation des techniciens supérieurs possédant une spécialité de base centrée sur la mécanique, l'électronique ou l'automatique pour leur apporter les connaissances technologiques transversales essentielles dans un contexte de conception et fabrication intégrée de systèmes complexes automatisés. Cette formation consiste donc à former en un an des cadres intermédiaires capables de concevoir et de développer des systèmes mécaniques intégrés, de contrôler et de commander des systèmes complexes mécatroniques. Ils pourront intervenir à la fois sur la mécanique, l’électronique et l’informatique et gérer les différentes étapes de projets industriels en encadrant des équipes de spécialistes.La licenceprofessionnelle en Mécatronique se propose de compléter la formation des techniciens supérieurs possédant une spécialité de base centrée sur la mécanique, l'électronique ou l'automatique pour leur apporter les connaissances technologiques transversales essentielles dans un contexte de conception et fabrication intégrée de systèmes complexes automatisés. Cette formation consiste donc à former en un an des cadres intermédiaires capables de concevoir et de développer des systèmes mécaniques intégrés, de contrôler et de commander des systèmes complexes mécatroniques. Ils pourront intervenir à la fois sur la mécanique, l’électronique et l’informatique et gérer les différentes étapes de projets  professionnelle en Mécatronique se propose de compléter la formation des techniciens supérieurs possédant une spécialité de base centrée sur la mécanique, l'électronique ou l'automatique pour leur apporter les connaissances technologiques transversales essentielles dans un contexte de conception et fabrication intégrée de systèmes complexes automatisés. Cette formation consiste donc à former en un an des cadres intermédiaires capables de concevoir et de développer des systèmes mécaniques intégrés, de contrôler et de commander des systèmes complexes mécatroniques. Ils pourront intervenir à la fois sur la mécanique, l’électronique et l’informatique et gérer les différentes étapes de projets industriels en encadrant des équipes de spécialistes.",
//   ),
//   License(
//     id: 2,
//     img: "assets/images/hat.png",
//     name: "LP Mécatronique",
//     description:
//         "La licence professionnelle en Mécatronique se propose de compléter la formation des techniciens supérieurs possédant une spécialité de base centrée sur la mécanique, l'électronique ou l'automatique pour leur apporter les connaissances technologiques transversales essentielles dans un contexte de conception et fabrication intégrée de systèmes complexes automatisés. Cette formation consiste donc à former en un an des cadres intermédiaires capables de concevoir et de développer des systèmes mécaniques intégrés, de contrôler et de commander des systèmes complexes mécatroniques. Ils pourront intervenir à la fois sur la mécanique, l’électronique et l’informatique et gérer les différentes étapes de projets industriels en encadrant des équipes de spécialistes.",
//   ),
//   License(
//     id: 3,
//     img: "assets/images/hat.png",
//     name: "LP Mécatronique",
//     description:
//         "La licence professionnelle en Mécatronique se propose de compléter la formation des techniciens supérieurs possédant une spécialité de base centrée sur la mécanique, l'électronique ou l'automatique pour leur apporter les connaissances technologiques transversales essentielles dans un contexte de conception et fabrication intégrée de systèmes complexes automatisés. Cette formation consiste donc à former en un an des cadres intermédiaires capables de concevoir et de développer des systèmes mécaniques intégrés, de contrôler et de commander des systèmes complexes mécatroniques. Ils pourront intervenir à la fois sur la mécanique, l’électronique et l’informatique et gérer les différentes étapes de projets industriels en encadrant des équipes de spécialistes.",
//   ),
//   License(
//     id: 4,
//     img: "assets/images/hat.png",
//     name: "LP Mécatronique",
//     description:
//         "La licence professionnelle en Mécatronique se propose de compléter la formation des techniciens supérieurs possédant une spécialité de base centrée sur la mécanique, l'électronique ou l'automatique pour leur apporter les connaissances technologiques transversales essentielles dans un contexte de conception et fabrication intégrée de systèmes complexes automatisés. Cette formation consiste donc à former en un an des cadres intermédiaires capables de concevoir et de développer des systèmes mécaniques intégrés, de contrôler et de commander des systèmes complexes mécatroniques. Ils pourront intervenir à la fois sur la mécanique, l’électronique et l’informatique et gérer les différentes étapes de projets industriels en encadrant des équipes de spécialistes.",
//   ),
//   License(
//     id: 5,
//     img: "assets/images/hat.png",
//     name: "LP Mécatronique",
//     description:
//         "La licence professionnelle en Mécatronique se propose de compléter la formation des techniciens supérieurs possédant une spécialité de base centrée sur la mécanique, l'électronique ou l'automatique pour leur apporter les connaissances technologiques transversales essentielles dans un contexte de conception et fabrication intégrée de systèmes complexes automatisés. Cette formation consiste donc à former en un an des cadres intermédiaires capables de concevoir et de développer des systèmes mécaniques intégrés, de contrôler et de commander des systèmes complexes mécatroniques. Ils pourront intervenir à la fois sur la mécanique, l’électronique et l’informatique et gérer les différentes étapes de projets industriels en encadrant des équipes de spécialistes.",
//   ),
//   License(
//     id: 6,
//     img: "assets/images/hat.png",
//     name: "LP Mécatronique",
//     description:
//         "La licence professionnelle en Mécatronique se propose de compléter la formation des techniciens supérieurs possédant une spécialité de base centrée sur la mécanique, l'électronique ou l'automatique pour leur apporter les connaissances technologiques transversales essentielles dans un contexte de conception et fabrication intégrée de systèmes complexes automatisés. Cette formation consiste donc à former en un an des cadres intermédiaires capables de concevoir et de développer des systèmes mécaniques intégrés, de contrôler et de commander des systèmes complexes mécatroniques. Ils pourront intervenir à la fois sur la mécanique, l’électronique et l’informatique et gérer les différentes étapes de projets industriels en encadrant des équipes de spécialistes.",
//   )
// ];
