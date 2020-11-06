import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/models/category_model.dart';
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
  List<Category> lesson;
  ScrollController _controller;
  List filteredCategory = [];
  bool showNav = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    lesson = Provider.of<Auth>(context, listen: false).category;
    filteredCategory = Provider.of<Auth>(context, listen: false).category;
    print('filter:$filteredCategory');
    print('mylesson: ${lesson[0].color}');
    print('image: ${lesson[0].image}');

    _nameController.addListener(onSearch);

    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        print('offset : ${_controller.offset}');
        print('max : ${_controller.position.maxScrollExtent}');

        print("reach the bottom");
        showNav = true;
      });
    }
    if (_controller.offset != 0.0 && !_controller.position.outOfRange) {
      setState(() {
        print("updating");
        showNav = true;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        print('offset : ${_controller.offset}');
        print('max : ${_controller.position.maxScrollExtent}');
        print("reach the top");
        showNav = false;
      });
    }
  }

  onSearch() {
    print('text is ${_nameController.text}');
    setState(() {
      searchText = _nameController.text;
      filteredCategory = onFilter(_nameController.text);
    });
  }

  List onFilter(String term) {
    return lesson
        .where((element) =>
            element.name.toLowerCase().contains(term.toLowerCase()) ||
            element.description.toLowerCase().contains(term.toLowerCase()))
        .toList();
  }

  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Scaffold(
        appBar: showNav
            ? AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                      radius: 30.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image(
                            image: NetworkImage(
                          "https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&w=1000&q=80",
                        )),
                      )),
                ),
                title: Text(
                  'What will you like to learn today?',
                  style: TextStyle(fontSize: 14.0),
                ),
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
                                    borderRadius: BorderRadius.circular(
                                        20.0)), //this right here
                                child: Container(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              hintStyle: TextStyle(
                                                  color: Colors.black),
                                              suffixIcon: GestureDetector(
                                                  onTap: () =>
                                                      Navigator.pop(context),
                                                  child: Icon(
                                                    Icons.search,
                                                    color: Colors.black,
                                                  ))),
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.black),
                                          controller: _nameController,
                                        )
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
              )
            : AppBar(
                backgroundColor: Colors.white,
                title: CircleAvatar(
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
                                    borderRadius: BorderRadius.circular(
                                        20.0)), //this right here
                                child: Container(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              hintStyle: TextStyle(
                                                  color: Colors.black),
                                              suffixIcon: GestureDetector(
                                                  onTap: () =>
                                                      Navigator.pop(context),
                                                  child: Icon(
                                                    Icons.search,
                                                    color: Colors.black,
                                                  ))),
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.black),
                                          controller: _nameController,
                                        )
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
        body: Padding(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                showNav == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hello ${(toBeginningOfSentenceCase(Auth.authProvider(context).user.name))}',
                            textAlign: TextAlign.left,
                            style: kAuthTextBig.copyWith(
                                fontFamily: 'Baloo',
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                fontSize: 22.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'What will you like to learn today',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Container(color: Colors.grey, height: 0.3),
                          SizedBox(
                            height: 25.0,
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 0,
                      ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      controller: _controller,
                      children: <Widget>[
                        CategoryList(lessons: filteredCategory)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
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

  final List<Category> lessons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return lessons[index].name != 'Verbs'
              ? SizedBox(
                  height: 15,
                )
              : SizedBox(
                  height: 0,
                );
        },
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          print(int.tryParse(lessons[index].color));
          return GestureDetector(
              onTap: () {
                // if (lessons[index]['isAvaliable'])
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoriesScreen(
                            lessons: lessons[index].subCategories,
                            description: lessons[index].description,
                            id: lessons[index].sId,
                            thumbnail: lessons[index].thumbnail,
                            title: lessons[index].name,
                          )),
                );
              },
              child: lessons[index].name != 'Verbs'
                  ? CachedNetworkImage(
                      imageUrl: lessons[index].image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 145.0),
                                      child: Text(
                                        '${lessons[index].name}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // if (!lessons[index]['isAvaliable'])
                              //   Expanded(
                              //       child: Column(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     crossAxisAlignment: CrossAxisAlignment.end,
                              //     children: <Widget>[
                              //       Container(
                              //         margin: EdgeInsets.only(top: 20.0),
                              //         padding: EdgeInsets.symmetric(
                              //             horizontal: 8, vertical: 4),
                              //         child: Text(
                              //           'Coming soon',
                              //           style: TextStyle(
                              //               color: Colors.white, fontSize: 10.0),
                              //         ),
                              //         decoration: BoxDecoration(
                              //           color: Color(0XFFF31601),
                              //           borderRadius: BorderRadius.only(
                              //               bottomLeft: Radius.circular(5),
                              //               bottomRight: Radius.circular(5),
                              //               topLeft: Radius.circular(5),
                              //               topRight: Radius.circular(5)),
                              //         ),
                              //       )
                              //     ],
                              //   )),
                            ],
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          //Image.asset('assets/images/shimmer.gif'),
                          Container(
                        decoration: BoxDecoration(
                          color: Color(int.tryParse(lessons[index]?.color) ??
                              0xFFCCCCCC),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 145.0),
                                      child: Text(
                                        '${lessons[index].name}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // if (!lessons[index]['isAvaliable'])
                              //   Expanded(
                              //       child: Column(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     crossAxisAlignment: CrossAxisAlignment.end,
                              //     children: <Widget>[
                              //       Container(
                              //         margin: EdgeInsets.only(top: 20.0),
                              //         padding: EdgeInsets.symmetric(
                              //             horizontal: 8, vertical: 4),
                              //         child: Text(
                              //           'Coming soon',
                              //           style: TextStyle(
                              //               color: Colors.white, fontSize: 10.0),
                              //         ),
                              //         decoration: BoxDecoration(
                              //           color: Color(0XFFF31601),
                              //           borderRadius: BorderRadius.only(
                              //               bottomLeft: Radius.circular(5),
                              //               bottomRight: Radius.circular(5),
                              //               topLeft: Radius.circular(5),
                              //               topRight: Radius.circular(5)),
                              //         ),
                              //       )
                              //     ],
                              //   )),
                            ],
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  // Container(
                  //         height: 126.0,
                  //         decoration: BoxDecoration(
                  //           image: DecorationImage(
                  //             // colorFilter: !lessons[index]['isAvaliable']
                  //             //     ?
                  //             // ColorFilter.mode(
                  //             //         Colors.grey,
                  //             //         BlendMode.saturation,
                  //             //       )
                  //             //     : null,
                  //             image: NetworkImage(lessons[index].image),
                  //             fit: BoxFit.cover,
                  //           ),
                  //           borderRadius: BorderRadius.only(
                  //               bottomLeft: Radius.circular(5),
                  //               bottomRight: Radius.circular(5),
                  //               topLeft: Radius.circular(5),
                  //               topRight: Radius.circular(5)),
                  //         ),
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: <Widget>[
                  //               Expanded(
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: <Widget>[
                  //                     Padding(
                  //                       padding:
                  //                           // lessons[index]['isAvaliable'] ?
                  //                           // const EdgeInsets.only(right: 120.0) :
                  //                           const EdgeInsets.only(right: 145.0),
                  //                       child: Text(
                  //                         '${lessons[index].name}',
                  //                         style: TextStyle(
                  //                             color: Colors.white,
                  //                             fontSize: 15,
                  //                             fontWeight: FontWeight.w700),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //               // if (!lessons[index]['isAvaliable'])
                  //               //   Expanded(
                  //               //       child: Column(
                  //               //     mainAxisAlignment: MainAxisAlignment.start,
                  //               //     crossAxisAlignment: CrossAxisAlignment.end,
                  //               //     children: <Widget>[
                  //               //       Container(
                  //               //         margin: EdgeInsets.only(top: 20.0),
                  //               //         padding: EdgeInsets.symmetric(
                  //               //             horizontal: 8, vertical: 4),
                  //               //         child: Text(
                  //               //           'Coming soon',
                  //               //           style: TextStyle(
                  //               //               color: Colors.white, fontSize: 10.0),
                  //               //         ),
                  //               //         decoration: BoxDecoration(
                  //               //           color: Color(0XFFF31601),
                  //               //           borderRadius: BorderRadius.only(
                  //               //               bottomLeft: Radius.circular(5),
                  //               //               bottomRight: Radius.circular(5),
                  //               //               topLeft: Radius.circular(5),
                  //               //               topRight: Radius.circular(5)),
                  //               //         ),
                  //               //       )
                  //               //     ],
                  //               //   )),
                  //             ],
                  //           ),
                  //         ),
                  //       )
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ));
        });
  }
}
