// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_web/constants.dart';
import 'package:medical_web/core/api/ApiMedical.dart';

import 'package:medical_web/model/medical.dart';
import 'package:medical_web/widget/custom_Textfield.dart';

class NewMedical extends StatefulWidget {
  const NewMedical({super.key});

  @override
  State<NewMedical> createState() => _NewMedicalState();
}

class _NewMedicalState extends State<NewMedical> {
  ApiMed api = ApiMed();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController? snController = TextEditingController();
  TextEditingController? mnController = TextEditingController();
  TextEditingController? caController = TextEditingController();
  TextEditingController? coController = TextEditingController();
  TextEditingController? daController = TextEditingController();
  TextEditingController? quController = TextEditingController();
  TextEditingController? prController = TextEditingController();
  TextEditingController? imController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextF(
                    controller: snController,
                    label: "Since Name",
                    hint: "sn",
                  ),
                  CustomTextF(
                    controller: mnController,
                    label: "Marketing Name",
                    hint: "mn",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextF(
                    controller: caController,
                    label: "Category Name",
                    hint: "cn",
                  ),
                  CustomTextF(
                    controller: coController,
                    label: "Company Name",
                    hint: "cn",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextF(
                    controller: daController,
                    label: "Date",
                    hint: "2000",
                  ),
                  CustomTextF(
                    controller: quController,
                    label: "Qunatity",
                    hint: "10",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextF(
                    controller: prController,
                    label: "Price",
                    hint: "1500",
                  ),
                  CustomTextF(
                    controller: imController,
                    label: "Image Index",
                    hint: "3",
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  try {
                    MedicalModel model = MedicalModel(
                      image: imController!.text.trim(),
                      id: 0,
                      sname: snController!.text.trim(),
                      mname: mnController!.text.trim(),
                      category: caController!.text.trim(),
                      company: coController!.text.trim(),
                      date: daController!.text.trim(),
                      qunatity: quController!.text.trim(),
                      price: prController!.text.trim(),
                    );
                    var respone = await api.postMedical(model);
                    if (respone['status'] == 200) {
                      Get.snackbar(
                        "Successful",
                        "Upload Medical",
                        icon: const Icon(
                          Icons.done,
                          color: Colors.green,
                        ),
                      );
                      Get.offAllNamed("/");
                    } else {
                      Get.snackbar(
                        "Unsuccessful",
                        "Upload Faild",
                        icon: const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text(
                  "Post",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: thirdColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
