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
                      CircleAvatar(radius: 12,),
                      Text("pdzn_mvp", style: TextStyle(fontSize: 12)),
                      Text("12h", style: TextStyle(fontSize: 12),),
                      Text("°", style: TextStyle(fontSize: 12),),
                      Text("128 Views", style: TextStyle(fontSize: 12),),
                    ],
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(minimumSize: Size(5, 30)),
                    child: Text("Participar", style: TextStyle(fontSize: 12)),
                  ),

                ],
              ),
              SizedBox(height: 4,),
              Text("Titulo do post", style: TextStyle(fontSize: 18),),
              Text(maxLines: 3, overflow: TextOverflow.ellipsis, "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium Tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia inteiro nunc posuere. Ut hendrerit sempre vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.",)
        
            ],
            ),
            // ListTile(
            //   leading: Column(children: [CircleAvatar(radius: 18,)]),
            //   title: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("Title"),
            //       OutlinedButton(
            //         onPressed: () {},
            //         style: OutlinedButton.styleFrom(minimumSize: Size(5, 30)),
            //         child: Text("Participar", style: TextStyle(fontSize: 12)),
            //       ),
            //     ],
            //   ),
            //   subtitle: Text(
            //     maxLines: 2,
            //     overflow: TextOverflow.ellipsis,
            //     "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium Tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia inteiro nunc posuere. Ut hendrerit sempre vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.",
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey.shade800, width: 1),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.heart_broken, size: 14),
                            SizedBox(width: 2),
                            Text("12k", style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey.shade800, width: 1),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.comment, size: 14),
                            SizedBox(width: 2),
                            Text("500", style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey.shade800, width: 1),
                          shape: CircleBorder(),
                        ),
                        onPressed: () {},
                        child: Row(children: [Icon(Icons.star, size: 14)]),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey.shade800, width: 1),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.share, size: 14),
                            SizedBox(width: 2),
                            Text("1380", style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
