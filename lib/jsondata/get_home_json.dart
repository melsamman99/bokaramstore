class Get_home_json {
  String message;
  int errNum;
  bool status;
  Result result;

  Get_home_json({this.message, this.errNum, this.status, this.result});

  Get_home_json.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errNum = json['errNum'];
    status = json['status'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['errNum'] = this.errNum;
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  List<AllSliders> allSliders;
  List<AllCategories> allCategories;
  List<AllFastFree> allFastFree;
  List<AllOffers> allOffers;
  List<AllBestProducts> allBestProducts;
  List<AllPartners> allPartners;
  List<allFirstBanners> all_first_banners;
  List<allSecondBanners> all_second_banners;

  Result(
      {this.allSliders,
        this.allCategories,
        this.allFastFree,
        this.allOffers,
        this.allBestProducts,
        this.allPartners,
      this.all_first_banners});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['all_sliders'] != null) {
      allSliders = new List<AllSliders>();
      json['all_sliders'].forEach((v) {
        allSliders.add(new AllSliders.fromJson(v));
      });
    }
    if (json['all_categories'] != null) {
      allCategories = new List<AllCategories>();
      json['all_categories'].forEach((v) {
        allCategories.add(new AllCategories.fromJson(v));
      });
    }
    if (json['all_fast_free'] != null) {
      allFastFree = new List<AllFastFree>();
      json['all_fast_free'].forEach((v) {
        allFastFree.add(new AllFastFree.fromJson(v));
      });
    }
    if (json['all_offers'] != null) {
      allOffers = new List<AllOffers>();
      json['all_offers'].forEach((v) {
        allOffers.add(new AllOffers.fromJson(v));
      });
    }
    if (json['all_best_products'] != null) {
      allBestProducts = new List<AllBestProducts>();
      json['all_best_products'].forEach((v) {
        allBestProducts.add(new AllBestProducts.fromJson(v));
      });
    }
    if (json['all_partners'] != null) {
      allPartners = new List<AllPartners>();
      json['all_partners'].forEach((v) {
        allPartners.add(new AllPartners.fromJson(v));
      });
    }

    if (json['all_first_banners'] != null) {
      all_first_banners = new List<allFirstBanners>();
      json['all_first_banners'].forEach((v) {
        all_first_banners.add(new allFirstBanners.fromJson(v));
      });
    }

    if (json['all_second_banners'] != null) {
      all_second_banners = new List<allSecondBanners>();
      json['all_second_banners'].forEach((v) {
        all_second_banners.add(new allSecondBanners.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allSliders != null) {
      data['all_sliders'] = this.allSliders.map((v) => v.toJson()).toList();
    }
    if (this.allCategories != null) {
      data['all_categories'] =
          this.allCategories.map((v) => v.toJson()).toList();
    }
    if (this.allFastFree != null) {
      data['all_fast_free'] = this.allFastFree.map((v) => v.toJson()).toList();
    }
    if (this.allOffers != null) {
      data['all_offers'] = this.allOffers.map((v) => v.toJson()).toList();
    }
    if (this.allBestProducts != null) {
      data['all_best_products'] =
          this.allBestProducts.map((v) => v.toJson()).toList();
    }
    if (this.allPartners != null) {
      data['all_partners'] = this.allPartners.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllSliders {
  String sliderImg;
  int id;
  String link;

  AllSliders({this.sliderImg, this.id, this.link});

  AllSliders.fromJson(Map<String, dynamic> json) {
    sliderImg = json['slider_img'];
    id = json['id'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slider_img'] = this.sliderImg;
    data['id'] = this.id;
    data['link'] = this.link;
    return data;
  }
}

class AllCategories {
  String categoryId;
  String categoryName;
  String imageCateg;

  AllCategories({this.categoryId, this.categoryName, this.imageCateg});

  AllCategories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    imageCateg = json['image_categ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['image_categ'] = this.imageCateg;
    return data;
  }
}

class AllFastFree {
  int exitCart;
  int favExit;
  String totalRate;
  String offerName;
  String offerId;
  String currencyName;
  String oldPrice;
  String newPrice;
  String discountPercentage;
  String imageCateg;
  String whatsapp;
  String shareLink;

  AllFastFree(
      {this.exitCart,
        this.favExit,
        this.totalRate,
        this.offerName,
        this.offerId,
        this.currencyName,
        this.oldPrice,
        this.newPrice,
        this.discountPercentage,
        this.imageCateg,
        this.whatsapp,
        this.shareLink});

  AllFastFree.fromJson(Map<String, dynamic> json) {
    exitCart = json['exit_cart'];
    favExit = json['fav_exit'];
    totalRate = json['total_rate'];
    offerName = json['offer_name'];
    offerId = json['offer_id'];
    currencyName = json['currency_name'];
    oldPrice = json['old_price'];
    newPrice = json['new_price'];
    discountPercentage = json['discount_percentage'];
    imageCateg = json['image_categ'];
    whatsapp = json['whatsapp'];
    shareLink = json['share_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exit_cart'] = this.exitCart;
    data['fav_exit'] = this.favExit;
    data['total_rate'] = this.totalRate;
    data['offer_name'] = this.offerName;
    data['offer_id'] = this.offerId;
    data['currency_name'] = this.currencyName;
    data['old_price'] = this.oldPrice;
    data['new_price'] = this.newPrice;
    data['discount_percentage'] = this.discountPercentage;
    data['image_categ'] = this.imageCateg;
    data['whatsapp'] = this.whatsapp;
    data['share_link'] = this.shareLink;
    return data;
  }
}

class AllBestProducts {
  int exitCart;
  int favExit;
  String totalRate;
  String productName;
  String newPrice;
  String productId;
  String currencyName;
  String imageCateg;
  String whatsapp;
  String shareLink;

  AllBestProducts(
      {this.exitCart,
        this.favExit,
        this.totalRate,
        this.productName,
        this.newPrice,
        this.productId,
        this.currencyName,
        this.imageCateg,
        this.whatsapp,
        this.shareLink});

  AllBestProducts.fromJson(Map<String, dynamic> json) {
    exitCart = json['exit_cart'];
    favExit = json['fav_exit'];
    totalRate = json['total_rate'];
    productName = json['product_name'];
    newPrice = json['new_price'];
    productId = json['product_id'];
    currencyName = json['currency_name'];
    imageCateg = json['image_categ'];
    whatsapp = json['whatsapp'];
    shareLink = json['share_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exit_cart'] = this.exitCart;
    data['fav_exit'] = this.favExit;
    data['total_rate'] = this.totalRate;
    data['product_name'] = this.productName;
    data['new_price'] = this.newPrice;
    data['product_id'] = this.productId;
    data['currency_name'] = this.currencyName;
    data['image_categ'] = this.imageCateg;
    data['whatsapp'] = this.whatsapp;
    data['share_link'] = this.shareLink;
    return data;
  }
}

class AllPartners {
  String imageCateg;

  AllPartners({this.imageCateg});

  AllPartners.fromJson(Map<String, dynamic> json) {
    imageCateg = json['image_categ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_categ'] = this.imageCateg;
    return data;
  }
}

class allFirstBanners {
  String imageCateg;
  String firstBanner;

  allFirstBanners({this.imageCateg,this.firstBanner});

  allFirstBanners.fromJson(Map<String, dynamic> json) {
    imageCateg = json['image_categ'];
    firstBanner=   json[ 'first_banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_categ'] = this.imageCateg;
    data['firstBanner']= this.firstBanner;
    return data;
  }
}

class allSecondBanners {
  String secondLink;
  String secondBanner;

  allSecondBanners({this.secondLink,this.secondBanner});

  allSecondBanners.fromJson(Map<String, dynamic> json) {
    secondBanner = json['second_banner'];
    secondLink=   json['second_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['second_banner'] = this.secondBanner;
    data['second_link']= this.secondLink;
    return data;
  }
}




class AllOffers {
  int exitCart;
  int favExit;
  String totalRate;
  String offerName;
  String offerId;
  String currencyName;
  String oldPrice;
  String newPrice;
  String discountPercentage;
  String imageCateg;


  String whatsapp;
  String sharelink;


  AllOffers(
      {this.exitCart,
        this.favExit,
        this.totalRate,
        this.offerName,
        this.offerId,
        this.currencyName,
        this.oldPrice,
        this.newPrice,
        this.discountPercentage,
        this.imageCateg

      , this.whatsapp,
        this.sharelink});

  AllOffers.fromJson(Map<String, dynamic> json) {
    exitCart = json['exit_cart'];
    favExit = json['fav_exit'];
    totalRate = json['total_rate'];
    offerName = json['offer_name'];
    offerId = json['offer_id'];
    currencyName = json['currency_name'];
    oldPrice = json['old_price'];
    newPrice = json['new_price'];
    discountPercentage = json['discount_percentage'];
    imageCateg = json['image_categ'];


    whatsapp = json['whatsapp'];
    sharelink = json['share_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exit_cart'] = this.exitCart;
    data['fav_exit'] = this.favExit;
    data['total_rate'] = this.totalRate;
    data['offer_name'] = this.offerName;
    data['offer_id'] = this.offerId;
    data['currency_name'] = this.currencyName;
    data['old_price'] = this.oldPrice;
    data['new_price'] = this.newPrice;
    data['discount_percentage'] = this.discountPercentage;
    data['image_categ'] = this.imageCateg;
    data['whatsapp'] = this.whatsapp;
    data['share_link'] = this.sharelink;
    return data;
  }
}