class UserModel {
  final String patientName;
  final String emailAddress;
  final String aadharNumber;
  final String mobileNumber;
  final String dob;
  final String profession;
  final String gender;
  final String bloodGroup;
  final String height;
  final String weight;

  UserModel({
    required this.patientName,
    required this.emailAddress,
    required this.aadharNumber,
    required this.mobileNumber,
    required this.dob,
    required this.profession,
    required this.gender,
    required this.bloodGroup,
    required this.height,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'patientName': patientName,
      'emailAddress': emailAddress,
      'aadharNumber': aadharNumber,
      'mobileNumber': mobileNumber,
      'dob': dob,
      'profession': profession,
      'gender': gender,
      'bloodGroup': bloodGroup,
      'height': height,
      'weight': weight,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      patientName: map['patientName'],
      emailAddress: map['emailAddress'],
      aadharNumber: map['aadharNumber'],
      mobileNumber: map['mobileNumber'],
      dob: map['dob'],
      profession: map['profession'],
      gender: map['gender'],
      bloodGroup: map['bloodGroup'],
      height: map['height'],
      weight: map['weight'],
    );
  }

  UserModel copyWith({
    String? patientName,
    String? emailAddress,
    String? aadharNumber,
    String? mobileNumber,
    String? dob,
    String? profession,
    String? gender,
    String? bloodGroup,
    String? height,
    String? weight,
  }) {
    return UserModel(
      patientName: patientName ?? this.patientName,
      emailAddress: emailAddress ?? this.emailAddress,
      aadharNumber: aadharNumber ?? this.aadharNumber,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      dob: dob ?? this.dob,
      profession: profession ?? this.profession,
      gender: gender ?? this.gender,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }
}
