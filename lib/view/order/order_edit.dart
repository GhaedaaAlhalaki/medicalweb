// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_web/core/api/ApiMedical.dart';
import 'package:medical_web/core/api/ApiOrder.dart';
import 'package:medical_web/model/order.dart';
import 'package:medical_web/view/homeview.dart';

class OrderEdit extends StatefulWidget {
  const OrderEdit({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  State<OrderEdit> createState() => _OrderEditState();
}

class _OrderEditState extends State<OrderEdit> {
  ApiOrder apiOrder = ApiOrder();
  ApiMed apiMed = ApiMed();
  String? oselected;
  String? pselected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("${widget.orderModel.id}"),
          Text(widget.orderModel.owner),
          Text(widget.orderModel.mname),
          Text(widget.orderModel.mqunatity),
          DropdownButton(
            hint: Text(widget.orderModel.ostate),
            items: const [
              DropdownMenuItem(
                value: "Binding",
                child: Text("Binding"),
              ),
              DropdownMenuItem(
                value: "On Delevir",
                child: Text("On Delevir"),
              ),
              DropdownMenuItem(
                value: "Done",
                child: Text("Done"),
              ),
            ],
            value: oselected,
            onChanged: (String? string) {
              setState(() {
                oselected = string;
              });
            },
          ),
          DropdownButton(
            hint: Text(widget.orderModel.pstate),
            items: const [
              DropdownMenuItem(
                value: "Payed",
                child: Text("Payed"),
              ),
              DropdownMenuItem(
                value: "Not Payed",
                child: Text("Not Payed"),
              ),
            ],
            value: pselected,
            onChanged: (String? string) {
              setState(() {
                pselected = string;
              });
            },
          ),
          Text(widget.orderModel.oprice),
          Text(widget.orderModel.ostate),
          Text(widget.orderModel.pstate),
          IconButton(
              onPressed: () async {
                try {
                  if (oselected != null && pselected != null) {
                    var respone = await apiOrder.editOrder(
                      widget.orderModel.id.toString(),
                      oselected.toString(),
                      pselected.toString(),
                    );
                    if (respone["status"] == 200) {
                      Get.snackbar(
                        "Done",
                        "Edit Complete",
                        icon: const Icon(
                          Icons.done,
                          color: Colors.green,
                        ),
                      );
                      if (oselected == "Done") {
                        List<int> listq = widget.orderModel.mqunatity
                            .replaceAll('[', '')
                            .replaceAll(']', '')
                            .split(',')
                            .map<int>((e) {
                          return int.parse(e);
                        }).toList();
                        List<int> listid = widget.orderModel.mid
                            .replaceAll('[', '')
                            .replaceAll(']', '')
                            .split(',')
                            .map<int>((e) {
                          return int.parse(e);
                        }).toList();

                        for (var i = 0; i < listq.length; i++) {
                          var mres = await apiMed.getmedicalid(listid[i]);
                          if (mres["status"] == 200) {
                            var nq =
                                int.parse(mres['val']['qunatity']) - listq[i];
                            var res = await apiMed.editmedical(
                              listid[i].toString(),
                              nq.toString(),
                            );
                            if (res["status"] == 200) {
                              print("done");
                            }
                          }
                        }
                      }
                      Get.offAll(() => HomeView());
                    } else {
                      print(respone);
                    }
                  }
                } catch (e) {
                  print(e);
                }
              },
              icon: const Icon(Icons.done))
        ],
      ),
    );
  }
}
