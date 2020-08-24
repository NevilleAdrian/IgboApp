import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/providers/auth_provider.dart';
import 'package:nkuzi_igbo/screens/categories_screen.dart';
import 'package:nkuzi_igbo/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final _nameController = TextEditingController();
  String searchText;
  List<dynamic> lesson;
  List<Map<String, dynamic>> lessons = [
    {
      "id": "1",
      "name": "Mkpuru Osisi",
      "type": "Fruits",
      "color": 0XFF47C1ED,
      "form": "Beginner",
      "status": "paid",
      "time": "9 minutes",
      "questions": [
        {
          "id": "1",
          "mainquestion":
              "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac",
          "answerQuestion":
              "Pellentesque habitant morbi tristique senectus et netus",
          "questionImage": "assets/images/house.svg",
          "optionA": "Apple",
          "optionAImage": "assets/images/apple.svg",
          "optionB": "Egg",
          "optionBImage": "assets/images/egg.svg",
          "optionC": "Vegetable",
          "optionCImage": "assets/images/veg.svg",
          "optionD": "Meat",
          "optionDImage": "assets/images/meat.svg",
          "correctOption": "Egg",
          "audioUrl": 'Eli',
          "type": "toIgbo"
        },
        {
          "id": "2",
          "mainquestion": "Pellentesque habitant morbi tristique senectus",
          "answerQuestion":
              "Pellentesque habitant morbi tristique senectus et netus al tefiri",
          "questionImage": "assets/images/house.svg",
          "optionA": "Egg",
          "optionAImage": "assets/images/egg.svg",
          "optionB": "Apple",
          "optionBImage": "assets/images/apple.svg",
          "optionC": "Meat",
          "optionCImage": "assets/images/meat.svg",
          "optionD": "Vegetable",
          "optionDImage": "assets/images/veg.svg",
          "correctOption": "Egg",
          "audioUrl": 'Eli',
          "type": "toIgbo"
        },
        {
          "id": "3",
          "mainquestion":
              "Match the following english words with its correct Igbo words",
          "option1": "Ji",
          "option2": "Anu",
          "option3": "Agwa",
          "option4": "Azu",
          "correctOption": "Anu",
          "audioUrl": 'Eli',
          "type": "toEnglish"
        },
        {
          "id": "4",
          "mainquestion":
              "Match the following english words with its correct Igbo words",
          "option1": "Agwa",
          "option2": "Ji",
          "option3": "Azu",
          "option4": "Osikapa",
          "correctOption": "Osikapa",
          "audioUrl": 'Eli',
          "type": "toEnglish"
        },
        {
          "id": "5",
          "mainquestion": "Pellentesque habitant morbi tristique senectus",
          "answerQuestion":
              "Pellentesque habitant morbi tristique senectus et netus al tefiri",
          "questionImage": "assets/images/house.svg",
          "optionA": "Egg",
          "optionAImage": "assets/images/egg.svg",
          "optionB": "Apple",
          "optionBImage": "assets/images/apple.svg",
          "optionC": "Meat",
          "optionCImage": "assets/images/meat.svg",
          "optionD": "Vegetable",
          "optionDImage": "assets/images/veg.svg",
          "correctOption": "Egg",
          "audioUrl": 'Eli',
          "type": "toIgbo"
        },
      ]
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
      "type": "Names of Utensils",
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
    }
  ];
  List filteredCategory = [];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    lesson = Provider.of<Auth>(context, listen: false).category;
    filteredCategory = lesson;
    print('filter:$filteredCategory');
     print('mylesson: ${lesson[0]['color']}');
    super.initState();
  }

  onSearch(String term) {
    setState(() {
      searchText = term;
      filteredCategory = onFilter(term);
    });
  }

  List onFilter(String term) {
    return lesson.where((element) => element['name'].toLowerCase().contains(term.toLowerCase())
        || element['description'].toLowerCase().contains(term.toLowerCase()).toList());
  }

  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&w=1000&q=80'),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20.0)), //this right here
                          child: Container(
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.only(
                                              top: 5, bottom: 5, left: 15),
                                          //border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFFF7F7FB),
                                                width: 0.5),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFFF7F7FB),
                                                width: 0.5),
                                          ),
                                          hintText: 'Search with topic',
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          suffixIcon: GestureDetector(
                                              onTap: () => Navigator.pop(context),
                                              child: Icon(
                                                Icons.search,
                                                color: Colors.black,
                                              ))),
                                      style: TextStyle(
                                          fontSize: 13.0, color: Colors.black),
                                      controller: _nameController,
                                      onChanged: (value) {
                                        onSearch(value);
                                        print('search:$value');
                                      })
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: SvgPicture.asset("assets/images/search.svg",
                    color: Colors.black),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Hello ${(toBeginningOfSentenceCase(Auth.authProvider(context).user.name))}',
                      textAlign: TextAlign.left,
                      style: kAuthTextBig.copyWith(
                          fontFamily: 'Baloo', fontWeight: FontWeight.w900, color: Colors.black),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'What will you like to learn today',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(color: Colors.grey, height: 0.3),
                    SizedBox(
                      height: 25.0,
                    ),
                    CategoryList(lessons: filteredCategory)
                  ],
                ),
              ),
            )
          ],
        ),
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

  final List<dynamic> lessons;

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
                        lessons: lessons[index]['sub_categories'],
                        description:  lessons[index]['description'],
                        id: lessons[index]['_id']
                      )
                ),
              );
            },
            child: Card(
              color: Color(int.parse(lessons[index]['color'])),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${lessons[index]['name']}',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${lessons[index]['description']}',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
