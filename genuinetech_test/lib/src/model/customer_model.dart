import 'dart:convert';

List<CustomerModel> blogModelFromJson(String str) => List<CustomerModel>.from(
    json.decode(str).map((x) => CustomerModel.fromJson(x)));

String customerModelToJson(List<CustomerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerModel {
  int? id;
  String? name;
  String? email;
  String? primaryAddress;
  String? secoundaryAddress;
  String? notes;
  String? phone;
  String? custType;
  String? parentCustomer;
  String? imagePath;
  int? totalDue;
  String? lastSalesDate;
  String? lastInvoiceNo;
  String? lastSoldProduct;
  int? totalSalesValue;
  int? totalSalesReturnValue;
  int? totalAmountBack;
  int? totalCollection;
  String? lastTransactionDate;
  String? clinetCompanyName;

  CustomerModel(
      {this.id,
      this.name,
      this.email,
      this.primaryAddress,
      this.secoundaryAddress,
      this.notes,
      this.phone,
      this.custType,
      this.parentCustomer,
      this.imagePath,
      this.totalDue,
      this.lastSalesDate,
      this.lastInvoiceNo,
      this.lastSoldProduct,
      this.totalSalesValue,
      this.totalSalesReturnValue,
      this.totalAmountBack,
      this.totalCollection,
      this.lastTransactionDate,
      this.clinetCompanyName});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['Id'],
      name: json['Name'],
      email: json['Email'],
      primaryAddress: json['PrimaryAddress'],
      secoundaryAddress: json['SecoundaryAddress'],
      notes: json['Notes'],
      phone: json['Phone'],
      custType: json['CustType'],
      parentCustomer: json['ParentCustomer'],
      imagePath: json['ImagePath'],
      totalDue: json['TotalDue'],
      lastSalesDate: json['LastSalesDate'],
      lastInvoiceNo: json['LastInvoiceNo'],
      lastSoldProduct: json['LastSoldProduct'],
      totalSalesValue: json['TotalSalesValue'],
      totalSalesReturnValue: json['TotalSalesReturnValue'],
      totalAmountBack: json['TotalAmountBack'],
      totalCollection: json['TotalCollection'],
      lastTransactionDate: json['LastTransactionDate'],
      clinetCompanyName: json['ClinetCompanyName'],
    );
  }
  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Email': email,
        'PrimaryAddress': primaryAddress,
        'ScoundaryAddress': secoundaryAddress,
        'Notes': notes,
        'Phone': phone,
        'CustType': custType,
        'ParentCustomer': parentCustomer,
        'ImagePath': imagePath,
        'TotalDue': totalDue,
        'LastSalesDate': lastSalesDate,
        'LastInvoiceNo': lastInvoiceNo,
        'LastSoldProduct': lastSoldProduct,
        'TotalSalesValue': totalSalesValue,
        'TotalSalesReturnValue': totalSalesReturnValue,
        'TotalAmountBack': totalAmountBack,
        'TotalCollection': totalCollection,
        'LastTransactionDate': lastTransactionDate,
        'ClinetCompanyName': clinetCompanyName
      };
}
