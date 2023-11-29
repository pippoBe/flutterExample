import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:yugen_mobile_app/main.dart';

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myAppState = context.watch<MyAppState>();
    var lengthFavorites = myAppState.favorites.length;


    final theme = Theme.of(context);
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                lengthFavorites == 0 ? "No favorites!" : "You have $lengthFavorites favorites:",
                textAlign: lengthFavorites == 0 ? TextAlign.center : TextAlign.start,
                style: theme.textTheme.headlineSmall,
              ),
            ],
          ),
        ),
    );
  }
}

class FavoriteElement extends StatefulWidget {
  final String element;
  final void Function() onDeletePressed;
  final double? ratio;

  const FavoriteElement({
    super.key,
    required this.element,
    required this.onDeletePressed,
    this.ratio = 6,
  });

  @override
  State<FavoriteElement> createState() => _FavoriteElementState();
}

class _FavoriteElementState extends State<FavoriteElement> {

  @override
  Widget build(BuildContext context) {
    var textSize = widget.ratio != null ? widget.ratio! * 6 : 10.0;
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.delete_outline,
          color: theme.colorScheme.primary,
          size: textSize * 1.5,
        ),
        Text(
          widget.element,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: textSize
          ),
        ),
        /*Container(
          width: 10,
          height: 10,
          child:
        ),
        Container(
          width: 10,
          height: 10,
          color: Colors.blueGrey,

        ),*/
      ],
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({ super.key });

  @override
  Widget build(BuildContext context) {
    var myAppState = context.watch<MyAppState>();
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    var elementRatio = (deviceWidth / deviceHeight) * 6;

    var rightPadding = (deviceWidth / deviceHeight) * 10;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        PageTitle(),
        SizedBox(height: 30,),
        GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          padding: EdgeInsets.only(left: 0.0, right: rightPadding),
          childAspectRatio: elementRatio,
          shrinkWrap: true,
          // Generate 100 widgets that display their index in the List.
          children: [
            ...myAppState.favorites.asMap().entries.map((el) =>
                FavoriteElement(
                    element: el.value.asLowerCase,
                    onDeletePressed: () => myAppState.removeFavorite(el.value),
                    ratio: elementRatio,
                )
            )
          ]
        ),
      ],
    );
  }
}