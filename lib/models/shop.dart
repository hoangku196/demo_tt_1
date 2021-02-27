class Shop {
  String name;
  String avatarName;
  String avatarPath;

  Shop({this.name, this.avatarName, this.avatarPath});

  Shop.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatarName = json['avatar_name'];
    avatarPath = json['avatar_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['avatar_name'] = this.avatarName;
    data['avatar_path'] = this.avatarPath;
    return data;
  }
}
