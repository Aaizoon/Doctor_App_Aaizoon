class LabTestListModel {
  List<Data> data;
  String message;
  int status;

  LabTestListModel({this.data, this.message, this.status});

  LabTestListModel.fromJson(Map<String, dynamic> json) {
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
  List<Tests> tests;

  Data({this.tests});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['tests'] != null) {
      tests = new List<Tests>();
      json['tests'].forEach((v) {
        tests.add(new Tests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tests != null) {
      data['tests'] = this.tests.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tests {
  int testId;
  String testCategory;
  String testName;
  int testFee;
  List<PackagesByLabTestId> packagesByLabTestId;

  Tests(
      {this.testId,
        this.testCategory,
        this.testName,
        this.testFee,
        this.packagesByLabTestId});

  Tests.fromJson(Map<String, dynamic> json) {
    testId = json['test_id'];
    testCategory = json['test_category'];
    testName = json['test_name'];
    testFee = json['test_fee'];
    if (json['packages_by_lab_test_id'] != null) {
      packagesByLabTestId = new List<PackagesByLabTestId>();
      json['packages_by_lab_test_id'].forEach((v) {
        packagesByLabTestId.add(new PackagesByLabTestId.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['test_id'] = this.testId;
    data['test_category'] = this.testCategory;
    data['test_name'] = this.testName;
    data['test_fee'] = this.testFee;
    if (this.packagesByLabTestId != null) {
      data['packages_by_lab_test_id'] =
          this.packagesByLabTestId.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackagesByLabTestId {
  int packageId;
  String packageName;
  String packagePrice;
  List<PackageTestsAvailable> packageTestsAvailable;

  PackagesByLabTestId(
      {this.packageId,
        this.packageName,
        this.packagePrice,
        this.packageTestsAvailable});

  PackagesByLabTestId.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    packageName = json['package_name'];
    packagePrice = json['package_price'];
    if (json['package_tests_available'] != null) {
      packageTestsAvailable = new List<PackageTestsAvailable>();
      json['package_tests_available'].forEach((v) {
        packageTestsAvailable.add(new PackageTestsAvailable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_id'] = this.packageId;
    data['package_name'] = this.packageName;
    data['package_price'] = this.packagePrice;
    if (this.packageTestsAvailable != null) {
      data['package_tests_available'] =
          this.packageTestsAvailable.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackageTestsAvailable {
  String testName;

  PackageTestsAvailable({this.testName});

  PackageTestsAvailable.fromJson(Map<String, dynamic> json) {
    testName = json['test_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['test_name'] = this.testName;
    return data;
  }
}
