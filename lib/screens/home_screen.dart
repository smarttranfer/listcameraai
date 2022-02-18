import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:flutter_youtube_ui/data.dart';
import 'package:flutter_youtube_ui/widgets/testtreeview.dart';
import 'package:flutter_youtube_ui/widgets/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeListCamera();
  }
}

bool checkpage = true;
int checkpress = 0;

class _HomeListCamera extends State<HomeScreen> {
  late VlcPlayerController _videoPlayerController;
  TextEditingController editingController = TextEditingController();
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = [];
  void filterSearchResults(String query) {
    List<Video> dummySearchList = [];
    dummySearchList.addAll(videos);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.title.contains(query)) {
          dummyListData.add(item.title);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#212529"),
        appBar: AppBar(
          backgroundColor: HexColor("#2B2F33"),
          title: CustomSliverAppBar(),
        ),
        body: Column(
          children: [
            new Row(
              children: [
                Expanded(
                  child: Container(
                    color: HexColor("#212529"),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 12,
                    padding: EdgeInsets.only(
                        top: 8, left: 20, right: 8, bottom: 8),
                    child: TextField(
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                      controller: editingController,
                      decoration: InputDecoration(
                        fillColor: HexColor("#2B2F33"),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        hintText: "Tìm Kiếm",
                        labelStyle: TextStyle(color: HexColor("#2B2F33")),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: HexColor("#2B2F33"))),
                        filled: true,
                      ),
                    ),
                  ),
                ),Container(
                margin: EdgeInsets.only(right: 20),
                child:
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: HexColor("#2B2F33"),
                  onPressed: () {},
                  child: Row(
                    children: [
                      new IconButton(
                        icon: SvgPicture.asset(
                          "assets/fillter.svg",
                        ),
                        onPressed: () {
                          checkpress += 1;
                          if (checkpress % 2 == 0) {
                            setState(() {
                              checkpage = false;
                            });
                          } else {
                            setState(() {
                              checkpage = true;
                            });
                          }
                        },
                      ),
                      Text("Lọc",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 15))
                    ],
                  ),
                )
                )],
            ),
            checkpage
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: VideoCard(
                          index: index,
                          video: videos[index],
                          URLVLc: videos[index].thumbnailUrl,
                        ));
                      },
                    ),
                  )
                : Expanded(child: TreePage())
          ],
        ));
  }
}
