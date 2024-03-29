import 'package:bizzhome/styles.dart';
import 'package:flutter/material.dart';
import 'package:bizzhome/models/Client.dart';

const TaskTileHeight = 90.0;

class FeedTaskTile extends StatelessWidget {
  final String title;
  final String client;
  final String company;
  final String date;
  final String description;
  final String duration;
  final String points;
  final bool darkTheme;

  FeedTaskTile(this.title, this.client, this.company, this.date,
      this.description, this.duration, this.points, this.darkTheme);

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: DefaultPaddingHorizontal),
      height: TaskTileHeight,
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              title.toUpperCase() + " - " + company.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: textColor, fontSize: 18),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          "Client Name: " + client,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: textColor, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Starting Date: " + date.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: textColor, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Duration: " + duration.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: textColor, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Points: " + points.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: textColor, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
