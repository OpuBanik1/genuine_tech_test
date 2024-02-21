import 'dart:convert';
import 'package:genuinetech_test/src/model/customer_model.dart';
import 'package:genuinetech_test/src/utils/constant.dart';
import 'package:http/http.dart ' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomHttp {
  static getLogIn(String email, password) async {
    var link =
        'https://www.pqstec.com/InvoiceApps/Values/LogIn?UserName=$email&Password=$password&ComId=1';
    try {
      var response = await http.get(Uri.parse(link));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['Token'] != null) {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString('token', data['Token']);
          return [];
        }
      } else {
        showToast('Email or Password wrong');
      }
    } catch (e) {
      showToast(e.toString());
    }
  }

  static getHeadersWithToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${sharedPreferences.getString('token')}',
    };

    return header;
  }

  static Future<List<CustomerModel>> fetchCustomer(int pageNo) async {
    CustomerModel customerModel;
    List<CustomerModel> customerList = [];
    String link =
        'https://www.pqstec.com/InvoiceApps/Values/GetCustomerList?searchquery&pageNo=$pageNo&pageSize=20&SortyBy=Balance';
    var response = await http.get(Uri.parse(link),
        headers: await CustomHttp.getHeadersWithToken());
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // customerList = List<CustomerModel>.from(
        //   data.map((model) => CustomerModel.fromJson(model)),
        // );
        // print("aaaaaaaaaaaaaaaaaaaaaaaa${data["CustomerList"]}");
        for (var i in data["CustomerList"]) {
          customerModel = CustomerModel.fromJson(i);
          customerList.add(customerModel);
        }

        return customerList;
      } else {
        throw ("wrong");
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
