import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/constants/app_font.dart';
import 'package:forum_front/constants/app_styles.dart';
import 'package:forum_front/models/news.dart';

class FeedCard extends StatefulWidget {
  final News news;
  const FeedCard({super.key, required this.news});

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: LinearBorder.bottom(
        side: BorderSide(width: 2, color: Colors.grey.shade800),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        CircleAvatar(
                          radius: 12,
                          child: Text("${widget.news.author[0]}"),
                        ),
                        Text(
                          "${widget.news.author}",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text("12h", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey.shade800, width: 1),
                      ),
                      onPressed: () {},
                      child: Icon(Icons.favorite, size: 14),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text("${widget.news.titulo}", style: TextStyle(fontSize: 18)),
                Text(
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  "${widget.news.body}",
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 18),
                    backgroundColor: AppColors.blue_claro_1_opacity15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onPressed: () => {
                  },
                  child: const Text("Ver Mais"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
