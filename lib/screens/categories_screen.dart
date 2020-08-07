import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset("assets/images/settings.svg",
                color: Colors.black
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
                                     widget.lessons[index]['status'] == "paid" ?  Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => ContinueList(
                                             lessons: widget.lessons[index],
                                           )
                                       ),
                                     ) : '';
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
                                                 radius: 35,
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
                                                   Text('${widget.lessons[index]['type']}', style: TextStyle( fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w500) ),
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
                                             lessons: widget.lessons[index],
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
                                                   radius: 35,
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
                                                     Text('${widget.lessons[index]['type']}', style: TextStyle( fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w500) ),
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
                                             lessons: widget.lessons[index],
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
                                                   radius: 35,
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
                                                     Text('${widget.lessons[index]['type']}', style: TextStyle( fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w500) ),
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
