class ProductCat {
  int id;
  String name;
  String alias;
  int parent;
  int level;
  String track;
  int createdAt;
  int updatedAt;
  String metaKeywords;
  String metaDescription;
  String metaTitle;
  int status;
  String avatarPath;
  String avatarName;
  int attributeSetId;
  String nameEn;
  int viewLayout;
  String description;
  String descriptionEn;
  int calculationFormulaId;
  String mapNhvt2;
  String mapNhvt2Final;
  String dynamicField;
  String iconPath;
  String iconName;
  int isnew;
  int showInHome;
  int order;
  String bgrPath;
  String bgrName;
  int pointPercent;
  int showInHome2;
  int frontendNotUp;

  ProductCat(
      {this.id,
      this.name,
      this.alias,
      this.parent,
      this.level,
      this.track,
      this.createdAt,
      this.updatedAt,
      this.metaKeywords,
      this.metaDescription,
      this.metaTitle,
      this.status,
      this.avatarPath,
      this.avatarName,
      this.attributeSetId,
      this.nameEn,
      this.viewLayout,
      this.description,
      this.descriptionEn,
      this.calculationFormulaId,
      this.mapNhvt2,
      this.mapNhvt2Final,
      this.dynamicField,
      this.iconPath,
      this.iconName,
      this.isnew,
      this.showInHome,
      this.order,
      this.bgrPath,
      this.bgrName,
      this.pointPercent,
      this.showInHome2,
      this.frontendNotUp});

  ProductCat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'];
    parent = json['parent'];
    level = json['level'];
    track = json['track'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    metaTitle = json['meta_title'];
    status = json['status'];
    avatarPath = json['avatar_path'];
    avatarName = json['avatar_name'];
    attributeSetId = json['attribute_set_id'];
    nameEn = json['name_en'];
    viewLayout = json['view_layout'];
    description = json['description'];
    descriptionEn = json['description_en'];
    calculationFormulaId = json['calculation_formula_id'];
    mapNhvt2 = json['map_nhvt2'];
    mapNhvt2Final = json['map_nhvt2_final'];
    dynamicField = json['dynamic_field'];
    iconPath = json['icon_path'];
    iconName = json['icon_name'];
    isnew = json['isnew'];
    showInHome = json['show_in_home'];
    order = json['order'];
    bgrPath = json['bgr_path'];
    bgrName = json['bgr_name'];
    pointPercent = json['point_percent'];
    showInHome2 = json['show_in_home_2'];
    frontendNotUp = json['frontend_not_up'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['parent'] = this.parent;
    data['level'] = this.level;
    data['track'] = this.track;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['meta_title'] = this.metaTitle;
    data['status'] = this.status;
    data['avatar_path'] = this.avatarPath;
    data['avatar_name'] = this.avatarName;
    data['attribute_set_id'] = this.attributeSetId;
    data['name_en'] = this.nameEn;
    data['view_layout'] = this.viewLayout;
    data['description'] = this.description;
    data['description_en'] = this.descriptionEn;
    data['calculation_formula_id'] = this.calculationFormulaId;
    data['map_nhvt2'] = this.mapNhvt2;
    data['map_nhvt2_final'] = this.mapNhvt2Final;
    data['dynamic_field'] = this.dynamicField;
    data['icon_path'] = this.iconPath;
    data['icon_name'] = this.iconName;
    data['isnew'] = this.isnew;
    data['show_in_home'] = this.showInHome;
    data['order'] = this.order;
    data['bgr_path'] = this.bgrPath;
    data['bgr_name'] = this.bgrName;
    data['point_percent'] = this.pointPercent;
    data['show_in_home_2'] = this.showInHome2;
    data['frontend_not_up'] = this.frontendNotUp;
    return data;
  }
}
