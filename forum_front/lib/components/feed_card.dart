import 'package:flutter/material.dart';

class FeedCard extends StatefulWidget {
  const FeedCard({super.key});

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Column(children: [CircleAvatar()]),
            title: Text("Title"),
            subtitle: Text("Description"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [Icon(Icons.heart_broken), Icon(Icons.comment)]),
              Row(children: [Icon(Icons.fire_truck), Icon(Icons.abc_outlined)],)
            ],
          ),
        ],
      ),
    );
  }
}
