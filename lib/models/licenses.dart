class License {
  late final String name, description;
  late List modules;
  License({
    required this.name,
    required this.description,
    required this.modules,
  });
}

List<License> licenses = [
  License(
      name: "LP informatique",
      description:
          "La licenceprofessionnelle en Mécatronique se propose de compléter la formation des techniciens supérieurs possédant une spécialité de base centrée sur la mécanique, l'électronique ou l'automatique pour leur apporter les connaissances technologiques transversales essentielles dans un contexte de conception et fabrication intégrée de systèmes complexes automatisés. Cette formation consiste donc à former en un an des cadres intermédiaires capables de concevoir et de développer des systèmes mécaniques intégrés, de contrôler et de commander des systèmes complexes mécatroniques. Ils pourront intervenir à la fois sur la mécanique, l’électronique et l’informatique et gérer les différentes étapes de projets  professionnelle en Mécatronique se propose de compléter la formation des techniciens supérieurs possédant une spécialité de base centrée sur la mécanique, l'électronique ou l'automatique pour leur apporter les connaissances technologiques transversales essentielles dans un contexte de conception et fabrication intégrée de systèmes complexes automatisés. Cette formation consiste donc à former en un an des cadres intermédiaires capables de concevoir et de développer des systèmes mécaniques intégrés, de contrôler et de commander des systèmes complexes mécatroniques. Ils pourront intervenir à la fois sur la mécanique, l’électronique et l’informatique et gérer les différentes étapes de projets industriels en encadrant des équipes de spécialistes.",
      modules: module),
  License(
      name: "LP Mécatronique",
      description:
          "La licence professionnelle en Mécatronique se propose de compléter la formation des techniciens supérieurs possédant une spécialité de base centrée sur la mécanique, l'électronique ou l'automatique pour leur apporter les connaissances technologiques transversales essentielles dans un contexte de conception et fabrication intégrée de systèmes complexes automatisés. Cette formation consiste donc à former en un an des cadres intermédiaires capables de concevoir et de développer des systèmes mécaniques intégrés, de contrôler et de commander des systèmes complexes mécatroniques. Ils pourront intervenir à la fois sur la mécanique, l’électronique et l’informatique et gérer les différentes étapes de projets industriels en encadrant des équipes de spécialistes.",
      modules: module)
];

List module = [
  'm1:Informatique.',
  'm2:Electronique et transmission.',
];
