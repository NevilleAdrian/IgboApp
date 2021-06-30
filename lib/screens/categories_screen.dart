import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/models/pay_model.dart';
import 'package:nkuzi_igbo/models/sub_category.dart';
import 'package:nkuzi_igbo/models/user_model.dart';
import 'package:nkuzi_igbo/providers/auth_provider.dart';
import 'package:nkuzi_igbo/screens/continue_screen.dart';
import 'package:nkuzi_igbo/screens/home_page.dart';
import 'package:nkuzi_igbo/screens/payment/payment_page.dart';
import 'package:nkuzi_igbo/screens/settings.dart';
import 'package:nkuzi_igbo/ui_widgets/future_helper.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen(
      {this.lessons, this.description, this.id, this.title, this.thumbnail});
  final List<SubCategory> lessons;
  final String description;
  final String id;
  final String title;
  final String thumbnail;

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  void _modalBottomSheetMenu() {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (BuildContext bc) {
          return Wrap(children: <Widget>[
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, right: 5.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 30.0,
                      )),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.85,
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0))),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              top: 30.0, left: 15.0, right: 15.0, bottom: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('Try 7 days for free',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(
                                        0XFF9D1000,
                                      ),
                                      fontSize: 21,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.check,
                                    color: Color(
                                      0XFF9D1000,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text('Offline Mode',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.check,
                                    color: Color(
                                      0XFF9D1000,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Smart Review',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.check,
                                    color: Color(
                                      0XFF9D1000,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text('Learn up to 12 topics',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.check,
                                    color: Color(
                                      0XFF9D1000,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text('Personalised Study Plan',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              SizedBox(
                                height: 60.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () =>
                                          _onPayTap(_isLocal ? 4000 : 10, '1'),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0XFFB5B5B5),
                                                width: 0.4),
                                            color: Colors.white),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey,
                                                      width: 0.4),
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30.0,
                                                  vertical: 15.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    '3',
                                                    style: TextStyle(
                                                        fontSize: 36.0),
                                                  ),
                                                  Text(
                                                    'Months',
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.0,
                                                  vertical: 5.0),
                                              child: Text(
                                                _isLocal
                                                    ? 'N4, 000.00/mo'
                                                    : '\$10/mo',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10.0),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: GestureDetector(
                                  //     onTap: () => _onPayTap(3000, '3'),
                                  //     child: Stack(
                                  //       overflow: Overflow.visible,
                                  //       alignment: Alignment.topCenter,
                                  //       children: <Widget>[
                                  //         Container(
                                  //           padding: EdgeInsets.only(top: 20.0),
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(5),
                                  //                 border: Border.all(
                                  //                     color: Color(0XFFF21600),
                                  //                     width: 0.7),
                                  //                 color: Colors.white),
                                  //             child: Column(
                                  //               children: <Widget>[
                                  //                 Container(
                                  //                   decoration: BoxDecoration(
                                  //                     border: Border(
                                  //                       bottom: BorderSide(
                                  //                           color: Color(
                                  //                               0XFFF21600),
                                  //                           width: 0.4),
                                  //                     ),
                                  //                   ),
                                  //                   padding:
                                  //                       EdgeInsets.symmetric(
                                  //                           horizontal: 30.0,
                                  //                           vertical: 15.0),
                                  //                   child: Column(
                                  //                     children: <Widget>[
                                  //                       Text(
                                  //                         '1',
                                  //                         style: TextStyle(
                                  //                             fontSize: 36.0),
                                  //                       ),
                                  //                       Text(
                                  //                         'Year',
                                  //                         style: TextStyle(
                                  //                             fontSize: 10.0,
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w700),
                                  //                       ),
                                  //                       SizedBox(
                                  //                         height: 5.0,
                                  //                       ),
                                  //                       Text(
                                  //                         'N15,000',
                                  //                         style: TextStyle(
                                  //                           fontSize: 12.0,
                                  //                           decoration:
                                  //                               TextDecoration
                                  //                                   .lineThrough,
                                  //                         ),
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //                 Container(
                                  //                   padding:
                                  //                       EdgeInsets.symmetric(
                                  //                           horizontal: 20.0,
                                  //                           vertical: 5.0),
                                  //                   child: Text(
                                  //                     'N3, 000.00/mo',
                                  //                     style: TextStyle(
                                  //                         color: Colors.grey,
                                  //                         fontSize: 10.0),
                                  //                   ),
                                  //                 )
                                  //               ],
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Positioned(
                                  //             top: 10,
                                  //             child: SizedBox(
                                  //               height: 30.0,
                                  //               child: FlatButton(
                                  //                   color: Color(0XFFF21600),
                                  //                   padding:
                                  //                       EdgeInsets.symmetric(
                                  //                           horizontal: 5.0),
                                  //                   onPressed: () {},
                                  //                   child: Text(
                                  //                     'SAVE 20%',
                                  //                     style: TextStyle(
                                  //                       fontSize: 10.0,
                                  //                     ),
                                  //                   )),
                                  //             )),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () =>
                                          _onPayTap(_isLocal ? 3000 : 6, '2'),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0XFFB5B5B5),
                                                width: 0.4),
                                            color: Colors.white),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey,
                                                      width: 0.4),
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30.0,
                                                  vertical: 15.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    '6',
                                                    style: TextStyle(
                                                        fontSize: 36.0),
                                                  ),
                                                  Text(
                                                    'Months',
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.0,
                                                  vertical: 5.0),
                                              child: Text(
                                                _isLocal
                                                    ? 'N3, 000.00/mo'
                                                    : '\$6/mo',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10.0),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.stretch,
                              //   children: <Widget>[
                              //     SizedBox(
                              //       height: 40,
                              //     ),
                              //     FlatButton(
                              //         color: Color(0XFFF21600),
                              //         onPressed: () {},
                              //         child: Text('Continue')),
                              //     SizedBox(
                              //       height: 20,
                              //     ),
                              //     Text(
                              //       'Restore Purchase',
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //           color: Color(0XFFF21600),
                              //           fontSize: 13.0),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Text(
                                  'Get full access to all learning contents in Nkuzi Igbo when you subscribe now. '
                                  'Choosing from any of the options above give you uninterrupted access to the contents of this app. Enjoy learning.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 11),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ))
          ]);
        });
  }

  bool _loading = false;
  bool _isLocal;
  Future<bool> futureActiveState;
  Future<bool> currentTask() {
    //check user state
    return Future.value(true);
  }

  Future<bool> futureTask() async {
    //check user state
    Map<String, dynamic> activeState =
        await Auth.authProvider(context).checkUserActiveState();
    setState(() {
      _isLocal = activeState['isLocal'];
    });
    return Future.value(activeState['subscription_active']);
  }

  @override
  void initState() {
    futureActiveState = Auth.authProvider(context).user.activeSubscription
        ? currentTask()
        : futureTask();
    print('cat${widget.lessons}');
    super.initState();
  }

  _onPayTap(double amount, String subId) async {
    User user = Auth.authProvider(context).user;
    PayModel model = PayModel(
        name: user.name,
        phone: '08043567891',
        email: user.email,
        amount: amount,
        currency: _isLocal ? 'NGN' : 'USD',
        subId: subId);
    Navigator.of(context).pop();
    Navigator.of(context)
        .pushNamed(
      PaymentPage.id,
      arguments: model,
    )
        .then((value) async {
      setState(() {
        _loading = true;
      });
      await futureTask();
      setState(() {
        _loading = false;
      });
    }).catchError((err) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Row(
              children: <Widget>[
                SizedBox(child: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    '${widget.description}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Baloo',
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 20.0),
                  ),
                )
              ],
            )),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
              child: SvgPicture.asset("assets/images/settings.svg",
                  color: Colors.black),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: FutureHelper(
        task: futureActiveState,
        builder: (context, _) => _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (widget.lessons
                              .where((element) => element.form == 'Beginner')
                              .length >
                          0)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'Beginner',
                                style: TextStyle(
                                    color: Color(0XFFF21600),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              ListView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget.lessons.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return widget.lessons[index].form ==
                                            'Beginner'
                                        ? Column(
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  print(
                                                      'study: ${widget.lessons[index].study.length}');
                                                  widget.lessons[index].study
                                                              .length ==
                                                          0
                                                      ? SizedBox()
                                                      : Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => ContinueList(
                                                                  lessons: widget
                                                                      .lessons[
                                                                          index]
                                                                      .study,
                                                                  courses: widget
                                                                      .lessons,
                                                                  description:
                                                                      widget
                                                                          .description,
                                                                  form: widget
                                                                      .lessons[
                                                                          index]
                                                                      .form,
                                                                  name: widget
                                                                      .lessons[
                                                                          index]
                                                                      .name,
                                                                  time: widget
                                                                      .lessons[
                                                                          index]
                                                                      .time,
                                                                  category: widget
                                                                      .lessons[
                                                                          index]
                                                                      .category,
                                                                  thumbnail: widget
                                                                      .thumbnail,
                                                                  title: widget
                                                                      .title,
                                                                  id: widget
                                                                      .id)),
                                                        );
                                                  '';
                                                },
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                        color: Colors.grey,
                                                        height: 0.3),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    GestureDetector(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Row(
                                                            children: <Widget>[
                                                              CircleAvatar(
                                                                radius: 27,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                        widget
                                                                            .thumbnail),
                                                                child: Stack(
                                                                  overflow:
                                                                      Overflow
                                                                          .visible,
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  children: <
                                                                      Widget>[
                                                                    widget.lessons[index].premiumContent ==
                                                                            true
                                                                        ? Positioned(
                                                                            right:
                                                                                -2,
                                                                            top:
                                                                                9,
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              "assets/images/mark.svg",
                                                                            ))
                                                                        : SizedBox(
                                                                            height:
                                                                                0,
                                                                          ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 20.0,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    '${widget.lessons[index].type}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.6,
                                                                    height: 30,
                                                                    child:
                                                                        ListView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      shrinkWrap:
                                                                          true,
                                                                      children: <
                                                                          Widget>[
                                                                        Text(
                                                                            '${widget.lessons[index].name}',
                                                                            style: TextStyle(
                                                                                fontSize: 17.0,
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.w500)),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          widget.lessons[index]
                                                                      .premiumContent ==
                                                                  true
                                                              ? Container(
                                                                  child: SvgPicture
                                                                      .asset(
                                                                          "assets/images/padlock.svg"),
                                                                )
                                                              : SizedBox(
                                                                  height: 0,
                                                                )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Container(
                                                        color: Colors.grey,
                                                        height: 0.3),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        : SizedBox(
                                            height: 0,
                                          );
                                  })
                            ],
                          ),
                        ),
                      if (widget.lessons
                              .where(
                                  (element) => element.form == 'Intermediate')
                              .length >
                          0)
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'Intermediate',
                                style: TextStyle(
                                    color: Color(0XFFF21600),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              ListView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget.lessons.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return widget.lessons[index].form ==
                                            'Intermediate'
                                        ? Column(
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  print(
                                                      'study: ${widget.lessons[index].study.length}');
                                                  widget.lessons[index].study
                                                              .length ==
                                                          0
                                                      ? SizedBox()
                                                      : !Auth.authProvider(
                                                                  context)
                                                              .user
                                                              .activeSubscription
                                                          ? _modalBottomSheetMenu()
                                                          : Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => ContinueList(
                                                                      lessons: widget
                                                                          .lessons[
                                                                              index]
                                                                          .study,
                                                                      courses:
                                                                          widget
                                                                              .lessons,
                                                                      description:
                                                                          widget
                                                                              .description,
                                                                      form: widget
                                                                          .lessons[
                                                                              index]
                                                                          .form,
                                                                      name: widget
                                                                          .lessons[
                                                                              index]
                                                                          .name,
                                                                      time: widget
                                                                          .lessons[
                                                                              index]
                                                                          .time,
                                                                      category: widget
                                                                          .lessons[
                                                                              index]
                                                                          .category,
                                                                      title: widget
                                                                          .title,
                                                                      thumbnail:
                                                                          widget
                                                                              .thumbnail,
                                                                      id: widget
                                                                          .id)),
                                                            );
                                                  '';
                                                },
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                        color: Colors.grey,
                                                        height: 0.3),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    GestureDetector(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Row(
                                                            children: <Widget>[
                                                              CircleAvatar(
                                                                radius: 27,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                        widget
                                                                            .thumbnail),
                                                                child: Stack(
                                                                  overflow:
                                                                      Overflow
                                                                          .visible,
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  children: <
                                                                      Widget>[
                                                                    !Auth.authProvider(context)
                                                                            .user
                                                                            .activeSubscription
                                                                        ? Positioned(
                                                                            right:
                                                                                -2,
                                                                            top:
                                                                                9,
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              "assets/images/mark.svg",
                                                                            ))
                                                                        : SizedBox(
                                                                            height:
                                                                                0,
                                                                          ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 20.0,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    '${widget.lessons[index].type}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.6,
                                                                    height: 30,
                                                                    child:
                                                                        ListView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      shrinkWrap:
                                                                          true,
                                                                      children: <
                                                                          Widget>[
                                                                        Text(
                                                                            '${widget.lessons[index].name}',
                                                                            style: TextStyle(
                                                                                fontSize: 17.0,
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.w500)),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          !Auth.authProvider(
                                                                      context)
                                                                  .user
                                                                  .activeSubscription
                                                              ? Container(
                                                                  child: SvgPicture
                                                                      .asset(
                                                                          "assets/images/padlock.svg"),
                                                                )
                                                              : SizedBox(
                                                                  height: 0,
                                                                )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Container(
                                                        color: Colors.grey,
                                                        height: 0.3),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        : SizedBox(
                                            height: 0,
                                          );
                                  })
                            ],
                          ),
                        ),
                      if (widget.lessons
                              .where((element) => element.form == 'Advanced')
                              .length >
                          0)
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'Advanced',
                                style: TextStyle(
                                    color: Color(0XFFF21600),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              ListView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget.lessons.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return widget.lessons[index].form ==
                                            'Advanced'
                                        ? Column(
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  print(
                                                      'study: ${widget.lessons[index].study.length}');
                                                  widget.lessons[index].study
                                                              .length ==
                                                          0
                                                      ? SizedBox()
                                                      : !Auth.authProvider(
                                                                  context)
                                                              .user
                                                              .activeSubscription
                                                          ? _modalBottomSheetMenu()
                                                          : Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => ContinueList(
                                                                      lessons: widget
                                                                          .lessons[
                                                                              index]
                                                                          .study,
                                                                      courses:
                                                                          widget
                                                                              .lessons,
                                                                      description:
                                                                          widget
                                                                              .description,
                                                                      form: widget
                                                                          .lessons[
                                                                              index]
                                                                          .form,
                                                                      name: widget
                                                                          .lessons[
                                                                              index]
                                                                          .name,
                                                                      time: widget
                                                                          .lessons[
                                                                              index]
                                                                          .time,
                                                                      category: widget
                                                                          .lessons[
                                                                              index]
                                                                          .category,
                                                                      title: widget
                                                                          .title,
                                                                      thumbnail:
                                                                          widget
                                                                              .thumbnail,
                                                                      id: widget
                                                                          .id)),
                                                            );
                                                  '';
                                                },
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                        color: Colors.grey,
                                                        height: 0.3),
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    GestureDetector(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Row(
                                                            children: <Widget>[
                                                              CircleAvatar(
                                                                radius: 27,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                        widget
                                                                            .thumbnail),
                                                                child: Stack(
                                                                  overflow:
                                                                      Overflow
                                                                          .visible,
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  children: <
                                                                      Widget>[
                                                                    !Auth.authProvider(context)
                                                                            .user
                                                                            .activeSubscription
                                                                        ? Positioned(
                                                                            right:
                                                                                -2,
                                                                            top:
                                                                                9,
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              "assets/images/mark.svg",
                                                                            ))
                                                                        : SizedBox(
                                                                            height:
                                                                                0,
                                                                          ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 20.0,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    '${widget.lessons[index].type}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.6,
                                                                    height: 30,
                                                                    child:
                                                                        ListView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      shrinkWrap:
                                                                          true,
                                                                      children: <
                                                                          Widget>[
                                                                        Text(
                                                                            '${widget.lessons[index].name}',
                                                                            style: TextStyle(
                                                                                fontSize: 17.0,
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.w500)),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          !Auth.authProvider(
                                                                      context)
                                                                  .user
                                                                  .activeSubscription
                                                              ? Container(
                                                                  child: SvgPicture
                                                                      .asset(
                                                                          "assets/images/padlock.svg"),
                                                                )
                                                              : SizedBox(
                                                                  height: 0,
                                                                )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Container(
                                                        color: Colors.grey,
                                                        height: 0.3),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        : SizedBox(
                                            height: 0,
                                          );
                                  })
                            ],
                          ),
                        )
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
