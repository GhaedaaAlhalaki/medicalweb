// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medical_web/constants.dart';
import 'package:medical_web/model/order.dart';

class ApiOrder {
  Future<List> getOrder() async {
    try {
      var response = await http.get(Uri.parse(linkorder));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error(response.statusCode);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  postOrder(OrderModel orderModel) async {
    try {
      var response = await http.post(
        Uri.parse(linkorderpost),
        body: {
          'owner': orderModel.owner,
          'mname': orderModel.mname,
          'oprice': orderModel.oprice,
          'ostate': orderModel.ostate,
          'pstate': orderModel.pstate,
          'mqunatity': orderModel.mqunatity,
        },
      );
      if (response.statusCode == 200) {
        var responbody = jsonDecode(response.body);
        return responbody;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return e;
    }
  }

  editOrder(String id, String os, String ps) async {
    try {
      var response = await http.post(
        Uri.parse(linkorderupdate + id),
        body: {
          'ostate': os,
          'pstate': ps,
        },
      );
      if (response.statusCode == 200) {
        var responbody = jsonDecode(response.body);
        return responbody;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return e;
    }
  }
}
