import 'dart:convert';

PlaceOrderModel placeOrderModelFromJson(String str) => PlaceOrderModel.fromJson(json.decode(str));

String placeOrderModelToJson(PlaceOrderModel data) => json.encode(data.toJson());

class PlaceOrderModel {
    PlaceOrderModel({
        required this.statusCode,
        required this.data,
        required this.success,
        required this.error,
    });

    String statusCode; // If `status_code` is a string, keep it as a string
    Data data;
    bool success;
    int error;

    factory PlaceOrderModel.fromJson(Map<String, dynamic> json) {
        try {
            print('statusCode: ${json["status_code"]}');
            //print('data: ${json["data"]}');
            print('success: ${json["success"]}');
            print('error: ${json["error"]}');

            return PlaceOrderModel(
                statusCode: json["status_code"]?.toString() ?? '', // Safely convert to String
                data: Data.fromJson(json["data"] ?? {}), // Provide an empty map if 'data' is null
                success: json["success"] ?? false, // Default to false if 'success' is null
                error: json["error"] // Default to '0' if 'error' is neither String nor int
            );
        } catch (e) {
            print('Error parsing PlaceOrderModel: $e');
            throw e;
        }
    }



    Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "data": data.toJson(),
        "success": success,
        "error": error,
    };
}

class Data {
    Data({
        /*required this.storeId,
        required this.shippingCharges,
        required this.updatedStatus,
        required this.totalVatAmount,*/
        required this.product,
        /*required this.paymentOrderReference,
        required this.customerAddressId,
        required this.totalAmountExclVat,*/
        required this.orderId,
        /*required this.orderTypes,*/
        /*required this.couponDiscountAmount,
        required this.createdAt,
        required this.tax,*/
        required this.store,
        required this.orderDetail,
        /*required this.userId,
        required this.paymentId,
        required this.orderAmount,
        required this.id,*/
        required this.orderStatusCatalog,
    });

    /*String storeId;
    double shippingCharges;
    String updatedStatus;
    String totalVatAmount;*/ // Keep as string
    List<OrderDetail> product;
    /*String paymentOrderReference;
    String customerAddressId;
    double totalAmountExclVat;*/
    String orderId;
    /*int orderTypes;*/
    /*int couponDiscountAmount;
    String createdAt;
    double tax;*/
    List<Store> store;
    List<OrderDetail> orderDetail;
    /*int userId;
    int paymentId;
    double orderAmount;
    int id;*/
    List<dynamic> orderStatusCatalog;

