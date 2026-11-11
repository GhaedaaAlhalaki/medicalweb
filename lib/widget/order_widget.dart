import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_web/constants.dart';
import 'package:medical_web/model/order.dart';
import 'package:medical_web/view/order/order_edit.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kDefaultPadding / 2),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: thirdColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Get.to(() => OrderEdit(orderModel: order));
              },
              icon: const Icon(Icons.edit)),
          Row(
            children: [
              Text(order.owner),
              Text(order.mname),
            ],
          ),
          Row(
            children: [
              Text(order.mqunatity),
              Text(order.oprice),
            ],
          ),
          Row(
            children: [
              Text(order.ostate),
              Text(order.pstate),
            ],
          ),
          Text(order.create),
        ],
      ),
    );
  }
}
