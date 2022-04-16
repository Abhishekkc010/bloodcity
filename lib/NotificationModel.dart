class NotificationModel {
  int? id;
  String? Name;
  String? Phone;
  bool? isAccepted;
  String? requestUserId;
  String? postUserId;
  String? requestEmail;
  String? postEmail;
  String? BloodType;
  String? City;

  NotificationModel(
      {this.id,
        this.Name,
        this.Phone,
        this.isAccepted,
        this.requestUserId,
        this.postUserId,
        this.requestEmail,
        this.postEmail,
        this.BloodType,
        this.City});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Name = json['Name'];
    Phone = json['Phone'];
    isAccepted = json['isAccepted'];
    requestUserId = json['requestUserId'];
    postUserId = json['postUserId'];
    requestEmail = json['requestEmail'];
    postEmail = json['postEmail'];
    BloodType = json['BloodType'];
    City = json['City'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['Name'] = Name;
    data['Phone'] = Phone;
    data['isAccepted'] = isAccepted;
    data['requestUserId'] = requestUserId;
    data['postUserId'] = postUserId;
    data['requestEmail'] = requestEmail;
    data['postEmail'] = postEmail;
    data['BloodType'] = BloodType;
    data['City'] = City;
    return data;
  }
}