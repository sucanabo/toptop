class AddressModel {
  final String? name;
  final int? code;
  final String? divisionType;
  final String? codename;
  final int? phoneCode;

  AddressModel({
    this.name,
    this.code,
    this.divisionType,
    this.codename,
    this.phoneCode,
  });

  AddressModel copyWith({
    String? name,
    int? code,
    String? divisionType,
    String? codename,
    int? phoneCode,
    List<dynamic>? districts,
  }) =>
      AddressModel(
        name: name ?? this.name,
        code: code ?? this.code,
        divisionType: divisionType ?? this.divisionType,
        codename: codename ?? this.codename,
        phoneCode: phoneCode ?? this.phoneCode,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    name: json["name"],
    code: json["code"],
    divisionType: json["division_type"],
    codename: json["codename"],
    phoneCode: json["phone_code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "division_type": divisionType,
    "codename": codename,
    "phone_code": phoneCode,
  };
}
