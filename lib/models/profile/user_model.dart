class UserModel {
  final String name;
  final String email;
  final String aadharNumber;
  final String mobileNumber;
  final String userDob;
  final String profession;
  final String sex;
  final String bloodGroup;
  final String height;
  final String weight;
  final String patientId;
  // final String profilePicture;

  UserModel({
    required this.name,
    required this.email,
    required this.aadharNumber,
    required this.mobileNumber,
    required this.userDob,
    required this.profession,
    required this.sex,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.patientId,
    // required this.profilePicture,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'aadharNumber': aadharNumber,
      'mobileNumber': mobileNumber,
      'user_dob': userDob,
      'proffession': profession,
      'sex': sex,
      'bloodGroup': bloodGroup,
      'height': height,
      'weight': weight,
      'patient_id': patientId,
      // 'profilePicture': profilePicture,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      aadharNumber: map['aadharNumber'],
      mobileNumber: map['mobileNumber'],
      userDob: map['user_dob'],
      profession: map['proffession'],
      sex: map['sex'],
      bloodGroup: map['bloodGroup'],
      height: map['height'],
      weight: map['weight'],
      patientId: map['patient_id'],
      // profilePicture: map['profilePicture'],
    );
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? aadharNumber,
    String? mobileNumber,
    String? userDob,
    String? profession,
    String? sex,
    String? bloodGroup,
    String? height,
    String? weight,
    String? patientId,
    // String? profilePicture,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      aadharNumber: aadharNumber ?? this.aadharNumber,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      userDob: userDob ?? this.userDob,
      profession: profession ?? this.profession,
      sex: sex ?? this.sex,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      patientId: patientId ?? this.patientId,
      // profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