    factory Data.fromJson(Map<String, dynamic> json) {
        try {
            // Print raw JSON for debugging
            print('storeId: ${json["store_id"]}');
            print('shipping_charges: ${json["shipping_charges"]}');
            print('updated_status: ${json["updated_status"]}');
            print('total_vat_amount: ${json["total_vat_amount"]}');
            print('payment_orderReference: ${json["payment_orderReference"]}');
            print('customer_address_id: ${json["customer_address_id"]}');
            print('total_amount_excl_vat: ${json["total_amount_excl_vat"]}');
            print('orderId: ${json["orderId"]}');
            print('order_types: ${json["order_types"]}');
            print('coupon_discount_amount: ${json["coupon_discount_amount"]}');
            print('created_at: ${json["created_at"]}');
            print('tax: ${json["tax"]}');
            print('user_id: ${json["user_id"]}');
            print('payment_id: ${json["payment_id"]}');
            print('order_amount: ${json["order_amount"]}');
            print('id: ${json["id"]}');

            // Safely extract and convert fields with type checks
            return Data(
                /*storeId: json["store_id"] is int
                    ? json["store_id"].toString()
                    : json["store_id"] as String? ?? '',
                shippingCharges: json["shipping_charges"] is String
                    ? double.tryParse(
                    RegExp(r'[\d.]+').firstMatch(json["shipping_charges"])?.group(0) ?? '0'
                ) ?? 0.0
                    : (json["shipping_charges"] is double ? json["shipping_charges"] : 0.0),
                updatedStatus: json["updated_status"] as String? ?? '',
                totalVatAmount: json["total_vat_amount"] is String
                    ? double.tryParse(json["total_vat_amount"]) ?? 0.0
                    : (json["total_vat_amount"] is double ? json["total_vat_amount"].toDouble() : 0.0),*/
                product: (json["product"] as List<dynamic>? ?? [])
                    .map((x) => OrderDetail.fromJson(x as Map<String, dynamic>))
                    .toList(),
               /* paymentOrderReference: json["payment_orderReference"] as String? ?? '',
                customerAddressId: json["customer_address_id"] as String? ?? '',
                totalAmountExclVat: json["total_amount_excl_vat"] is String
                    ? double.tryParse(json["total_amount_excl_vat"]) ?? 0.0
                    : (json["total_amount_excl_vat"] is double ? json["total_amount_excl_vat"] : 0.0),*/
                orderId: json["orderId"] as String? ?? '',
                /*orderTypes: json["order_types"] is int
                    ? json["order_types"]
                    : (json["order_types"] is String ? int.tryParse(json["order_types"] as String? ?? '') ?? 0 : 0),*/
                /*couponDiscountAmount: json["coupon_discount_amount"] is String
                    ? double.tryParse(json["coupon_discount_amount"]) ?? 0.0
                    : (json["coupon_discount_amount"] is double ? json["coupon_discount_amount"] : 0.0),
                createdAt: json["created_at"] as String? ?? '',
                tax: json["tax"] is String
                    ? double.tryParse(json["tax"]) ?? 0.0
                    : (json["tax"] is double ? json["tax"] : 0.0),*/
                store: (json["store"] as List<dynamic>? ?? [])
                    .map((x) => Store.fromJson(x as Map<String, dynamic>))
                    .toList(),
                orderDetail: (json["order_detail"] as List<dynamic>? ?? [])
                    .map((x) => OrderDetail.fromJson(x as Map<String, dynamic>))
                    .toList(),
                /*userId: json["user_id"] is int
                    ? json["user_id"]
                    : (json["user_id"] is String ? int.tryParse(json["user_id"] as String? ?? '') ?? 0 : 0),
                paymentId: json["payment_id"] is int
                    ? json["payment_id"]
                    : (json["payment_id"] is String ? int.tryParse(json["payment_id"] as String? ?? '') ?? 0 : 0),
                orderAmount: json["order_amount"] is String
                    ? double.tryParse(json["order_amount"]) ?? 0.0
                    : (json["order_amount"] is double ? json["order_amount"] : 0.0),
                id: json["id"] is int
                    ? json["id"]
                    : (json["id"] is String ? int.tryParse(json["id"] as String? ?? '') ?? 0 : 0),*/
                orderStatusCatalog: (json["orderStatusCatalog"] as List<dynamic>? ?? []).toList(),
            );




        } catch (e) {
            print('Error parsing Data data: $e');
            throw e;
        }
    }


    Map<String, dynamic> toJson() => {
        /*"store_id": storeId,
        "shipping_charges": shippingCharges,
        "updated_status": updatedStatus,
        "total_vat_amount": totalVatAmount,*/
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
        /*"payment_orderReference": paymentOrderReference,
        "customer_address_id": customerAddressId,
        "total_amount_excl_vat": totalAmountExclVat,*/
        "orderId": orderId,
        /*"order_types": orderTypes,*/
        /*"coupon_discount_amount": couponDiscountAmount,
        "created_at": createdAt,
        "tax": tax,*/
        "store": List<dynamic>.from(store.map((x) => x.toJson())),
        "order_detail": List<dynamic>.from(orderDetail.map((x) => x.toJson())),
        /*"user_id": userId,
        "payment_id": paymentId,
        "order_amount": orderAmount,
        "id": id,*/
        "orderStatusCatalog": List<dynamic>.from(orderStatusCatalog.map((x) => x)),
    };
}


