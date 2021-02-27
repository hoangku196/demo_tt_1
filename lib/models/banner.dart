class Banner {
  String id;
  String groupId;
  String name;
  String src;
  String description;
  String width;
  String height;
  String link;
  String order;
  String target;
  String status;
  String createdAt;
  String updatedAt;
  String nameEn;
  String descriptionEn;
  String categoryId;

  Banner(
      {this.id,
      this.groupId,
      this.name,
      this.src,
      this.description,
      this.width,
      this.height,
      this.link,
      this.order,
      this.target,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.nameEn,
      this.descriptionEn,
      this.categoryId});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    name = json['name'];
    src = json['src'];
    description = json['description'];
    width = json['width'];
    height = json['height'];
    link = json['link'];
    order = json['order'];
    target = json['target'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nameEn = json['name_en'];
    descriptionEn = json['description_en'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_id'] = this.groupId;
    data['name'] = this.name;
    data['src'] = this.src;
    data['description'] = this.description;
    data['width'] = this.width;
    data['height'] = this.height;
    data['link'] = this.link;
    data['order'] = this.order;
    data['target'] = this.target;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name_en'] = this.nameEn;
    data['description_en'] = this.descriptionEn;
    data['category_id'] = this.categoryId;
    return data;
  }
}
