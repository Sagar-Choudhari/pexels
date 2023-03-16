import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pexels/Service/colors.dart';

import '../Model/post.dart';

class GlobalFeed extends StatefulWidget {
  const GlobalFeed({Key? key}) : super(key: key);

  @override
  State<GlobalFeed> createState() => _GlobalFeedState();
}

class _GlobalFeedState extends State<GlobalFeed> {
  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();

    return Center(
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  posts[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    posts[index].title,
                    style: TextStyle(
                        color: appColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Share to",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 17,
                                ),
                                SizedBox(
                                  height: 100.0,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: sharePosts.length,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        width: 90,
                                        child: Column(children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 35,
                                            backgroundImage: AssetImage(
                                              'assets/images/${sharePosts[index].imageUrl}',
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            sharePosts[index].id,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ]),
                                      );
                                    },
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 15),
                                  child: Divider(
                                    color: Colors.grey,
                                    height: 5,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "This Pin was inspired by your recent activity",
                                        style: TextStyle(fontSize: 14),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Hide",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        "Report",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 26),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey.shade300),
                                    child: const Text("Close",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Icon(Icons.more_horiz, color: appColors.white),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

final List<Post> posts = [
  Post(
    id: '0',
    imageUrl:
        'https://images.unsplash.com/photo-1568890686150-64af65720e69?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    title: 'Spiderman wall art',
  ),
  Post(
    id: '1',
    imageUrl:
        'https://images.unsplash.com/photo-1634828221818-503587f33d02?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1665&q=80',
    title: 'Comic book collection',
  ),
  Post(
    id: '2',
    imageUrl:
        'https://images.unsplash.com/photo-1596727147705-61a532a659bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNvbWljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
    title: 'Powerful Baby Groot',
  ),
  Post(
    id: '3',
    imageUrl:
        'https://images.unsplash.com/photo-1611604548018-d56bbd85d681?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
    title: 'DC best friends',
  ),
  Post(
    id: '4',
    imageUrl:
        'https://images.unsplash.com/photo-1624562563808-170065db4fcc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
    title: 'Spiderman in action',
  ),
  Post(
    id: '5',
    imageUrl:
        'https://images.unsplash.com/photo-1534809027769-b00d750a6bac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    title: 'Will he save Gwen?',
  ),
  Post(
    id: '6',
    imageUrl:
        'https://images.unsplash.com/photo-1601645191163-3fc0d5d64e35?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80',
    title: 'Collector Edition',
  ),
  Post(
    id: '7',
    imageUrl:
        'https://images.unsplash.com/photo-1569003339405-ea396a5a8a90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y29taWN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
    title: 'Captain America strikes',
  ),
  Post(
    id: '8',
    imageUrl:
        'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGNvbWljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
    title: 'The Dark Knight',
  ),
  Post(
    id: '9',
    imageUrl:
        'https://images.unsplash.com/photo-1608889175250-c3b0c1667d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGNvbWljJTIwc3VwZXJtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
    title: 'Snap snap',
  ),
];

final List<Post> sharePosts = [
  Post(
    id: '1',
    title: 'Message',
    imageUrl: 'message.png',
  ),
  Post(
    id: '1',
    title: 'WhatsApp',
    imageUrl: 'whatsapp.png',
  ),
  Post(
    id: '1',
    title: 'Messenger',
    imageUrl: 'clock.png',
  ),
  Post(
    id: '1',
    title: 'Messages',
    imageUrl: 'google.png',
  ),
  Post(
    id: '1',
    title: 'Facebook',
    imageUrl: 'facebook.png',
  ),
];