class OrderDetail {
    OrderDetail({
        required this.singleUnitPrice,
        required this.offerRate,
        required this.replaceProduct,
        required this.productPicked,
        required this.product,
        required this.quantity,
        required this.totalPrice,
        required this.discountPrice,
        required this.unitPrice,
        required this.productName,
        required this.discountedQty,
        this.returnRequest,   // Nullable
        required this.productId,
        required this.isOffer,
        required this.offerValue,
        required this.id,
        required this.orderId,
        required this.offerType,
        required this.vatRate,
        this.returnReason,   // Nullable
        this.replaceReason,  // Nullable
        this.pickStatus,     // Nullable
        this.editReason,     // Nullable
        this.deletedAt,      // Nullable
    });

    String singleUnitPrice;
    String offerRate;
    int replaceProduct;
    int productPicked;
    Product product;
    int quantity;
    String totalPrice;
    String discountPrice;
    String unitPrice;
    String productName;
    int discountedQty;
    int? returnRequest; // Nullable
    int productId;
    int isOffer;
    int offerValue;
    int id;
    int orderId;
    int offerType;
    String vatRate;

    // Nullable fields
    String? returnReason;
    String? replaceReason;
    String? pickStatus;
    String? editReason;
    String? deletedAt;

    factory OrderDetail.fromJson(Map<String, dynamic> json){
        try{
            return OrderDetail(
                singleUnitPrice: json["single_unit_price"],
                offerRate: json["offer_rate"],
                replaceProduct: json["replace_product"],
                productPicked: json["product_picked"],
                product: Product.fromJson(json["product"]),
                quantity: json["quantity"],
                totalPrice: json["total_price"],
                discountPrice: json["discount_price"],
                unitPrice: json["unit_price"],
                productName: json["product_name"],
                discountedQty: json["discounted_qty"],
                returnRequest: json["return_request"], // Nullable
                productId: json["product_id"],
                isOffer: json["is_offer"],
                offerValue: json["offer_value"],
                id: json["id"],
                orderId: json["order_id"],
                offerType: json["offer_type"],
                vatRate: json["vat_rate"],
                returnReason: json["return_reason"], // Nullable
                replaceReason: json["replace_reason"], // Nullable
                pickStatus: json["pick_status"], // Nullable
                editReason: json["edit_reason"], // Nullable
                deletedAt: json["deleted_at"], // Nullable
            );
        }catch (e) {
            print('Error parsing Data OrderDetail: $e');
            throw e;
        }

    }

    Map<String, dynamic> toJson() => {
        "single_unit_price": singleUnitPrice,
        "offer_rate": offerRate,
        "replace_product": replaceProduct,
        "product_picked": productPicked,
        "product": product.toJson(),
        "quantity": quantity,
        "total_price": totalPrice,
        "discount_price": discountPrice,
        "unit_price": unitPrice,
        "product_name": productName,
        "discounted_qty": discountedQty,
        "return_request": returnRequest,  // Nullable
        "product_id": productId,
        "is_offer": isOffer,
        "offer_value": offerValue,
        "id": id,
        "order_id": orderId,
        "offer_type": offerType,
        "vat_rate": vatRate,
        "return_reason": returnReason,  // Nullable
        "replace_reason": replaceReason,  // Nullable
        "pick_status": pickStatus,  // Nullable
        "edit_reason": editReason,  // Nullable
        "deleted_at": deletedAt,  // Nullable
    };
}


class Product {
    Product({
        required this.productImage,
        required this.categoryId,
        required this.productImgStatus,
        required this.price,
        required this.subCategoryId,
        required this.id,
        required this.barcode,
        required this.slug,
        required this.whatIncluded,
        required this.height,
        required this.quantity,
        required this.productId,
        required this.length,
        required this.weight,
        required this.productName,
        required this.meteTitle,
        required this.metaDescription,
        required this.amazonLink,
        required this.manufacturedBy,
        required this.width,
        required this.status,
    });

