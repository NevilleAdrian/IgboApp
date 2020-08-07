import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/screens/categories_screen.dart';


class HomeScreen extends StatefulWidget {

  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {


  Widget build(BuildContext context) {
    super.build(context);
    var lessons = [
      {
        "id": "1",
        "name": "Mkpuru Osisi",
        "type": "Fruits",
        "color": 0XFF47C1ED,
        "form": "Beginner",
        "status": "paid",
        "time": "9 minutes"
      },
      {
        "id": "2",
        "name": "Aha Umuanumanu",
        "type": "Names of Animal",
        "color": 0XFFAA91C2,
        "form": "Beginner",
        "status": "not paid",
        "time": "4 minutes"
      },
      {
        "id": "1",
        "name": "Anu Osisi",
        "type": "Food",
        "color": 0XFF2F78CA,
        "form": "intermediate",
        "status": "paid",
        "time": "9 minutes"
      },
      {
        "id": "2",
        "name": "Aha Umuanumanu",
        "type": "Names of  Utensils",
        "color": 0XFFAD13631,
        "form": "intermediate",
        "status": "not paid",
        "time": "7 minutes"
      },
      {
        "id": "1",
        "name": "Mkpuru Osisi",
        "type": "Fruits",
        "color": 0XFF2D0C06,
        "form": "advanced",
        "status": "paid",
        "time": "6 minutes"
      },
      {
        "id": "2",
        "name": "Aha Umuanumanu",
        "type": "Names of Institutions",
        "color": 0XFFF7B500,
        "form": "advanced",
        "status": "not paid",
        "time": "7 minutes"
      },

    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text( 'Categories', style: TextStyle( fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600,  fontFamily: 'Poppins'),),
        centerTitle: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset("assets/images/search.svg",
                color: Colors.black
            ),
          ),
        ],
        
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(color: Colors.grey , height: 0.3),
                  SizedBox(
                    height: 15.0,
                  ),
                 CategoryList(lessons: lessons)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
    @required this.lessons,
  }) : super(key: key);

  final List<Map<String, Object>> lessons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     physics: ScrollPhysics(),
     shrinkWrap: true,
     itemCount: lessons.length,
     itemBuilder: (BuildContext context, int index) {
       return GestureDetector(
         onTap: () {
           Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) => CategoriesScreen(
                   lessons: lessons,
                   type: lessons[index]['type'],
                   form: lessons[index]['form'],
                   paid: lessons[index]['status']
                 )
             ),
           );
         },
         child: Card(
           color: Color(lessons[index]['color']) ,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(
                 bottomLeft: Radius.circular(5),
                 bottomRight: Radius.circular(5),
                 topLeft: Radius.circular(5),
                 topRight: Radius.circular(5)

             ),
           ),
           child: Padding(
             padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text('${lessons[index]['name']}', style: TextStyle(color: Colors.white, fontSize: 12),),
                 SizedBox(height: 5,),
                 Text('${lessons[index]['type']}', style: TextStyle( fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w500) ),
               ],
             ),
           ),
         ),
       );
     });
  }
}


