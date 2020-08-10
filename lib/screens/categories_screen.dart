import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/screens/Settings.dart';
import 'package:nkuzi_igbo/screens/continue_screen.dart';

class CategoriesScreen extends StatefulWidget {

  CategoriesScreen({this.lessons, this.type, this.form, this.paid});
  final List<Map<String, Object>> lessons;
  final String type;
  final String form;
  final String paid;



  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {



  void _modalBottomSheetMenu(){
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0,right: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                            child: Icon(Icons.cancel, color: Colors.white, size: 30.0,)),
                      ),
                      Container(
                        height: 680,
                        width: MediaQuery.of(context).size.width,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0))),
                        child: Container(
                          padding: EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('Try 7 days for free', textAlign: TextAlign.left, style: TextStyle(color: Color(0XFF9D1000,), fontSize: 21, fontWeight: FontWeight.w600) ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.check, color: Color(0XFF9D1000,) ,),
                                  SizedBox(width: 10.0,),
                                  Text('Offline Mode', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.check, color: Color(0XFF9D1000,) ,),
                                  SizedBox(width: 10.0,),
                                  Text('Smart Review', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.check, color: Color(0XFF9D1000,) ,),
                                  SizedBox(width: 10.0,),
                                  Text('Learn up to 12 topics', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.check, color: Color(0XFF9D1000,) ,),
                                  SizedBox(width: 10.0,),
                                  Text('Personalised Study Plan', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
                                ],
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Color(0XFFB5B5B5), width: 0.4),
                                        color: Colors.white
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide( color: Colors.grey, width: 0.4 ),
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                                          child: Column(
                                            children: <Widget>[
                                              Text('1', style: TextStyle(fontSize: 36.0),),
                                              Text('Months', style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w700),),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                                          child: Text('N3,999.00/mo', style: TextStyle(color: Colors.grey, fontSize: 10.0),) ,
                                        )

                                      ],
                                    ),
                                  ),
                                  Stack(
                                    overflow: Overflow.visible,
                                    alignment: Alignment.topCenter,
                                    children: <Widget>[

                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Color(0XFFF21600), width: 0.7),
                                            color: Colors.white
                                        ),
                                        child: Column(
                                          children: <Widget>[

                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide( color: Color(0XFFF21600), width: 0.4 ),
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text('1', style: TextStyle(fontSize: 36.0),),
                                                  Text('Months', style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w700),),
                                                  SizedBox(height: 5.0,),
                                                  Text('23,000,00', style: TextStyle(fontSize: 12.0),),

                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                                              child: Text('N3,999.00/mo', style: TextStyle(color: Colors.grey, fontSize: 10.0),) ,
                                            )

                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          top: -15,
                                          child: SizedBox(
                                            height: 30.0,
                                            child: FlatButton(
                                                color: Color(0XFFF21600),
                                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                                onPressed: (){}, child: Text('SAVE 40%', style: TextStyle(fontSize: 10.0,),)
                                            ),
                                          )
                                      ),

                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Color(0XFFB5B5B5), width: 0.4),
                                        color: Colors.white
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide( color: Colors.grey, width: 0.4 ),
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                                          child: Column(
                                            children: <Widget>[
                                              Text('6', style: TextStyle(fontSize: 36.0),),
                                              Text('Months', style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w700),),
                                              SizedBox(height: 5.0,),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                                          child: Text('N3,159.00/mo', style: TextStyle(color: Colors.grey, fontSize: 10.0),) ,
                                        )

                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  SizedBox(height: 40,),
                                  FlatButton(
                                      color: Color(0XFFF21600),
                                      onPressed: () {

                                      },
                                      child: Text('Continue')
                                  ),
                                  SizedBox(height: 20,),
                                  Text('Restore Purchase', textAlign: TextAlign.center, style: TextStyle( color: Color(0XFFF21600),fontSize: 13.0),),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                child: Text('Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. '
                                    'Ut arcu libero, pulvinar non massa sed, accumsan scelerisque dui. Morbi purus mauris, vulputate quis felis nec, '
                                    ,
                                  textAlign: TextAlign.justify, style: TextStyle( color: Colors.grey, fontSize: 11),),
                              )

                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                )
              ]
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Settings(
                      )
                  ),
                );
              },
              child: SvgPicture.asset("assets/images/settings.svg",
                  color: Colors.black
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: ListView(
         children: <Widget>[
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Container(
                   padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                   child: Text('${widget.type}', style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w600), )),
                Container(
                   padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       SizedBox(height: 20.0,),
                       Text('Beginner', style: TextStyle(color: Color(0XFFF21600), fontSize: 20.0, fontWeight: FontWeight.w600),),
                       SizedBox(height: 20.0,),
                       ListView.builder(
                           physics: ScrollPhysics(),
                           shrinkWrap: true,
                           itemCount: widget.lessons.length,
                           itemBuilder: (BuildContext context, int index) {
                             return widget.lessons[index]['form'] == 'Beginner' ? Column(
                               children: <Widget>[
                                 GestureDetector(
                                   onTap: () {
                                     widget.lessons[index]['status'] == "not paid" ? _modalBottomSheetMenu():
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => ContinueList(
                                             lessons: widget.lessons[index]['questions'],
                                             id: widget.lessons[index]['id'],
                                             form : widget.lessons[index]['form'],
                                             type: widget.lessons[index]['type'],
                                             time: widget.lessons[index]['time'],
                                           )
                                       ),
                                     );
                                   },
                                   child: Column(
                                     children: <Widget>[
                                       Container(color: Colors.grey , height: 0.3),
                                       SizedBox(height: 15.0,),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: <Widget>[
                                           Row(
                                             children: <Widget>[
                                               CircleAvatar(
                                                 radius: 27,
                                                 backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&w=1000&q=80'),
                                                 child: Stack(
                                                   overflow: Overflow.visible,
                                                   alignment: Alignment.topRight,
                                                   children: <Widget>[
                                                     widget.lessons[index]['status'] == 'paid' ? Positioned(
                                                         right: -2,
                                                         top: 9,
                                                         child: SvgPicture.asset(
                                                           "assets/images/mark.svg",)
                                                     ) : SizedBox(height: 0,),
                                                   ],
                                                 ) ,
                                               ),
                                               SizedBox(
                                                 width: 20.0,
                                               ),
                                               Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: <Widget>[
                                                   Text('${widget.lessons[index]['name']}', style: TextStyle(color: Colors.black, fontSize: 12),),
                                                   SizedBox(height: 5,),
                                                   Text('${widget.lessons[index]['type']}', style: TextStyle( fontSize: 17.0, color: Colors.black, fontWeight: FontWeight.w500) ),
                                                 ],
                                               ),
                                             ],
                                           ),

                                           widget.lessons[index]['status'] == "not paid" ? Container(child:  SvgPicture.asset("assets/images/padlock.svg"),): SizedBox(height: 0,)

                                         ],
                                       ),
                                       SizedBox(height: 20.0,),
                                       Container(color: Colors.grey , height: 0.3),
                                     ],
                                   ),
                                 )
                               ],
                             ): SizedBox(height: 0,);
                           })
                     ],
                   ),
                 ),
                Container(
                   padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       SizedBox(height: 20.0,),
                       Text('Intermediate', style: TextStyle(color: Color(0XFFF21600), fontSize: 20.0, fontWeight: FontWeight.w600),),
                       SizedBox(height: 20.0,),
                       ListView.builder(
                           physics: ScrollPhysics(),
                           shrinkWrap: true,
                           itemCount: widget.lessons.length,
                           itemBuilder: (BuildContext context, int index) {
                             return  widget.lessons[index]['form'] == 'intermediate' ? Column(
                               children: <Widget>[
                                 GestureDetector(
                                   onTap: () {
                                     widget.lessons[index]['status'] == "paid" ?  Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => ContinueList(
                                             lessons: widget.lessons[index]['questions'],
                                             id: widget.lessons[index]['id'],
                                             form : widget.lessons[index]['form'],
                                             type: widget.lessons[index]['type'],
                                             time: widget.lessons[index]['time'],
                                           )
                                       ),
                                     ) : '';
                                   },
                                   child: Column(
                                     children: <Widget>[
                                       Container(color: Colors.grey , height: 0.3),
                                       SizedBox(height: 15.0,),
                                       GestureDetector(
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: <Widget>[
                                             Row(
                                               children: <Widget>[
                                                 CircleAvatar(
                                                   radius: 27,
                                                   backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&w=1000&q=80'),
                                                   child: Stack(
                                                     overflow: Overflow.visible,
                                                     alignment: Alignment.topRight,
                                                     children: <Widget>[
                                                       widget.lessons[index]['status'] == 'paid' ? Positioned(
                                                           right: -2,
                                                           top: 9,
                                                           child: SvgPicture.asset(
                                                             "assets/images/mark.svg",)
                                                       ) : SizedBox(height: 0,),
                                                     ],
                                                   ) ,
                                                 ),
                                                 SizedBox(
                                                   width: 20.0,
                                                 ),
                                                 Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: <Widget>[
                                                     Text('${widget.lessons[index]['name']}', style: TextStyle(color: Colors.black, fontSize: 12),),
                                                     SizedBox(height: 5,),
                                                     Text('${widget.lessons[index]['type']}', style: TextStyle( fontSize: 17.0, color: Colors.black, fontWeight: FontWeight.w500) ),
                                                   ],
                                                 ),
                                               ],
                                             ),

                                             widget.lessons[index]['status'] == 'not paid' ?  Container( child:  SvgPicture.asset("assets/images/padlock.svg"),): SizedBox(height: 0,)

                                           ],
                                         ),
                                       ),
                                       SizedBox(height: 20.0,),
                                       Container(color: Colors.grey , height: 0.3),
                                     ],
                                   ),
                                 )

                               ],
                             ) : SizedBox(height: 0,);

                           })
                     ],
                   ),
                 ),
                Container(
                   padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       SizedBox(height: 20.0,),
                       Text('Advanced', style: TextStyle(color: Color(0XFFF21600), fontSize: 20.0, fontWeight: FontWeight.w600),),
                       SizedBox(height: 20.0,),
                       ListView.builder(
                           physics: ScrollPhysics(),
                           shrinkWrap: true,
                           itemCount: widget.lessons.length,
                           itemBuilder: (BuildContext context, int index) {
                             return  widget.lessons[index]['form'] == 'advanced' ? Column(
                               children: <Widget>[
                                 GestureDetector(
                                   onTap: () {
                                     widget.lessons[index]['status'] == "paid" ?  Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => ContinueList(
                                             lessons: widget.lessons[index]['questions'],
                                             id: widget.lessons[index]['id'],
                                             form : widget.lessons[index]['form'],
                                             type: widget.lessons[index]['type'],
                                             time: widget.lessons[index]['time'],
                                           )
                                       ),
                                     ) : '';
                                   },
                                   child: Column(
                                     children: <Widget>[
                                       Container(color: Colors.grey , height: 0.3),
                                       SizedBox(height: 15.0,),
                                       GestureDetector(
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: <Widget>[
                                             Row(
                                               children: <Widget>[
                                                 CircleAvatar(
                                                   radius: 27,
                                                   backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&w=1000&q=80'),
                                                   child:  widget.lessons[index]['status'] == 'paid' ? Stack(
                                                     overflow: Overflow.visible,
                                                     alignment: Alignment.topRight,
                                                     children: <Widget>[
                                                       Positioned(
                                                           right: -2,
                                                           top: 9,
                                                           child: SvgPicture.asset(
                                                             "assets/images/mark.svg",)
                                                       )
                                                     ],
                                                   )  : SizedBox(height: 0,),
                                                 ),
                                                 SizedBox(
                                                   width: 20.0,
                                                 ),
                                                 Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: <Widget>[
                                                     Text('${widget.lessons[index]['name']}', style: TextStyle(color: Colors.black, fontSize: 12),),
                                                     SizedBox(height: 5,),
                                                     Text('${widget.lessons[index]['type']}', style: TextStyle( fontSize: 17.0, color: Colors.black, fontWeight: FontWeight.w500) ),
                                                   ],
                                                 ),
                                               ],
                                             ),

                                             Container( child:  widget.lessons[index]['status'] == 'not paid' ? SvgPicture.asset("assets/images/padlock.svg"): SizedBox(height: 0,))

                                           ],
                                         ),
                                       ),
                                       SizedBox(height: 20.0,),
                                       Container(color: Colors.grey , height: 0.3),
                                     ],
                                   ),
                                 )

                               ],
                             ) : SizedBox(height: 0,);

                           })




                     ],
                   ),
                 )
             ],
           )


         ],
      ),
    );
  }
}