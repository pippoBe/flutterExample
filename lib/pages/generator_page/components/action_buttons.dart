import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget{
  const ActionButtons({ super.key, this.onLikePressed, this.isLike = false});

  final bool isLike;
  final void Function()? onLikePressed;

  @override
  Widget build(BuildContext context) {
    // boll value determines whether the state of the element is like or not


    IconData icon;
    icon = isLike != false ? Icons.favorite : Icons.favorite_border;

    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton.icon(
            // Like button
              onPressed: () => onLikePressed!(),
              icon: Icon(icon),
              label: Text("Like")
          ),
          ElevatedButton(
            // Next Button
              onPressed: () => print("ZioBilly"),
              child: Text("Next")
          )
        ],
      ),
    );
  }
}