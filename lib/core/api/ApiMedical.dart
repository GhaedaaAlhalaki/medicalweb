// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medical_web/constants.dart';
import 'package:medical_web/model/medical.dart';

class ApiMed {
  Future<List> getmedical() async {
    try {
      var response = await http.get(Uri.parse(linkproduct));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  getmedicalid(int id) async {
    try {
      var response = await http.get(Uri.parse(linkproductid + id.toString()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return e;
    }
  }

  postMedical(MedicalModel medicalModel) async {
    try {
      var response = await http.post(
        Uri.parse(linkproductpost),
        body: {
          'sname': medicalModel.sname,
          'mname': medicalModel.mname,
          'category': medicalModel.category,
          'company': medicalModel.company,
          'date': medicalModel.date,
          'qunatity': medicalModel.qunatity,
          'price': medicalModel.price,
          'image': medicalModel.image,
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

  editmedical(String id, String qun) async {
    try {
      var response = await http.post(
        Uri.parse(linkproductupdate + id),
        body: {
          'qunatity': qun,
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
