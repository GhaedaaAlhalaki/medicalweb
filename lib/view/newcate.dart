// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_web/constants.dart';
import 'package:medical_web/core/api/ApiCate.dart';
import 'package:medical_web/model/category.dart';
import 'package:medical_web/widget/custom_Textfield.dart';

class NewCate extends StatefulWidget {
  const NewCate({super.key});

  @override
  State<NewCate> createState() => _NewCateState();
}

class _NewCateState extends State<NewCate> {
  ApiCate api = ApiCate();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController? cController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              CustomTextF(
                controller: cController,
                label: "Cate Name",
                hint: "Bio",
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
                    CategoryModel model = CategoryModel(
                      name: cController!.text.trim(),
                    );
                    print(cController!.text);
                    var respone = await api.postCate(model);
                    if (respone['status'] == 200) {
                      Get.snackbar(
                        "Successful",
                        "Upload CateGory",
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
