import 'package:flutter/material.dart';

import '../Service/colors.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final AppColors appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: appColors.darkGrey,
      /*appBar: AppBar(
        backgroundColor: appColors.darkGrey,
        shadowColor: Colors.transparent,
        title: Text('Search',
          style: TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationColor: appColors.blue1,
            decorationThickness: 2,
            shadows: [Shadow(color: appColors.white, offset: const Offset(0, -5))],
          ),),
      ),*/
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) {},
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, right: 5, left: 7, bottom: 7),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Search by Category',
                  style: TextStyle(
                      color: appColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            height: 160,
                            width: 160,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: appColors.blue2,
                            ),
                            child: Center(
                              child: Text(
                                'Item $index',
                                style: TextStyle(
                                  color: appColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                            child: Text('Name $index', style: TextStyle(color: appColors.white,fontWeight: FontWeight.w600),)
                        )
                      ],
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, right: 5, left: 7, bottom: 7),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Search by Collections',
                  style: TextStyle(
                      color: appColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            height: 150,
                            width: 230,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: appColors.blue2,
                            ),
                            child: Center(
                              child: Text(
                                'Item $index',
                                style: TextStyle(
                                  color: appColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Text('Name $index', style: TextStyle(color: appColors.white,fontWeight: FontWeight.w600),)
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
