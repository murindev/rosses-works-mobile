class AccountProfile {
  num user_id;
  num crm_id; // ignore: non_constant_identifier_names
  String photo;
  String name;
  String patronymic;
  String surname;
  String birth_date;
  String birth_place;
  String address_residence;
  String address_registration;
  String phone_home;
  String phone_mobile;
  String phone_office;
  String passport_data;
  String marital_status;
  String military_status;
  List<AccountProfileEducation> education;
  String education_additional;
  String languages;
  List<AccountProfileEmployment> employments;
  String salary_for_probation;
  String salary_after_probation;
  String advantages;
  String hobbies;
  String additional_info;
  int agreement;
  // dynamic roleId;
  // dynamic titleId;
  // AccountProfileRole role;
  // AccountProfileTitle title;

  // String createdAt;
  // String updatedAt;

  AccountProfile(
      {this.user_id,
      this.crm_id,
      this.photo,
      this.name,
      this.patronymic,
      this.surname,
      this.birth_date,
      this.birth_place,
      this.address_residence,
      this.address_registration,
      this.phone_home,
      this.phone_mobile,
      this.phone_office,
      this.passport_data,
      this.marital_status,
      this.military_status,
      this.education,
      this.education_additional,
      this.languages,
      this.employments,
      this.salary_for_probation,
      this.salary_after_probation,
      this.advantages,
      this.hobbies,
      this.additional_info,
      this.agreement,
      // this.roleId,
      // this.titleId,
      // this.role,
      // this.title
      // this.createdAt,
      // this.updatedAt,
      });

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'crm_id': crm_id,
      'name': name,
      'photo': photo,
      'patronymic': patronymic,
      'surname': surname,
      'birth_date': birth_date,
      'birth_place': birth_place,
      'address_residence': address_residence,
      'address_registration': address_registration,
      'phone_home': phone_home,
      'phone_mobile': phone_mobile,
      'phone_office': phone_office,
      'passport_data': passport_data,
      'marital_status': marital_status,
      'military_status': military_status,
      'education': education,
      'education_additional': education_additional,
      'languages': languages,
      'employments': employments,
      'salary_for_probation': salary_for_probation,
      'salary_after_probation': salary_after_probation,
      'advantages': advantages,
      'hobbies': hobbies,
      'additional_info': additional_info,
      'agreement': agreement,
      // 'roleId': roleId,
      // 'titleId': titleId,
      // 'role': role,
      // 'title': title,
    };
  }

  dynamic getValue(val) {}

  factory AccountProfile.fromJson(Map json) {
    var educationList = json['education'] as List;
    List<AccountProfileEducation> education = educationList.map((i) => AccountProfileEducation.fromJson(i)).toList();

    var employmentsList = json['employments'] as List;
    List<AccountProfileEmployment> employments = employmentsList.map((i) => AccountProfileEmployment.fromJson(i)).toList();

    return AccountProfile(
      user_id: json['user_id'],
      crm_id: json['crm_id'] ?? null,
      photo: json['photo'] ?? '',
      name: json['name'] ?? '',
      patronymic: json['patronymic'] ?? '',
      surname: json['surname'] ?? '',
      birth_date: json['birth_date'] ?? '',
      birth_place: json['birth_place'] ?? '',
      address_residence: json['address_residence'] ?? '',
      address_registration: json['address_registration'] ?? '',
      phone_home: json['phone_home'] ?? '',
      phone_mobile: json['phone_mobile'] ?? '',
      phone_office: json['phone_office'] ?? '',
      passport_data: json['passport_data'] ?? '',
      marital_status: json['marital_status'] ?? '',
      military_status: json['military_status'] ?? '',
      education: education ?? [],
      education_additional: json['education_additional'] ?? '',
      languages: json['languages'] ?? '',
      employments: employments ?? [],
      salary_for_probation: json['salary_for_probation'] ?? '',
      salary_after_probation: json['salary_after_probation'] ?? '',
      advantages: json['advantages'] ?? '',
      hobbies: json['hobbies'] ?? '',
      additional_info: json['additional_info'] ?? '',
      agreement: json['agreement']  ,
      // roleId: json['roleId'] ?? '',
      // titleId: json['titleId'] ?? '',
      // role: AccountProfileRole.fromJson(json['role']) ?? {},
      // title: AccountProfileTitle.fromJson(json['title']) ?? {},
      // createdAt: json['createdAt'],
      // updatedAt: json['updatedAt'],
    );
  }
}

class AccountProfileEducation {
  int id;
  int user_id;
  String date_admission;
  String date_graduation;
  String institution;
  String speciality;

  // String createdAt;
  // String updatedAt;

