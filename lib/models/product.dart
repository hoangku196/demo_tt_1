import 'package:demo_app/models/shop.dart';

class Product {
  String id;
  String brand;
  String name;
  String alias;
  String categoryId;
  String categoryTrack;
  String code;
  String barcode;
  int price;
  int priceMarket;
  String currency;
  String quantity;
  String status;
  String avatarPath;
  String avatarName;
  String avatarId;
  String isnew;
  String ishot;
  String viewed;
  String createdAt;
  String updatedAt;
  Null shortDescription;
  String description;
  String metaTitle;
  String metaDescription;
  String metaKeywords;
  Null dynamicField;
  String cusField1;
  String shopId;
  String statusQuantity;
  String rateCount;
  String rate;
  String flashSale;
  String priceRange;
  String qualityRange;
  String provinceId;
  String unit;
  String weight;
  String height;
  String length;
  String width;
  String type;
  String startTime;
  Null numberTime;
  String feeShip;
  String noteFeeShip;
  String videos;
  String adminUpdate;
  String adminUpdateTime;
  String ckeditDesc;
  String statusAffiliate;
  String vosoConnect;
  String order;
  String listCategory;
  String affiliateGtProduct;
  String affiliateMV;
  String affiliateMOv;
  String affiliateSafe;
  String affiliateCharity;
  String payCoin;
  String payServive;
  String shopStatusAffiliate;
  String latlng;
  String textPriceMarket;
  String textPrice;
  Shop shop;
  bool inWish;

  Product(
      {this.id,
      this.brand,
      this.name,
      this.alias,
      this.categoryId,
      this.categoryTrack,
      this.code,
      this.barcode,
      this.price,
      this.priceMarket,
      this.currency,
      this.quantity,
      this.status,
      this.avatarPath,
      this.avatarName,
      this.avatarId,
      this.isnew,
      this.ishot,
      this.viewed,
      this.createdAt,
      this.updatedAt,
      this.shortDescription,
      this.description,
      this.metaTitle,
      this.metaDescription,
      this.metaKeywords,
      this.dynamicField,
      this.cusField1,
      this.shopId,
      this.statusQuantity,
      this.rateCount,
      this.rate,
      this.flashSale,
      this.priceRange,
      this.qualityRange,
      this.provinceId,
      this.unit,
      this.weight,
      this.height,
      this.length,
      this.width,
      this.type,
      this.startTime,
      this.numberTime,
      this.feeShip,
      this.noteFeeShip,
      this.videos,
      this.adminUpdate,
      this.adminUpdateTime,
      this.ckeditDesc,
      this.statusAffiliate,
      this.vosoConnect,
      this.order,
      this.listCategory,
      this.affiliateGtProduct,
      this.affiliateMV,
      this.affiliateMOv,
      this.affiliateSafe,
      this.affiliateCharity,
      this.payCoin,
      this.payServive,
      this.shopStatusAffiliate,
      this.latlng,
      this.textPriceMarket,
      this.textPrice,
      this.shop,
      this.inWish});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    alias = json['alias'];
    categoryId = json['category_id'];
    categoryTrack = json['category_track'];
    code = json['code'];
    barcode = json['barcode'];
    price = json['price'];
    priceMarket = json['price_market'];
    currency = json['currency'];
    quantity = json['quantity'];
    status = json['status'];
    avatarPath = json['avatar_path'];
    avatarName = json['avatar_name'];
    avatarId = json['avatar_id'];
    isnew = json['isnew'];
    ishot = json['ishot'];
    viewed = json['viewed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shortDescription = json['short_description'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    dynamicField = json['dynamic_field'];
    cusField1 = json['cus_field1'];
    shopId = json['shop_id'];
    statusQuantity = json['status_quantity'];
    rateCount = json['rate_count'];
    rate = json['rate'];
    flashSale = json['flash_sale'];
    priceRange = json['price_range'];
    qualityRange = json['quality_range'];
    provinceId = json['province_id'];
    unit = json['unit'];
    weight = json['weight'];
    height = json['height'];
    length = json['length'];
    width = json['width'];
    type = json['type'];
    startTime = json['start_time'];
    numberTime = json['number_time'];
    feeShip = json['fee_ship'];
    noteFeeShip = json['note_fee_ship'];
    videos = json['videos'];
    adminUpdate = json['admin_update'];
    adminUpdateTime = json['admin_update_time'];
    ckeditDesc = json['ckedit_desc'];
    statusAffiliate = json['status_affiliate'];
    vosoConnect = json['voso_connect'];
    order = json['order'];
    listCategory = json['list_category'];
    affiliateGtProduct = json['affiliate_gt_product'];
    affiliateMV = json['affiliate_m_v'];
    affiliateMOv = json['affiliate_m_ov'];
    affiliateSafe = json['affiliate_safe'];
    affiliateCharity = json['affiliate_charity'];
    payCoin = json['pay_coin'];
    payServive = json['pay_servive'];
    shopStatusAffiliate = json['shop_status_affiliate'];
    latlng = json['latlng'];
    textPriceMarket = json['text_price_market'];
    textPrice = json['text_price'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    inWish = json['in_wish'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['category_id'] = this.categoryId;
    data['category_track'] = this.categoryTrack;
    data['code'] = this.code;
    data['barcode'] = this.barcode;
    data['price'] = this.price;
    data['price_market'] = this.priceMarket;
    data['currency'] = this.currency;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['avatar_path'] = this.avatarPath;
    data['avatar_name'] = this.avatarName;
    data['avatar_id'] = this.avatarId;
    data['isnew'] = this.isnew;
    data['ishot'] = this.ishot;
    data['viewed'] = this.viewed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_keywords'] = this.metaKeywords;
    data['dynamic_field'] = this.dynamicField;
    data['cus_field1'] = this.cusField1;
    data['shop_id'] = this.shopId;
    data['status_quantity'] = this.statusQuantity;
    data['rate_count'] = this.rateCount;
    data['rate'] = this.rate;
    data['flash_sale'] = this.flashSale;
    data['price_range'] = this.priceRange;
    data['quality_range'] = this.qualityRange;
    data['province_id'] = this.provinceId;
    data['unit'] = this.unit;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['length'] = this.length;
    data['width'] = this.width;
    data['type'] = this.type;
    data['start_time'] = this.startTime;
    data['number_time'] = this.numberTime;
    data['fee_ship'] = this.feeShip;
    data['note_fee_ship'] = this.noteFeeShip;
    data['videos'] = this.videos;
    data['admin_update'] = this.adminUpdate;
    data['admin_update_time'] = this.adminUpdateTime;
    data['ckedit_desc'] = this.ckeditDesc;
    data['status_affiliate'] = this.statusAffiliate;
    data['voso_connect'] = this.vosoConnect;
    data['order'] = this.order;
    data['list_category'] = this.listCategory;
    data['affiliate_gt_product'] = this.affiliateGtProduct;
    data['affiliate_m_v'] = this.affiliateMV;
    data['affiliate_m_ov'] = this.affiliateMOv;
    data['affiliate_safe'] = this.affiliateSafe;
    data['affiliate_charity'] = this.affiliateCharity;
    data['pay_coin'] = this.payCoin;
    data['pay_servive'] = this.payServive;
    data['shop_status_affiliate'] = this.shopStatusAffiliate;
    data['latlng'] = this.latlng;
    data['text_price_market'] = this.textPriceMarket;
    data['text_price'] = this.textPrice;
    if (this.shop != null) {
      data['shop'] = this.shop.toJson();
    }
    data['in_wish'] = this.inWish;
    return data;
  }
}
