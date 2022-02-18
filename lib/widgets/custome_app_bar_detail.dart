import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomSliverAppBarDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: HexColor("#2B2F33"),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 7,
            ),
            Center(
              child: Text(
                "Xem trực tiếp",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20.0),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4.5,
            ),
            PopupMenuButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: SvgPicture.asset(
                      "assets/twocamera.svg",
                    )),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.qr_code),
                        Text(
                          "Quét mã QR",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 20.0),
                        ),
                      ],
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        Text(
                          "Nhâp thủ công",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 16.0),
                        ),
                      ],
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.wifi),
                        Text(
                          "Quét trong LAN",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 20.0),
                        ),
                      ],
                    ),
                    value: 1,
                  ),
                ]),
            SizedBox(
              width: MediaQuery.of(context).size.width / 30,
            ),
          ],
        ));
  }
}
