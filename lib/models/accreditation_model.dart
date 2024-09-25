class AccreditationModel{
  final String number;
  final String title;
  final String description;

  AccreditationModel({required this.number, required this.title, required this.description});
}
List<AccreditationModel> accreditationList=[
  AccreditationModel(number: '01', title: 'Imaging Services Accreditation', description: '-Visibly’s accreditation of imaging services provides a patient-focused assessment that is designed to give healthcare stakeholders, confidence in their diagnosis and all aspects of their care'),
  AccreditationModel(number: '02', title: 'Physiological Services Accreditation', description: '-Visibly supports the delivery of quality physiological services based on a formal and impartial assurance process designed to deliver assessment against clearly defined and professionally led standards'),
  AccreditationModel(number: '03', title: 'Reference material producer Accreditation', description: '-Visibly’s accreditation provides a level of confidence and assurance that international guidelines are followed in the production, labelling, and assignment of property values to reference materials,including stability and homogeneity determinations'),
];