    String productImage;
    int? categoryId; // nullable as it's nullable in the response
    String productImgStatus;
    String price; // Keep as String if needed in string format
    int? subCategoryId;
    int id;
    String barcode;
    String slug;
    String whatIncluded;
    int height;
    int quantity;
    String productId;
    int length;
    double weight;
    String productName;
    String meteTitle;
    String metaDescription;
    String? amazonLink;
    String manufacturedBy;
    int width;
    int status;

    factory Product.fromJson(Map<String, dynamic> json){
        try{
            return Product(
                productImage: json["product_image"],
                categoryId: json["category_id"],
                productImgStatus: json["product_img_status"] ?? "",
                price: json["price"].toString(),
                subCategoryId: json["sub_category_id"],
                id: json["id"],
                barcode: json["barcode"],
                slug: json["slug"],
                whatIncluded: json["what_included"] ?? "",
                height: json["height"],
                quantity: json["quantity"],
                productId: json["productId"] ?? "",
                length: json["length"],
                weight: json["weight"] is String
                    ? double.tryParse(json["weight"]) ?? 0.0
                    : json["weight"].toDouble(),
                productName: json["product_name"],
                meteTitle: json["mete_title"] ?? "",
                metaDescription: json["meta_description"] ?? "",
                amazonLink: json["amazon_link"] ?? "",
                manufacturedBy: json["manufactured_by"] ?? "",
                width: json["width"],
                status: json["status"],
            );

        }catch(e) {
            print('Error parsing Data product: $e');
            throw e;
        }
    }
    Map<String, dynamic> toJson() => {
        "product_image": productImage,
        "category_id": categoryId,
        "product_img_status": productImgStatus,
        "price": price,
        "sub_category_id": subCategoryId,
        "id": id,
        "barcode": barcode,
        "slug": slug,
        "what_included": whatIncluded,
        "height": height,
        "quantity": quantity,
        "product_id": productId,
        "length": length,
        "weight": weight,
        "product_name": productName,
        "mete_title": meteTitle,
        "meta_description": metaDescription,
        "amazon_link": amazonLink,
        "manufactured_by": manufacturedBy,
        "width": width,
        "status": status,
    };
}


class Store {
    Store({
        required this.address,
        required this.lng,
        required this.storeWorkingHours,
        required this.storeEmail,
        required this.storeName,
        required this.id,
        required this.orderSlotThreshold,
        required this.storeContact,
        required this.lat,
    });

    String address;
    String lng;
    String storeWorkingHours;
    String storeEmail;
    String storeName;
    int id;
    int orderSlotThreshold;
    String storeContact;
    String lat;

    factory Store.fromJson(Map<String, dynamic> json) {
        try{
           return  Store(
               address: json["address"] ?? '',
               lng: json["lng"]?.toString() ?? '', // Ensure lng is String
               storeWorkingHours: json["store_working_hours"] ?? '',
               storeEmail: json["store_email"] ?? '',
               storeName: json["store_name"] ?? '',
               id: json["id"] ?? 0, // Fallback to 0 if null
               orderSlotThreshold: json["order_slot_threshold"] ?? 0, // Fallback to 0 if null
               storeContact: json["store_contact"] ?? '',
               lat: json["lat"]?.toString() ?? '', // Ensure lat is String
           );
        }catch(e) {
            print('Error parsing Data Store: $e');
            throw e;
        }
    }

    Map<String, dynamic> toJson() => {
        "address": address,
        "lng": lng,
        "store_working_hours": storeWorkingHours,
        "store_email": storeEmail,
        "store_name": storeName,
        "id": id,
        "order_slot_threshold": orderSlotThreshold,
        "store_contact": storeContact,
        "lat": lat,
    };
}

