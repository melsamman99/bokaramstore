import 'dart:async';

import 'package:bokaramstore/getdataromweb/allNetworking.dart';
import 'package:bokaramstore/getdataromweb/catProvider.dart';
import 'package:bokaramstore/jsondata/get_old_orders_json.dart';
import 'package:bokaramstore/jsondata/get_order_details_json.dart';
import 'package:bokaramstore/jsondata/get_products_details_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'login.dart';

class OldOrders extends StatefulWidget {
  @override
  _OldOrdersState createState() => _OldOrdersState();
}

class _OldOrdersState extends State<OldOrders> {
  final box = GetStorage();
  String token;
  AllNetworking _allNetworking = AllNetworking();
  String lang;
  @override
  void initState() {
    super.initState();
    token = box.read('token');
    lang = box.read('lang');
    // Timer(Duration(seconds: 0), () async {
    //   Map mapR = await _allNetworking.get_order_details(
    //       id_order: "24",
    //       token_id: token,
    //       lang: 'ar');
    //   setState(() {
    //
    //   });
    //   // Map map = await CatProvider.orders;
    //   print("oooooooooooooo${mapR}");
    // });
  }

  List<List<Widget>> list = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        top: true,
        child: Scaffold(
            appBar: AppBar(
              title: Text( 'order'.tr),
            ),
            body:token!=null? StreamBuilder<Get_old_orders_json>(
                stream: _allNetworking
                    .get_old_orders(lang: 'ar', token_id: token)
                    .asStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.result.orderDetails.length > 0) {
                      return ListView.builder(
                          itemCount: snapshot.data.result.orderDetails.length,
                          itemBuilder: (context, pos) {
                            print('000000000000000000000000000000000000000000');
                            print(snapshot
                                .data.result.orderDetails[pos].viewStore);
                            print('000000000000000000000000000000000000000000');

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueAccent.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16, right: 16),
                                            child: snapshot
                                                        .data
                                                        .result
                                                        .orderDetails[pos]
                                                        .viewId==0
                                                ? GestureDetector(
                                                    onTap: () {
                                                      _allNetworking
                                                          .cancel_order(
                                                              lang:lang,
                                                              token_id: token,
                                                              order_id: snapshot
                                                                  .data
                                                                  .result
                                                                  .orderDetails[
                                                                      pos]
                                                                  .idOrder)
                                                          .then((value) {
                                                        Get.snackbar(
                                                            '', value.message);
                                                      });
                                                    },
                                                    child: Text('Cancel'.tr))
                                                : GestureDetector(
                                                    onTap: () {
                                                      _allNetworking
                                                          .delete_order(
                                                              lang: 'ar',
                                                              token_id: token,
                                                              order_id: snapshot
                                                                  .data
                                                                  .result
                                                                  .orderDetails[
                                                                      pos]
                                                                  .idOrder)
                                                          .then((value) {
                                                        Get.snackbar(
                                                            '', value.message);
                                                      });
                                                    },
                                                    child: Text('??????')),
                                          ))
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text(
                                            '???????????? : ',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text(snapshot.data.result
                                              .orderDetails[pos].viewStore),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text(
                                            'ordernum'.tr,
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text(snapshot.data.result
                                              .orderDetails[pos].idOrder
                                              .toString()),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text(
                                            'shipping'.tr ,
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text("${snapshot.data.result.orderDetails[pos].shippingCharges} ${snapshot.data.result.orderDetails[pos].currencyName}"),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text(
                                            'products'.tr,
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text(snapshot.data.result
                                              .orderDetails[pos].totalProduct),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text(
                                            '?????????????? : ',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text(snapshot.data.result
                                              .orderDetails[pos].date??""),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text(
                                            '?????????????? ???????????? : ',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          child: Text("${snapshot.data.result.orderDetails[pos].totalPrice} ${snapshot.data.result.orderDetails[pos].currencyName}"),
                                        ),
                                      ],
                                    ),
                                    FutureBuilder(
                                        future:
                                            _allNetworking.get_order_details(
                                                id_order: snapshot.data.result
                                                    .orderDetails[pos].idOrder.toString(),
                                                token_id: token,
                                                lang: 'ar'),
                                        builder: (context, snapshot2) {
                                          // print(snapshot2.data);
                                          if (snapshot2.hasData) {
                                            List<Widget> list = [];
                                            for (int i = 0;
                                                i <
                                                    snapshot2.data["result"]["all_products"].length;
                                                i++) {
                                              list.add(Productsiteem(
                                                  size: size,
                                                  offers: snapshot2.data['result']["all_products"][i]));
                                            }
                                            return ExpansionTile(
                                              title: Text('????????????'),
                                              children: list,
                                            );
                                          } else {
                                            return Center(
                                              child: Container(width: 100,height: 100,child: CircularProgressIndicator()),
                                            );
                                          }
                                        })
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: Text('???? ???????? ??????????'),
                      );
                    }
                  } else {
                    return Center(
                      child: Container(width: 100,height: 100,child: CircularProgressIndicator()),
                    );
                  }
                }):Center(
            child: GestureDetector(
            onTap: () {
      Get.to(LoginSCR());
      },
        child: Container(
          height: 50,
          width: 200,
          child: Center(
            child: Text( 'savep'.tr,
                style: TextStyle(
                    fontFamily: 'Arbf',
                    color: Colors.white,
                    fontSize: 23)),
          ),
          decoration: BoxDecoration(color:  Colors.blue[800],
              borderRadius: BorderRadius.circular(40.0)),
        ),
      ),
    ),),
      ),
    );
  }

  Widget Productsiteem({offers, size}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: size.height * .2,
        width: size.width * .9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                offers['image'],
                width: size.width * .3,
                height: size.height * .15,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 2),
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: size.height * .1,
                      width: size.width * .3,
                      child: Text(offers['product_name']),
                    ),
                  ),
                  Text("${offers['price']} ${offers["currencyName"]}")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(offers["quantity"].toString(),
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
