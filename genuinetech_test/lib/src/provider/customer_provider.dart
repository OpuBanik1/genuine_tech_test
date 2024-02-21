import 'package:flutter/material.dart';

import 'package:genuinetech_test/src/model/customer_model.dart';
import 'package:genuinetech_test/src/service/custtom_http.dart';

class Customer_provider with ChangeNotifier {
  List<CustomerModel> customerList = [];

  getCustomerList(int pageNo) async {
    customerList = await CustomHttp.fetchCustomer(pageNo);
    notifyListeners();
  }
}
