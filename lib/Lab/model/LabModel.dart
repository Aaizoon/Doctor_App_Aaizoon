class GetLabListModel {
  Labs labs;
  String message;
  int status;

  GetLabListModel({this.labs, this.message, this.status});

  GetLabListModel.fromJson(Map<String, dynamic> json) {
    labs = json['labs'] != null ? new Labs.fromJson(json['labs']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.labs != null) {
      data['labs'] = this.labs.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Labs {
  int currentPage;
  List<Data> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  Labs(
      {this.currentPage,
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
        this.total});

  Labs.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int labId;
  String labName;
  String labEmail;
  String labPhoneNumber;
  String isActive;
  String labAddress;

  Data(
      {this.labId,
        this.labName,
        this.labEmail,
        this.labPhoneNumber,
        this.isActive,
        this.labAddress});

  Data.fromJson(Map<String, dynamic> json) {
    labId = json['lab_id'];
    labName = json['lab_name'];
    labEmail = json['lab_email'];
    labPhoneNumber = json['lab_phone_number'];
    isActive = json['is_active'];
    labAddress = json['lab_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lab_id'] = this.labId;
    data['lab_name'] = this.labName;
    data['lab_email'] = this.labEmail;
    data['lab_phone_number'] = this.labPhoneNumber;
    data['is_active'] = this.isActive;
    data['lab_address'] = this.labAddress;
    return data;
  }
}