  AccountProfileEducation({
    this.id,
    this.user_id,
    this.date_admission,
    this.date_graduation,
    this.institution,
    this.speciality,
    // this.createdAt,
    // this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'date_admission': date_admission,
      'date_graduation': date_graduation,
      'institution': institution,
      'speciality': speciality,
    };
  }

  dynamic getValue(key) {
    switch (key) {
      case 'id':
        return this.id;
        break;
      case 'user_id':
        return this.user_id;
        break;
      case 'date_admission':
        return this.date_admission;
        break;
      case 'date_graduation':
        return this.date_graduation;
        break;
      case 'institution':
        return this.institution;
        break;
      case 'speciality':
        return this.speciality;
        break;
    }
  }

  factory AccountProfileEducation.fromJson(Map<String, dynamic> json) => AccountProfileEducation(
        id: json['id'],
        user_id: json['user_id'] ?? '',
        date_admission: json['date_admission'] ?? '',
        date_graduation: json['date_graduation'] ?? '',
        institution: json['institution'] ?? '',
        speciality: json['speciality'] ?? '',
      );

  factory AccountProfileEducation.initial() => AccountProfileEducation(
        date_admission: '',
        date_graduation: '',
        institution: '',
        speciality: '',
      );
}

class AccountProfileEmployment {
  int id;
  int user_id;
  String date_of_employment;
  String date_of_dismissal;
  String organisation;
  String position;
  String address_of_organisation;
  String reason_for_dismissal;

  // String createdAt;
  // String updatedAt;

  AccountProfileEmployment({
    this.id,
    this.user_id,
    this.date_of_employment,
    this.date_of_dismissal,
    this.organisation,
    this.position,
    this.address_of_organisation,
    this.reason_for_dismissal,
    // this.createdAt,
    // this.updatedAt,
  });

  dynamic getValue(key) {
    switch (key) {
      case 'id':
        return this.id;
        break;
      case 'user_id':
        return this.user_id;
        break;
      case 'date_of_employment':
        return this.date_of_employment;
        break;
      case 'date_of_dismissal':
        return this.date_of_dismissal;
        break;
      case 'organisation':
        return this.organisation;
        break;
      case 'position':
        return this.position;
        break;
      case 'address_of_organisation':
        return this.address_of_organisation;
        break;
      case 'reason_for_dismissal':
        return this.reason_for_dismissal;
        break;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'user_id': this.user_id,
      'date_of_employment': this.date_of_employment,
      'date_of_dismissal': this.date_of_dismissal,
      'organisation': this.organisation,
      'position': this.position,
      'address_of_organisation': this.address_of_organisation,
      'reason_for_dismissal': this.reason_for_dismissal,
    };
  }

  factory AccountProfileEmployment.fromJson(Map<String, dynamic> json) {
    return AccountProfileEmployment(
      id: json['id'],
      user_id: json['user_id'] ?? '',
      date_of_employment: json['date_of_employment'] ?? '',
      date_of_dismissal: json['date_of_dismissal'] ?? '',
      organisation: json['organisation'] ?? '',
      position: json['position'] ?? '',
      address_of_organisation: json['address_of_organisation'] ?? '',
      reason_for_dismissal: json['reason_for_dismissal'] ?? '',
    );
  }

  factory AccountProfileEmployment.initial() => AccountProfileEmployment(
        date_of_employment: '',
        date_of_dismissal: '',
        organisation: '',
        position: '',
        address_of_organisation: '',
        reason_for_dismissal: '',
      );
}

class AccountProfileRole {
  int id;
  String code;
  String name;

  AccountProfileRole({this.id, this.code, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'name': name,
    };
  }

  factory AccountProfileRole.fromJson(Map<String, dynamic> json) => AccountProfileRole(
        id: json['id'],
        code: json['code'] ?? '',
        name: json['name'] ?? '',
      );

  dynamic getValue(key) {
    switch (key) {
      case 'id':
        return this.id;
        break;
      case 'code':
        return this.code;
        break;
      case 'name':
        return this.name;
        break;
    }
  }
}

class AccountProfileTitle {
  int id;
  int role;
  String name;

  AccountProfileTitle({this.id, this.role, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'role': role,
      'name': name,
    };
  }

  factory AccountProfileTitle.fromJson(Map<String, dynamic> json) => AccountProfileTitle(
        id: json['id'],
        role: json['role'] ?? '',
        name: json['name'] ?? '',
      );

  dynamic getValue(key) {
    switch (key) {
      case 'id':
        return this.id;
        break;
      case 'role':
        return this.role;
        break;
      case 'name':
        return this.name;
        break;
    }
  }
}
