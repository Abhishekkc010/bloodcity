class DataModel {
  int? id;
  String? Name;
  String? Phone;
  String? BloodType;
  String? State;
  String? District;
  String? City;
  String? RequiredUnit;
  String? RequiredDate;
  String? HospitalName;
  String? DetailAboutCase;

  DataModel(
      {this.id, this.Name,
      this.Phone,
      this.BloodType,
      this.State,
      this.District,
      this.City,
      this.DetailAboutCase,
      this.HospitalName,
      this.RequiredDate,
      this.RequiredUnit});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']=id;
    data['Name'] = Name;
    data['Phone'] = Phone;
    data['BloodType'] = BloodType;
    data['State'] = State;
    data['District'] = District;
    data['City'] = City;
    data['DetailAboutCase'] = DetailAboutCase;
    data['HospitalName'] = HospitalName;
    data['RequiredUnit'] = RequiredUnit;
    data['RequiredDate'] = RequiredDate;
    return data;
  }
}
