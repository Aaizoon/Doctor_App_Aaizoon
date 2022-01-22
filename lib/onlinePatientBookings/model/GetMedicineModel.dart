class GetMedicineModel {
  List<Data> data;
  String message;
  int status;

  GetMedicineModel({this.data, this.message, this.status});

  GetMedicineModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int id;
  String name;
  String prescription;
  String packageDetails;
  String manufacturer;
  String composition;
  String mrp;
  String uses;
  String alternateMedicines;
  String sideEffects;
  String howToUse;
  String chemicalClass;
  String habitForming;
  String therapeuticClass;
  String actionClass;

  Data(
      {this.id,
        this.name,
        this.prescription,
        this.packageDetails,
        this.manufacturer,
        this.composition,
        this.mrp,
        this.uses,
        this.alternateMedicines,
        this.sideEffects,
        this.howToUse,
        this.chemicalClass,
        this.habitForming,
        this.therapeuticClass,
        this.actionClass});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    prescription = json['prescription'];
    packageDetails = json['package_details'];
    manufacturer = json['manufacturer'];
    composition = json['composition'];
    mrp = json['mrp'];
    uses = json['uses'];
    alternateMedicines = json['alternate_medicines'];
    sideEffects = json['side_effects'];
    howToUse = json['how_to_use'];
    chemicalClass = json['chemical_class'];
    habitForming = json['habit_forming'];
    therapeuticClass = json['therapeutic_class'];
    actionClass = json['action_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['prescription'] = this.prescription;
    data['package_details'] = this.packageDetails;
    data['manufacturer'] = this.manufacturer;
    data['composition'] = this.composition;
    data['mrp'] = this.mrp;
    data['uses'] = this.uses;
    data['alternate_medicines'] = this.alternateMedicines;
    data['side_effects'] = this.sideEffects;
    data['how_to_use'] = this.howToUse;
    data['chemical_class'] = this.chemicalClass;
    data['habit_forming'] = this.habitForming;
    data['therapeutic_class'] = this.therapeuticClass;
    data['action_class'] = this.actionClass;
    return data;
  }
}
