import 'package:flutter/material.dart';
import 'package:interview_application/src/src.dart';

Widget buildCardItemLists(HomeProvider homeProvider) {
  return ListView.builder(
    itemCount: homeProvider.cardItems.length,
    itemBuilder: (context, index) {
      final item = homeProvider.cardItems[index];
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    item.author,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(item.created),
                ),
                IAImage(
                  imagePath: item.image,
                  size: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    item.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    actionDecoration(Icons.thumb_up, item.liked.toString()),
                    actionDecoration(Icons.share, item.shared.toString()),
                    actionDecoration(Icons.comment, item.comments.toString()),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget actionDecoration(IconData iconData, String label) {
  return Row(
    children: [
      Icon(iconData),
      const SizedBox(width: 5.0),
      Text(
        label,
        style: TextStyle(color: Colors.black.withOpacity(0.6)),
      ),
    ],
  );
}
