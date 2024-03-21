import 'package:flutter/material.dart';
import 'package:loginpage/pages/login_signup.dart';
import 'package:loginpage/models/cloth_model.dart';
import 'package:loginpage/widgets/clothing_card.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class CollectionGlimpse extends StatefulWidget {
  const CollectionGlimpse({super.key});

  @override
  State<CollectionGlimpse> createState() => _CollectionGlimpseState();
}

class _CollectionGlimpseState extends State<CollectionGlimpse>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final CardSwiperController controller = CardSwiperController();
  final cards = cloth.map(ClothCard.new).toList();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut.flipped,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Image.asset(
                  "assets/logo.png",
                  width: 250,
                  height: 100,
                ),
              ),
              const Text(
                "Dive Into The Fashion World!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Niconne',
                ),
              ),
              SizedBox(
                height: 400,
                width: 300,
                child: CardSwiper(
                  controller: controller,
                  cardsCount: cards.length,
                  onSwipe: _onSwipe,
                  onUndo: _onUndo,
                  numberOfCardsDisplayed: 3,
                  backCardOffset: const Offset(30, 0),
                  padding: const EdgeInsets.fromLTRB(5, 20, 20, 0),
                  cardBuilder: (
                    context,
                    index,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,
                  ) =>
                      cards[index],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey[300])),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Login to Rent An Attire",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
