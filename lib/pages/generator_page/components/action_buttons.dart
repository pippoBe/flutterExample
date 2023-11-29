 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugen_mobile_app/main.dart' show MyAppState;

class ActionButtons extends StatefulWidget{
  const ActionButtons({ super.key, this.onLikePressed, this.isLike = false});

  final bool isLike;
  final void Function()? onLikePressed;

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons>{

  @override
  Widget build(BuildContext context) {
    // boll value determines whether the state of the element is like or not
    var myAppState = context.watch<MyAppState>();
    IconData icon;
    icon = widget.isLike != false ? Icons.favorite : Icons.favorite_border;

    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton.icon(
            // Like button
              onPressed: () => widget.onLikePressed!(),
              icon: Icon(icon),
              label: Text("Like")
          ),
          ElevatedButton(
            // Next Button
              onPressed: () => myAppState.getNext(),
              child: Text("Next")
          )
        ],
      ),
    );
  }
}