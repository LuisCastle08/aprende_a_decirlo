class Game {
  final String hiddenCardpath = "assets/logo.png";

  List<String>? gameImg;

  final List<String> cards_list = [
      'assets/alfabeto/a.png',
        'assets/alfabeto/b.png',
        'assets/alfabeto/e.png',
        'assets/alfabeto/c.png',   
        'assets/alfabeto/a.png',  
        'assets/alfabeto/b.png', 
        'assets/alfabeto/e.png',
        'assets/alfabeto/c.png',
  ];

  List<Map<int, String>> matchCheck = [

  ];

  final int cardCount = 8;

  void initGame() {
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
