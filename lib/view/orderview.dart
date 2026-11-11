import 'package:flutter/material.dart';
import 'package:medical_web/core/api/ApiOrder.dart';
import 'package:medical_web/model/order.dart';
import 'package:medical_web/widget/order_widget.dart';

class orderwidget extends StatelessWidget {
  const orderwidget({
    super.key,
    required this.apiOrder,
  });

  final ApiOrder apiOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: apiOrder.getOrder(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) => OrderCard(
                  order: OrderModel(
                    id: snapshot.data![index]["id"],
                    mid: snapshot.data![index]["mid"],
                    owner: snapshot.data![index]["owner"],
                    mqunatity: snapshot.data![index]["mqunatity"],
                    mname: snapshot.data![index]["mname"],
                    oprice: snapshot.data![index]["oprice"],
                    ostate: snapshot.data![index]["ostate"],
                    pstate: snapshot.data![index]["pstate"],
                    create: snapshot.data![index]["created_at"],
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text("no data"),
              );
            }
          },
        ),
      ),
    );
  }
}
