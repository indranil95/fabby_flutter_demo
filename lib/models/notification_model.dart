import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationData? data;
  bool? success;
  int? error;
  String? statusCode;

  NotificationModel({
    this.data,
    this.success,
    this.error,
    this.statusCode,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    data: json["data"] == null ? null : NotificationData.fromJson(json["data"]),
    success: json["success"],
    error: json["error"],
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "success": success,
    "error": error,
    "status_code": statusCode,
  };
}

class NotificationData {
  int? currentPage;
  List<NotificationDatum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  NotificationData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<NotificationDatum>.from(json["data"]!.map((x) => NotificationDatum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class NotificationDatum {
  int? id;
  int? userId;
  String? userName;
  int? orderId;
  String? orderNo;
  String? title;
  String? text;
  int? type;
  int? isRead;
  DateTime? createdAt;
  DateTime? updatedAt;

  NotificationDatum({
    this.id,
    this.userId,
    this.userName,
    this.orderId,
    this.orderNo,
    this.title,
    this.text,
    this.type,
    this.isRead,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationDatum.fromJson(Map<String, dynamic> json) => NotificationDatum(
    id: json["id"],
    userId: json["user_id"],
    userName: json["user_name"],
    orderId: json["order_id"],
    orderNo: json["order_no"],
    title: json["title"],
    text: json["text"],
    type: json["type"],
    isRead: json["is_read"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "user_name": userName,
    "order_id": orderId,
    "order_no": orderNo,
    "title": title,
    "text": text,
    "type": type,
    "is_read": isRead,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
