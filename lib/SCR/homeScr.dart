import 'dart:async';
import 'package:bokaramstore/MyWidget/customwidget.dart';
import 'package:bokaramstore/MyWidget/my_flutter_app_icons.dart';
import 'package:bokaramstore/MyWidget/tabitem.dart';
import 'package:bokaramstore/getdataromweb/catProvider.dart';
import 'package:bokaramstore/jsondata/get_all_department_json.dart';
import 'package:flutter/cupertino.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:share/share.dart';
import 'package:bokaramstore/MyWidget/drawer.dart';
import 'package:bokaramstore/SCR/productDetails.dart';
import 'package:bokaramstore/SCR/profileScr.dart';
import 'package:bokaramstore/Translation/Trans.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:bokaramstore/getdataromweb/allNetworking.dart';
import 'package:bokaramstore/jsondata/get_home_json.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'allitems.dart';
import 'classification.dart';
import 'get_all_products_category.dart';
import 'login.dart';
import 'myfavorite.dart';
import 'notificationScr.dart';
import 'shoppingCart.dart';

class HomeSCR extends StatefulWidget {

  @override
  _HomeSCRState createState() => _HomeSCRState();
}

class _HomeSCRState extends State<HomeSCR> {
  AllNetworking _allNetworking = AllNetworking();
  List<Widget> itemSliders1 = [];
  List<AllSliders> allSliders = [];
  int selectedPosition=0 ;
  List<Widget> itemSliders2 = [];
  List<AllSliders> allSliders2 = [];
  List<Widget> itemSliders3 = [];
  List<Widget> Banners = [];
  List<Widget> Banners2 = [];
  TextEditingController _textEditingController = TextEditingController();
  int _selectedIndex = 0;
  final box = GetStorage();
  String token;
  String lang;
  AllFastFree offers;
  List<Widget> serch = [];
  bool serchbargetdata = false;
  var local = Get.locale;
  bool isSelected=false;
  @override
  void initState() {
    token = box.read('token');
    print(token);
    lang = box.read('lang');
Timer(Duration(seconds: 0), ()async{
  await LocalizationService().changeLocale(lang);
  // setState(() {
    CatProvider.data = await _allNetworking.get_all_department(lang: lang, token_id: token);
  // });
  // print("rrrrrrrrrrrrrr${data.result.categories[0].categoryName}");
});

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    lang = box.read('lang');
    GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    String token = box.read('token');

    return Scaffold(
      key: _scaffoldState,
      drawer: DR(),
      //MyDrawertest(context, lang), //MyDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        centerTitle: true,
          automaticallyImplyLeading:false,
        title: Container(
            width: size.width * .99,
            child: Container(
              height: MediaQuery.of(context).size.height * .1,
              width: MediaQuery.of(context).size.height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap:(){
                            Get.to(token!=null?NotificationScr():LoginSCR());
                          },
                          child: Icon(Icons.notification_important,size: 28,)),
                      SizedBox(width: 10,),
                      GestureDetector(
                          onTap:(){
                            Get.to(token!=null?ProfileScr():LoginSCR());
                          },
                          child: Icon(Icons.person,size: 28,)),

                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/log.png',
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
            )),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CustomNotchedRectangle(),
        child: Builder(
          builder: (context) => Container(
            height: 75,
            // padding: EdgeInsets.symmetric(horizontal: 1),
            // margin: EdgeInsets.symmetric(horizontal: 3),
            child: Row(
                 mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabItem(
                  text: "home".tr,
                  isSelected: selectedPosition == 0,
                  icon: Icons.home,
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomeSCR()));
                    setState(() {
                      selectedPosition = 0;
                    });
                  },
                ),
                TabItem(
                  text: 'favorite'.tr,
                  isSelected: selectedPosition == 1,
                  icon: Icons.favorite,
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MyFavorite()));
                    setState(() {
                      selectedPosition = 1;
                    });
                  },
                ),
                SizedBox(
                  width: size.width * .10,
                ),
                TabItem(
                  text: 'mainsections'.tr,
                  isSelected: selectedPosition == 2,
                icon: MyFlutterApp.categories,
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> Classify()));
                    setState(() {
                      selectedPosition = 2;
                    });
                  },
                ),
                // GestureDetector(
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=> Classify()));
                //           selectedPosition = 2;
                //
                //   },
                //   child: Column(mainAxisSize: MainAxisSize.max,
                //     children: [
                //       Container(width:50,height: 50,
                //           child: Tab(icon:Image.asset("assets/images/apps.PNG",))),
                //       Text('mainsections'.tr,style: TextStyle(
                //           color: selectedPosition == 2 ? Colors.blue[800] : Colors.grey,
                //           fontWeight: selectedPosition ==2 ? FontWeight.w600 : FontWeight.normal,
                //           fontSize: 13
                //       ))
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   width: size.width * .04,
                // ),
                // GestureDetector(
                //   onTap: (){
                //     Scaffold.of(context).openDrawer();
                //   },
                //   child: Container(
                //     alignment: Alignment.topCenter,
                //       child: Tab(icon:Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           SizedBox(height: 2,),
                //           Image.asset("assets/images/more.PNG",height: 35,width: 35,fit: BoxFit.fill,),
                //           Text('more'.tr,style: TextStyle(
                //               // color: selectedPosition== 3 ? Colors.blue[800] : Colors.grey,
                //               // fontWeight: selectedPosition==3 ? FontWeight.w600 : FontWeight.normal,
                //               fontSize: 13
                //           ))
                //         ],
                //       ))),
                // ),
                // SizedBox(
                //   width: size.width * .01,
                // ),
               TabItem(
                    text: "more".tr,
                    isSelected: selectedPosition == 3,
                    icon: Icons.more_horiz,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    }),
                SizedBox(
                  width: size.width * .05,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            if (token == null) {
              Get.to(LoginSCR());
            } else {
              // if (offers.exitCart == 0) {
              //   _allNetworking
              //       .add_new_product(
              //       id_product: int.parse(offers.offerId),
              //       id_key: 1,
              //       token_id: token)
              //       .then((value) {
              //     print(value.message);
              //     setState(() {});
              //     Get.snackbar('', value.message);
              //   });
              // } else {
                Get.to(Shopping_Cart());
              // }
            }
          },
          backgroundColor: Colors.blue[800],
          child: Icon(Icons.shopping_bag_outlined),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: Container(child: selectedPosition==1?MyFavorite():selectedPosition==2?Classify():myhomee(i: _selectedIndex, size: size)),
    );
  }

  Widget myhomee({int i, size}) {
    /*24 is for notification bar on Android*/
    //- kToolbarHeight - 24
    token = box.read('token');
    if (i == 0) {
      return StreamBuilder<Get_home_json>(
          stream:
              _allNetworking.Get_home(lang: lang, token_id: token).asStream(),
          builder: (context, snapshot) {
            var size = MediaQuery.of(context).size;
            if (snapshot.hasData) {
              allSliders = snapshot.data.result.allSliders;
              for (int i = 0; i < snapshot.data.result.allSliders.length; i++) {
                itemSliders1.add(Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber),
                    child: GestureDetector(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              snapshot.data.result.allSliders[i].sliderImg,
                              fit: BoxFit.fill,),
                        ),
                        onTap: () {
                          Get.to(ProductDetails(snapshot
                                  .data.result.allBestProducts[i].productId));
                        }))

                ));
                Container(
                  width: size.width*.95,
                  height: size.height * .1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      snapshot.data.result.allSliders[i].sliderImg,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }
              //banner
              for (int i = 0; i < snapshot.data.result.all_first_banners.length; i++) {
                Banners.add(Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber),
                        child: GestureDetector(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                snapshot.data.result.all_first_banners[i].firstBanner,
                                fit: BoxFit.fill,),
                            ),
                            onTap: () {
                            }))

                ));
                Container(
                  width: size.width*.95,
                  height: size.height * .1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      snapshot.data.result.allSliders[i].sliderImg,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }
              /////
              for (int i = 0; i < snapshot.data.result.all_second_banners.length; i++) {
                Banners2.add(Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber),
                        child: GestureDetector(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                snapshot.data.result.all_second_banners[i].secondBanner,
                                fit: BoxFit.fill,),
                            ),
                            onTap: () {
                            }))

                ));
                Container(
                  width: size.width*.95,
                  height: size.height * .1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      snapshot.data.result.allSliders[i].sliderImg,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
                // print("oijoijionioniinl${snapshot.data.result.allSliders[i].sliderImg}");
                print("ععهاعهخاهعرنرخه${snapshot.data.result.all_second_banners[i].secondBanner}");

              }


              for (int i = 0; i < snapshot.data.result.allPartners.length;
                  i++) {
                itemSliders3.add(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: size.width * .8,
                    height: size.height * .1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        snapshot.data.result.allPartners[i].imageCateg,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ));
              }
              for (int i = 0; i < snapshot.data.result.allCategories.length; i++) {
                itemSliders2.add(GestureDetector(
                  onTap: () {
                    Get.to(Get_All_Products_Category(
                      id: snapshot.data.result.allCategories[i].categoryId,
                      name: snapshot.data.result.allCategories[i].categoryName,
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // width:  size.width,
                        // height: size.height * .15, width: size.height * .2,
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                snapshot
                                    .data.result.allCategories[i].imageCateg,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              snapshot
                                  .data.result.allCategories[i].categoryName,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
              }

              for (int i = 0; i < snapshot.data.result.allPartners.length;
                  i++) {
                // itemSliders2.add(Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     children: [
                //       Expanded(
                //         child: Container(
                //           //width: 400,
                //
                //           child: Image.network(
                //             snapshot.data.result.allPartners[i].imageCateg,
                //             fit: BoxFit.fill,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ));
              }
              int currentIndex;
              return Column(
                children: [
                  Container(
                    color: Colors.blue[800],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: lang == 'ar' || lang == null
                                      ? BorderRadius.only(
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30))
                                      : BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          topLeft: Radius.circular(30)),
                                ),
                                child: serchbargetdata
                                    ? CircularProgressIndicator()
                                    : GestureDetector(
                                        onTap: () {
                                          print(_textEditingController.text);
                                          serch.clear();
                                          serchbargetdata = true;
                                          setState(() {});
                                          _allNetworking
                                              .get_search_name(
                                                  name: _textEditingController
                                                      .text,
                                                  lang: lang,
                                                  token_id: token)
                                              .then((value) async {
                                            for (int i = 0;
                                                i <
                                                    value.result.allProducts
                                                        .length;
                                                i++) {
                                              serch.add(GestureDetector(
                                                  onTap: () {
                                                    Get.to(ProductDetails(
                                                        snapshot
                                                            .data
                                                            .result
                                                            .allBestProducts[i]
                                                            .productId));
                                                  },
                                                  child: Productsiteem(
                                                      offers: snapshot
                                                          .data
                                                          .result
                                                          .allBestProducts[i],
                                                      size: size)));
                                            }
                                            serchbargetdata = false;

                                            setState(() {});
                                            // set up the button
                                            Widget okButton = FlatButton(
                                              child: Text("OK"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            );
                                            if (serch.length == 0) {
                                              AlertDialog alert = AlertDialog(
                                                title: Text("نتيجة البحث"),
                                                content: Container(
                                                  height: size.height * .2,
                                                  width: size.width * .8,
                                                  child: Center(
                                                    child: Text('result'.tr),
                                                  ),
                                                ),
                                                actions: [
                                                  okButton,
                                                ],
                                              );
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return alert;
                                                },
                                              );
                                            } else {
                                              AlertDialog alert = AlertDialog(
                                                title: Text("نتيجة البحث"),
                                                content: Container(
                                                  height: size.height * .8,
                                                  width: size.width * .8,
                                                  child: ListView(
                                                    children: serch,
                                                  ),
                                                ),
                                                actions: [
                                                  okButton,
                                                ],
                                              );
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return alert;
                                                },
                                              );
                                            }
                                            // set up the AlertDialog

                                            // show the dialog
                                          });
                                        },
                                        child: Icon(
                                          Icons.search_rounded,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: _textEditingController,
                                  //  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      hintText: 'look'.tr,
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverFixedExtentList(
                          itemExtent: size.height * .2,
                          delegate: SliverChildListDelegate([
                            ClipRRect (
                             borderRadius: BorderRadius.circular(20),
                              child: CarouselSlider(
                                items: itemSliders1,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  viewportFraction: .95,
                                  aspectRatio: 2,
                                  height: size.height * .35,
                                  enlargeCenterPage: true,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SliverFixedExtentList(
                          itemExtent: size.height * .05,
                          delegate: SliverChildListDelegate([
                            Container(child: Center(child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0; i < snapshot.data.result.allSliders.length ; i++)
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                          height: 10, width: 10,
                                          decoration: BoxDecoration(
                                              color: i == currentIndex ? Colors.white : Colors.grey,
                                              borderRadius: BorderRadius.circular(5)
                                          )
                                      ),
                                    )
                                ]
                            ),),)
                          ]),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text('Classifications'.tr,
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.grey[600])),
                                ),  GestureDetector(
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> Classify()));
                                 }  ,
                                  child: Text('all'.tr,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.red)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: SizedBox(
                          height: 2,
                        )),
                        SliverFixedExtentList(
                          itemExtent: size.height * .2,
                          delegate: SliverChildListDelegate([
                            Container(
                              child: CarouselSlider(
                                items: itemSliders2,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  viewportFraction: .33,
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SliverToBoxAdapter(
                            child: SizedBox(
                          height: 2,
                        )),
                        SliverFixedExtentList(

                          itemExtent: size.height * .2,
                          delegate: SliverChildListDelegate([
                            ClipRRect (
                              borderRadius: BorderRadius.circular(20),
                              child: CarouselSlider(
                                items: Banners,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  disableCenter: true,
                                  viewportFraction: .8,
                                  aspectRatio: 1,
                                  height: size.height * .35,
                                  enlargeCenterPage: false,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SliverToBoxAdapter(
                            child: SizedBox(
                              height: 2,
                            )),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('offers'.tr,
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.grey[600])),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AllItems()));
                                  },
                                  child: Text('all'.tr,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.red)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //=============================================================================
                        token != null
                            ? SliverToBoxAdapter(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text('all Fast Free',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.grey[600]))),
                          ),
                        )
                            : SliverToBoxAdapter(
                            child: SizedBox(
                              height: 2,
                            )),
                        token != null
                            ? SliverGrid(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    // return Container(color: Colors.red,height: 100,);
                                    return GestureDetector(
                                        onTap: () {
                                          Get.to(ProductDetails(snapshot
                                              .data
                                              .result
                                              .allFastFree[index]
                                              .offerId));
                                        },
                                        child: aallFastFree(
                                            size: size,
                                            offers: snapshot.data.result
                                                .allFastFree[index]));
                                  },
                                  childCount:
                                      snapshot.data.result.allFastFree.length,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: size.width * .5,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 0,
                                  //  childAspectRatio: 4.0,
                                  mainAxisExtent: 400,
                                ),
                                //  gridDelegate:
                                //   SliverGridDelegate (
                                //     crossAxisCount: 2,
                                //     mainAxisSpacing: 5,
                                //     crossAxisSpacing: 5,
                                // //    childAspectRatio:(itemWidth / itemHeight),
                                //   ),
                              )
                            : SliverToBoxAdapter(child: SizedBox(height: 2)),
                        //=============================================================================

                        // SliverToBoxAdapter(
                        //   child: Container(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Container(
                        //       width: 150,
                        //       decoration: BoxDecoration(
                        //       color: Colors.blue[800],
                        //       borderRadius: BorderRadius.circular(40.0)),
                        //       child: Center(
                        //     child: Text('offers'.tr,
                        //         style: TextStyle(
                        //             fontSize: 24, color: Colors.white)),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Get.to(ProductDetails(
                                        snapshot.data.result.allOffers[index]
                                            .offerId,
                                        product_name: snapshot.data.result
                                            .allOffers[index].offerName));
                                  },
                                  child: offersiteem(
                                      size: size,
                                      offers: snapshot.data.result.allOffers[index]));
                            },
                            childCount: snapshot.data.result.allOffers.length,
                          ),
                          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          //   maxCrossAxisExtent: 200.0,
                          //   mainAxisSpacing: 10.0,
                          //   crossAxisSpacing: 10.0,
                          //   childAspectRatio: 4.0,
                          // ),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: size.width * .6,
                            // mainAxisSpacing: ,
                            // crossAxisSpacing: ,
                            //  childAspectRatio: 4.0,
                            mainAxisExtent: 400,
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: SizedBox(
                              height: 2,
                            )),
                        SliverFixedExtentList(
                          itemExtent: size.height * .2,
                          delegate: SliverChildListDelegate([
                            ClipRRect (
                              borderRadius: BorderRadius.circular(20),
                              child: CarouselSlider(
                                items: Banners2,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  disableCenter: true,
                                  viewportFraction: .8,
                                  aspectRatio: 1,
                                  height: size.height * .35,
                                  //  enlargeCenterPage: true,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.all(8.0),
                            child: Text('bestproducts'.tr,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey[600])),
                          ),
                        ),
                        SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Get.to(ProductDetails(snapshot.data.result
                                        .allBestProducts[index].productId));
                                  },
                                  child: Productsiteem(
                                      offers: snapshot
                                          .data.result.allBestProducts[index],
                                      size: size));
                            },
                            childCount:
                                snapshot.data.result.allBestProducts.length,
                          ),
                          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          //   maxCrossAxisExtent: 200.0,
                          //   mainAxisSpacing: 10.0,
                          //   crossAxisSpacing: 10.0,
                          //   childAspectRatio: 4.0,
                          // ),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: size.width * .5,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            //  childAspectRatio: 4.0,
                            mainAxisExtent: 430,
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: SizedBox(
                          height: 10,
                        )),
                        SliverToBoxAdapter(
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.all(8.0),
                            child: Text('partners'.tr,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey[600])),
                          ),
                        ),

                        //botome partiner lissst

                        SliverFixedExtentList(
                          itemExtent: size.height * .2,
                          delegate: SliverChildListDelegate([
                            Container(
                              child: CarouselSlider(
                                items: itemSliders3,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  viewportFraction: .33,
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Container(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator()),
              );
            }
          });
    } else if (i == 1) {
      return token == null
          ? Container(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(LoginSCR());
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    child: Center(
                      child: Text('savep'.tr,
                          style: TextStyle(
                              fontFamily: 'Arbf',
                              color: Colors.white,
                              fontSize: 23)),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius: BorderRadius.circular(40.0)),
                  ),
                ),
              ),
            )
          : Shopping_Cart();
    } else {
      return token == null
          ? Container(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(LoginSCR());
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    child: Center(
                      child: Text('savep'.tr,
                          style: TextStyle(
                              fontFamily: 'Arbf',
                              color: Colors.white,
                              fontSize: 23)),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius: BorderRadius.circular(40.0)),
                  ),
                ),
              ),
            )
          : ProfileScr();
    }
  }

  Widget aallFastFree({AllFastFree offers, size}) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Share.share(
                        offers.shareLink,
                      );
                    },
                    child: Container(
                      color: Colors.blue,
                      child: Icon(
                        Icons.share,
                        color: Colors.red,
                      ),
                    )),
                GestureDetector(
                  onTap: () {
                    print(token);
                    token == null
                        ? Get.to(LoginSCR())
                        : _allNetworking
                            .update_myfavorite(
                                id_product: int.parse(offers.offerId),
                                id_key: offers.favExit == 0 ? 1 : 2,
                                token_id: token)
                            .then((value) {
                            setState(() {});
                            Get.snackbar('', value.message);
                          });
                  },
                  child: Container(
                    color: Colors.blue,
                    child: Icon(
                      offers.favExit == 0
                          ? Icons.favorite_border
                          : Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //         height: 50,
            //         width: 75,
            //         child: Image.asset(
            //           'assets/images/offer.png',
            //           // color: Colors.blue[800],
            //         )),
            //     // Container(
            //     //     child: Padding(
            //     //       padding: const EdgeInsets.all(8.0),
            //     //       child:Text(
            //     //         "%" + offers.discountPercentage,
            //     //         style: TextStyle(color: Colors.red),
            //     //       ),
            //     //     )),
            //   ],
            // ),
            Image.network(
              offers.imageCateg,
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar(
                    // onRatingChanged: (rating) {
                    //   _rating = rating;
                    //   print(snapshot
                    //       .data.result.productsDetails[0].id);
                    //   _allNetworking
                    //       .add_review(
                    //       product_id: snapshot.data.result
                    //           .productsDetails[0].id,
                    //       rating: rating.toInt(),
                    //       token_id: token,
                    //       lang: 'ar')
                    //       .then((value) {
                    //     Get.snackbar('', value.message);
                    //     setState(() {});
                    //   });
                    // },
                    filledIcon: Icons.star,
                    initialRating: offers.totalRate.trim().isEmpty
                        ? 0.0
                        : double.tryParse(offers.totalRate),
                    emptyIcon: Icons.star_border,
                    halfFilledIcon: Icons.star_half,
                    isHalfAllowed: true,
                    filledColor: Colors.green,
                    emptyColor: Colors.redAccent,
                    halfFilledColor: Colors.amberAccent,
                    size: 20,
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () async {
                      final link = WhatsAppUnilink(
                        phoneNumber: offers.whatsapp,
                        text: 'طلب منتج ${offers.offerName} ' +
                            'بسعر ${offers.newPrice} ',
                      );
                      // Convert the WhatsAppUnilink instance to a string.
                      // Use either Dart's string interpolation or the toString() method.
                      // The "launch" method is part of "url_launcher".
                      await launch('$link');
                    },
                    child: Container(
                        height: 35,
                        width: 35,
                        child: Image.asset(
                          'assets/images/what.png',
                          // color: Colors.blue[800],
                        )),
                  ),
                ),
              ],
            ),
            Container(
                width: size.width * .4,
                child: Text(
                  offers.offerName,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    child:
                    Text("${offers.newPrice} ${offers.currencyName ?? " "}")),
                Container(
                    child: Stack(
                  children: [
                    Positioned(
                      top: 12,
                      child: Container(
                        height: 2,
                        width: size.width * .1,
                        color: Colors.grey,
                      ),
                    ),
                    Text("${offers.oldPrice} ${offers.currencyName}",
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                ))
              ],
            ),
            GestureDetector(
              onTap: () {
                if (token == null) {
                  Get.to(LoginSCR());
                } else {
                  if (offers.exitCart == 0) {
                    _allNetworking
                        .add_new_product(
                            id_product: int.parse(offers.offerId),
                            id_key: 1,
                            token_id: token, count: '1')
                        .then((value) {
                      print(value.message);
                      setState(() {});
                      Get.snackbar('', value.message);
                    });
                  } else {
                    Get.to(Shopping_Cart());
                  }
                }
              },
              child: Container(
                width: size.width * .4,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              'assets/images/addbasket.png',
                              color: Colors.white,
                            )),
                        Text(offers.exitCart == 0 ? 'addpro'.tr : 'delpro'.tr,
                            style: TextStyle(
                              fontFamily: 'Arbf',
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(40.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
//العروض
  Widget offersiteem({AllOffers offers, size}) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Share.share(
                            offers.sharelink,
                          );
                        },
                        child: Icon(
                          Icons.share,
                          color: Colors.red,
                        )),

                    GestureDetector(
                      onTap: () {
                        token == null
                            ? Get.to(LoginSCR())
                            : _allNetworking
                                .update_myfavorite(
                                    id_product: int.parse(offers.offerId),
                                    id_key: offers.favExit == 0 ? 1 : 2,
                                    token_id: token)
                                .then((value) {
                                setState(() {});
                                Get.snackbar('', value.message);
                              });
                      },
                      child: Icon(
                        offers.favExit == 0
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                   color:Colors.red ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "%" + offers.discountPercentage+ " - " ,
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
            Image.network(
              offers.imageCateg,
              fit: BoxFit.fill,
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 200,
              child: Text(
                offers.offerName,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.right,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar(
                    // onRatingChanged: (rating) {
                    //   _rating = rating;
                    //   print(snapshot
                    //       .data.result.productsDetails[0].id);
                    //   _allNetworking
                    //       .add_review(
                    //       product_id: snapshot.data.result
                    //           .productsDetails[0].id,
                    //       rating: rating.toInt(),
                    //       token_id: token,
                    //       lang: 'ar')
                    //       .then((value) {
                    //     Get.snackbar('', value.message);
                    //     setState(() {});
                    //   });
                    // },
                    filledIcon: Icons.star,
                    initialRating: offers.totalRate.trim().isEmpty
                        ? 0.0
                        : double.tryParse(offers.totalRate),
                    emptyIcon: Icons.star_border,
                    halfFilledIcon: Icons.star_half,
                    isHalfAllowed: true,
                    filledColor: Colors.green,
                    emptyColor: Colors.redAccent,
                    halfFilledColor: Colors.amberAccent,
                    size: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child:
                      // Text(offers.newPrice + " " + offers.currencyName ?? " "),
                      Text("${offers.newPrice} ${offers.currencyName==null?"":offers.currencyName}"),
                )),
                Text("/"),
                Container(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 12,
                          child: Container(
                            height: 2,
                            width: 80,
                            color: Colors.grey,
                          ),
                        ),
                        // Text(
                        //   offers.oldPrice + " " + offers.currencyName ?? " ",
                        //   style: TextStyle(fontSize: 18, color: Colors.grey),
                        // ),
                        Text(
                          "${offers.oldPrice} ${offers.currencyName ?? " "}",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    )),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (token == null) {
                      Get.to(LoginSCR());
                    } else {
                      if (offers.exitCart == 0) {
                        _allNetworking
                            .add_new_product(
                                id_product: int.parse(offers.offerId),
                                id_key: 1,
                                token_id: token, count: '1')
                            .then((value) {
                          print(value.message);
                          setState(() {});
                          Get.snackbar('', value.message);
                        });
                      } else {
                        Get.to(Shopping_Cart());
                      }
                    }
                  },
                  child: Container(
                    width:  MediaQuery.of(context).size.width* .35,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 30,
                              width:      MediaQuery.of(context).size.width* .061,
                              child: Image.asset(
                                'assets/images/addbasket.png',
                                color: Colors.blue[600],
                              )),
                          Text(offers.exitCart == 0 ? 'addpro'.tr : 'delpro'.tr,
                              style: TextStyle(
                                fontFamily: 'Arbf',
                                color: Colors.blue[600],
                              )),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),
                            // topRight:Radius.circular(20)
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final link = WhatsAppUnilink(
                      phoneNumber: offers.whatsapp,
                      text: 'طلب منتج ${offers.offerName} ' +
                          'بسعر ${offers.newPrice} ',
                    );
                    // Convert the WhatsAppUnilink instance to a string.
                    // Use either Dart's string interpolation or the toString() method.
                    // The "launch" method is part of "url_launcher".
                    await launch('$link');
                  },
                  child: Container(
                      height: 45,
                      width:      MediaQuery.of(context).size.width* .08,
                      decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.only(
                          // topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),

                      child: Image.asset(
                        'assets/images/what2.png',
                        // color: Colors.blue[800],
                      )
                    ),
                ),
              ],
            ),




            // GestureDetector(
            //   onTap: () async {
            //     final link = WhatsAppUnilink(
            //       phoneNumber: offers.whatsapp,
            //       text: 'طلب منتج ${offers.offerName} ' +
            //           'بسعر ${offers.newPrice} ',
            //     );
            //     // Convert the WhatsAppUnilink instance to a string.
            //     // Use either Dart's string interpolation or the toString() method.
            //     // The "launch" method is part of "url_launcher".
            //     await launch('$link');
            //   },
            //   child: Container(
            //       height: 35,
            //       width: 35,
            //       child: Image.asset(
            //         'assets/images/what.png',
            //         // color: Colors.blue[800],
            //       )),
            // ),
          ],
        ),
      ),
    );
  }

