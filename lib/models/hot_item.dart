class HotItem {
  String id;
  String keyword;
  String click;
  String totalitem;
  String avatarPath;
  String avatarName;
  String createdAt;
  String updatedAt;

  HotItem(
      {this.id,
      this.keyword,
      this.click,
      this.totalitem,
      this.avatarPath,
      this.avatarName,
      this.createdAt,
      this.updatedAt});

  HotItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    keyword = json['keyword'];
    click = json['click'];
    totalitem = json['totalitem'];
    avatarPath = json['avatar_path'];
    avatarName = json['avatar_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> hotItem = new Map<String, dynamic>();
    hotItem['id'] = this.id;
    hotItem['keyword'] = this.keyword;
    hotItem['click'] = this.click;
    hotItem['totalitem'] = this.totalitem;
    hotItem['avatar_path'] = this.avatarPath;
    hotItem['avatar_name'] = this.avatarName;
    hotItem['created_at'] = this.createdAt;
    hotItem['updated_at'] = this.updatedAt;
    return hotItem;
  }
}
