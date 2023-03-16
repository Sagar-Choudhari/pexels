import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexels/Service/colors.dart';
import 'package:share/share.dart';
import '../Model/post.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:photo_view/photo_view.dart';

AppColors appColors = AppColors();

class FollowFeed extends StatefulWidget {
  const FollowFeed({Key? key}) : super(key: key);

  @override
  State<FollowFeed> createState() => _FollowFeedState();
}

class _FollowFeedState extends State<FollowFeed> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      iconSize: 35,
                      onPressed: () {},
                      icon: ClipOval(
                        child: Image.network(
                          posts[index].imageUrl,
                          height: 300,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text('Sagar Choudhary',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: appColors.white,
                            fontSize: 17.0,
                          ),
                        )),
                    const Expanded(child: SizedBox()),
                    /*TextButton(
                      onPressed: () {
                        // Do something when the button is pressed
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          const BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      child: const Text('Follow'),
                    ),*/
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: appColors.white,
                        )),
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 365,
                  child: GestureDetector(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: PhotoView(
                          imageProvider:
                          Image.network(posts[index].imageUrl).image,
                          loadingBuilder: (context, event) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          backgroundDecoration:
                          const BoxDecoration(color: Colors.white),
                          minScale: PhotoViewComputedScale.contained * 0.8,
                          maxScale: PhotoViewComputedScale.covered * 2,
                          initialScale: PhotoViewComputedScale.contained,
                        )),
                    onDoubleTap: () {
                      setState(() {
                        isLiked = isLiked ? false : true;
                      });
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 10),
                    InkResponse(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Icon(
                        isLiked
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: isLiked ? Colors.red : appColors.white,
                        size: 30.0,
                      ),
                    ),
                    const SizedBox(width: 13),
                    IconButton(
                      onPressed: () {
                        _showModalBottomSheet(context);
                      },
                      icon: const Icon(CupertinoIcons.conversation_bubble),
                      color: appColors.white,
                    ),
                    IconButton(
                      onPressed: () async {
                        String imagePath = posts[index].imageUrl;
                        Share.share('check out this image : $imagePath',
                            subject: 'Look what I found!');
                      },
                      icon: const Icon(CupertinoIcons.paperplane),
                      color: appColors.white,
                    ),
                    const Expanded(child: SizedBox()),
                    IconButton(
                      icon: const Icon(CupertinoIcons.arrow_down_to_line),
                      color: appColors.white,
                      onPressed: () {
                        debugPrint('started');
                        String path = posts[index].imageUrl;
                        debugPrint(path);
                        _saveNetworkImage(path);
                      },
                    )
                  ],
                ),
              ],
            );
          }),
    );
  }
}

/*void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          color: appColors.darkGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              Text(
                'Comments',
                style: TextStyle(
                  color: appColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}*/

void _saveNetworkImage(String path) async {

  Uri uri = Uri.parse(path);

  String newUrl = Uri(
    scheme: uri.scheme,
    host: uri.host,
    path: uri.path,
  ).toString();

  print(newUrl);

  GallerySaver.saveImage(newUrl, toDcim: true, albumName: 'Pexels')
      .then((bool? success) {
    debugPrint('Image is saved');
  });
}

void _showModalBottomSheet(BuildContext context) {
  final commentText = TextEditingController();
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: appColors.darkGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Comments',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: appColors.white),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: ClipOval(
                                    child: Image.network(
                                      posts[index].imageUrl,
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          posts[index].title,
                                          style:
                                          TextStyle(color: appColors.white),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '${posts[index].id} Min',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: appColors.white),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      posts[index].imageUrl,
                                      style: TextStyle(
                                        color: appColors.lightGrey,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              InkResponse(
                                onTap: () {},
                                child: Icon(
                                  CupertinoIcons.heart,
                                  color: appColors.white,
                                  size: 18.0,
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 1,
                        left: 5,
                        right: 5,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: ListTile(
                      leading: ClipOval(
                        child: Image.network(
                          posts[9].imageUrl,
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: TextFormField(
                        controller: commentText,
                        style: TextStyle(color: appColors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter comment...',
                          hintStyle: TextStyle(color: appColors.lightGrey),
                        ),
                      ),
                      trailing: TextButton(
                          onPressed: () {}, child: const Text('Post')),
                    ),

                    /*Row(
                        children: <Widget>[
                          LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Container(
                                width: constraints.maxWidth,
                                height: constraints.maxHeight,
                                child: TextFormField(
                                  style: TextStyle(color: appColors.white),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter comment...',
                                    hintStyle: TextStyle(color: appColors.lightGrey),
                                  ),
                                ),
                              );
                            },
                          ),

                        ],
                      )*/
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

/*void _showShareBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          color: appColors.darkGrey,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          children: [
            Text(
              "Share to",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
              color: appColors.white,),
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
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 26),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(30),
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
}*/

final List<Post> posts = [
  Post(
      id: '0',
      imageUrl:
      'https://images.unsplash.com/photo-1568890686150-64af65720e69?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
      title: 'Spiderman wall art',
      isLiked: false),
  Post(
      id: '1',
      imageUrl:
      'https://images.unsplash.com/photo-1634828221818-503587f33d02?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1665&q=80',
      title: 'Comic book collection',
      isLiked: false),
  Post(
      id: '2',
      imageUrl:
      'https://images.unsplash.com/photo-1596727147705-61a532a659bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNvbWljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
      title: 'Powerful Baby Groot',
      isLiked: false),
  Post(
      id: '3',
      imageUrl:
      'https://images.unsplash.com/photo-1611604548018-d56bbd85d681?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
      title: 'DC best friends',
      isLiked: false),
  Post(
      id: '4',
      imageUrl:
      'https://images.unsplash.com/photo-1624562563808-170065db4fcc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
      title: 'Spiderman in action',
      isLiked: false),
  Post(
      id: '5',
      imageUrl:
      'https://images.unsplash.com/photo-1534809027769-b00d750a6bac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
      title: 'Will he save Gwen?',
      isLiked: false),
  Post(
      id: '6',
      imageUrl:
      'https://images.unsplash.com/photo-1601645191163-3fc0d5d64e35?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80',
      title: 'Collector Edition',
      isLiked: false),
  Post(
      id: '7',
      imageUrl:
      'https://images.unsplash.com/photo-1569003339405-ea396a5a8a90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y29taWN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
      title: 'Captain America strikes',
      isLiked: false),
  Post(
      id: '8',
      imageUrl:
      'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGNvbWljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
      title: 'The Dark Knight',
      isLiked: false),
  Post(
      id: '9',
      imageUrl:
      'https://images.unsplash.com/photo-1608889175250-c3b0c1667d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGNvbWljJTIwc3VwZXJtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
      title: 'Snap snap',
      isLiked: false),
];
