import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yugen_mobile_app/components/animated_card_container.dart';
import 'package:yugen_mobile_app/pages/generator_page/components/action_buttons.dart';

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

class GeneratorPage extends StatelessWidget {
  final WordPair pair;
  const GeneratorPage({required this.pair});

  @override
  Widget build(BuildContext context) {
    bool isLike = false;

    void likedPressed() {
      print("Like pressed!");
      isLike = !isLike;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedCardContainer(
            body: BigCard(pair: pair),
            padding: 15.0,
          ),
          SizedBox(height: 10),
          ActionButtons(onLikePressed: () => likedPressed(), isLike: isLike,)
        ],
      ),
    );
  }
}