// To parse this JSON data, do
//
//     final saveCityResponseModel = saveCityResponseModelFromJson(jsonString);

import 'dart:convert';

SaveCityResponseModel saveCityResponseModelFromJson(String str) => SaveCityResponseModel.fromJson(json.decode(str));

String saveCityResponseModelToJson(SaveCityResponseModel data) => json.encode(data.toJson());

class SaveCityResponseModel {
  SaveCityResponseModel({
    this.success,
    this.error,
    this.data,
    this.message,
    this.status,
  });

  bool success;
  bool error;
  Data data;
  String message;
  int status;

  factory SaveCityResponseModel.fromJson(Map<String, dynamic> json) => SaveCityResponseModel(
        success: json["success"],
        error: json["error"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  Data({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