//افضل المنتجات
  Widget Productsiteem({AllBestProducts offers, size}) {

    return Card(
      elevation: 8,
      child: Container(
        height: 420,
        width: size.width * .7,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Share.share(
                          offers.shareLink,
                        );
                      },
                      child: Icon(
                        Icons.share,
                        color: Colors.red,
                      )),
                  //'FREEDELIVERY'.tr
                  GestureDetector(
                    onTap: () {
                      print('000000000000000000000000000000');
                      print(offers.productId);
                      print(token);
                      print('000000000000000000000000000000');
                      token == null
                          ? Get.to(LoginSCR())
                          : _allNetworking
                              .update_myfavorite(
                                  id_product: int.parse(offers.productId),
                                  id_key: offers.favExit == 0 ? 1 : 2,
                                  token_id: token)
                              .then((value) {
                              print(value.message);
                              setState(() {});
                              Get.snackbar('', value.message);
                            });
                    },
                    child: Icon(
                      offers.favExit == 0
                          ? Icons.favorite_border
                          : Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Container(
                child: Image.network(
                  offers.imageCateg, height: 200,
                  width: 200,
                  //fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: RatingBar(
                        // onRatingChanged: (rating) {
                        //   _rating = rating;
                        //   print(snapshot
                        //       .data.result.productsDetails[0].id);
                        //   _allNetworking
                        //       .add_review(
                        //       product_id: snapshot.data.result
                        //           .productsDetails[0].id,
                        //       rating: rating.toInt(),
                        //       token_id: token,
                        //       lang: 'ar')
                        //       .then((value) {
                        //     Get.snackbar('', value.message);
                        //     setState(() {});
                        //   });
                        // },
                        filledIcon: Icons.star,
                        initialRating: offers.totalRate == null
                            ? 0.0
                            : offers.totalRate.trim().isEmpty
                                ? 0.0
                                : double.tryParse(offers.totalRate),
                        emptyIcon: Icons.star_border,
                        halfFilledIcon: Icons.star_half,
                        isHalfAllowed: true,
                        filledColor: Colors.green,
                        emptyColor: Colors.redAccent,
                        halfFilledColor: Colors.amberAccent,
                        size: 20,
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () async {
                  //     final link = WhatsAppUnilink(
                  //       phoneNumber: offers.whatsapp,
                  //       text: 'طلب منتج ${offers.productName} ' +
                  //           'بسعر ${offers.newPrice} ',
                  //     );
                  //     // Convert the WhatsAppUnilink instance to a string.
                  //     // Use either Dart's string interpolation or the toString() method.
                  //     // The "launch" method is part of "url_launcher".
                  //     await launch('$link');
                  //   },
                  //   child: Container(
                  //       height: 35,
                  //       width: 35,
                  //       child: Image.asset(
                  //         'assets/images/what.png',
                  //         // color: Colors.blue[800],
                  //       )),
                  // ),
                ],
              ),
              Container(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      offers.productName,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      softWrap: true,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(offers.newPrice + " " + offers.currencyName ?? " "),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (token == null) {
                        Get.to(LoginSCR());
                      } else {
                        if (offers.exitCart == 0) {
                          _allNetworking
                              .add_new_product(
                                  id_product: int.parse(offers.productId),
                                  id_key: 1,
                                  token_id: token, count: '1')
                              .then((value) {
                            setState(() {});
                            Get.snackbar('', value.message);
                          });
                        } else {
                          Get.to(Shopping_Cart());
                        }
                      }
                    },
                    child: Container(
                      width:  MediaQuery.of(context).size.width* .35,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                    'assets/images/addbasket.png',
                                    color: Colors.blue[600],
                                  )),
                              Text(offers.exitCart == 0 ? 'addpro'.tr : 'delpro'.tr,
                                  style: TextStyle(
                                    fontFamily: 'Arbf',
                                    color: Colors.blue[600],
                                  )),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),
                            // topRight:Radius.circular(20)
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final link = WhatsAppUnilink(
                        phoneNumber: offers.whatsapp,
                        text: 'طلب منتج ${offers.productName} ' +
                            'بسعر ${offers.newPrice} ',
                      );
                      // Convert the WhatsAppUnilink instance to a string.
                      // Use either Dart's string interpolation or the toString() method.
                      // The "launch" method is part of "url_launcher".
                      await launch('$link');
                    },
                    child: Container(
                        height: 45,
                        width:      MediaQuery.of(context).size.width* .08,
                        decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.only(
                          // topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),

                        child: Image.asset(
                          'assets/images/what2.png',
                          // color: Colors.blue[800],
                        )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
