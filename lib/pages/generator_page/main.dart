import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugen_mobile_app/components/animated_card_container.dart';
import 'package:yugen_mobile_app/main.dart';
import 'package:yugen_mobile_app/pages/generator_page/components/action_buttons.dart';
import 'dart:developer' as developer;
import 'package:yugen_mobile_app/main.dart' show MyAppState;

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);
    return Text(
      pair.asLowerCase,
      style: style,
      semanticsLabel: "${pair.first} ${pair.second}",
    );
  }
}

class GeneratorPage extends StatefulWidget {
  GeneratorPage({super.key});

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {

  @override
  Widget build(BuildContext context) {
    var myAppState = context.watch<MyAppState>();
    bool isLike = myAppState.checkIsLike();

    void onLikePress() {
      developer.log("Like pressed", name: 'pages.generator_page.main');

      // Add pair to favorite.
      myAppState.toggleFavorite();
    }


    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedCardContainer(
            body: BigCard(pair: myAppState.current),
            padding: 15.0,
          ),
          SizedBox(height: 10),
          ActionButtons(onLikePressed: () => onLikePress(), isLike: isLike,)
        ],
      ),
    );
  }
}