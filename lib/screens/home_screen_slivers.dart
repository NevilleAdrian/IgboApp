import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nkuzi_igbo/models/category_model.dart';
import 'package:nkuzi_igbo/providers/auth_provider.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

import 'categories_screen.dart';
import 'home_screen_custom_header.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _nameController = TextEditingController();
  String searchText;
  List<Category> categories;
  List<Category> filteredCategories = [];
  final String learnText = 'What will you like to learn today';

  onSearch() {
    print('text is ${_nameController.text}');
    setState(() {
      searchText = _nameController.text;
      filteredCategories = onFilter(_nameController.text);
    });
  }

  List onFilter(String term) {
    print('term is $term');
    return categories
        .where((element) =>
            element.name.toLowerCase().contains(term.toLowerCase()) ||
            element.description.toLowerCase().contains(term.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    categories = Auth.authProvider(context).category;
    filteredCategories = categories;
    _nameController.addListener(onSearch);
    super.initState();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
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
                      contentPadding:
                          EdgeInsets.only(top: 5, bottom: 5, left: 15),
                      //border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFF7F7FB), width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFF7F7FB), width: 0.5),
                      ),
                      hintText: 'Search with topic',
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 13.0, color: Colors.black),
                    controller: _nameController,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _sliverChildren() {
    return filteredCategories?.map((category) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CategoriesScreen(
                          lessons: category.subCategories,
                          description: category.description,
                          id: category.sId,
                          thumbnail: category.thumbnail,
                          title: category.name,
                        )),
              );
            },
            child: CachedNetworkImage(
              imageUrl: category.image,
              imageBuilder: (context, imageProvider) => CategoryBox(
                imageProvider: imageProvider,
                name: category.name,
                lastItem: filteredCategories.indexOf(category) ==
                    filteredCategories.length - 1,
              ),
              placeholder: (context, url) =>
                  //Image.asset('assets/images/shimmer.gif'),
                  CategoryBox(
                color: category.color,
                name: category.name,
                lastItem: filteredCategories.indexOf(category) ==
                    filteredCategories.length - 1,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        })?.toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: RefreshIndicator(
            backgroundColor: Colors.white,
            color: kAccent,
            onRefresh: () async {
              var data = await Auth.authProvider(context).refreshCategories();
              if (data != null) {
                setState(() {
                  categories = data;
                  filteredCategories = data;
                });
              }
            },
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  // floating: true,
                  delegate: HomeScreenPageHeader(
                    minExtent: 70,
                    maxExtent: 200,
                    onTap: _showDialog,
                    onStretchTrigger: () {},
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    _sliverChildren(),
                  ),
                ),
                //..._sliverChildren(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SliverTitle extends StatelessWidget {
  final Function onTap;

  const SliverTitle({@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&w=1000&q=80'),
        ),
        SearchButton(
          onTap: onTap,
        )
      ],
    );
  }
}

class CategoryBox extends StatelessWidget {
  final String color;
  final String name;
  final bool lastItem;
  final ImageProvider<Object> imageProvider;

  CategoryBox(
      {Key key, this.imageProvider, this.color, this.name, this.lastItem});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: lastItem ?? false ? null : EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: color != null ? Color(int.tryParse(color) ?? 0xFFCCCCCC) : null,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5)),
        image: imageProvider != null
            ? DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 145.0),
                    child: Text(
                      name ?? '',
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
    );
  }
}

class SearchButton extends StatelessWidget {
  final Function onTap;

  SearchButton({@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset("assets/images/search.svg", color: Colors.black),
    );
  }
}
