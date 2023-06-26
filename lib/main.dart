import 'package:flutter/material.dart';
import 'package:flutter_food_order/cart_page.dart';
import 'package:flutter_food_order/detail_page.dart';
import 'package:flutter_food_order/model_counter.dart';
import 'package:flutter_food_order/model_sum.dart';
import 'package:provider/provider.dart';

import 'model_cart.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CartModel>(
          create: (context) => CartModel(),
        ),
        ChangeNotifierProxyProvider<CartModel, Counter>(
          create: (context) =>
              Counter(Provider.of<CartModel>(context, listen: false)),
          update: (context, cart, counter) => Counter(cart),
        ),
        ChangeNotifierProxyProvider2<CartModel, Counter, SumTotal>(
          create: (context) => SumTotal(
/*               Provider.of<CartModel>(context, listen: false),
              Provider.of<Counter>(context, listen: false) */
              ),
          update: (context, cart, counter, sum) =>
              SumTotal(/* cart, counter */),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FoodHomePage(),
    );
  }
}

class FoodHomePage extends StatefulWidget {
  const FoodHomePage({Key? key}) : super(key: key);

  @override
  _FoodHomePageState createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              Container(
                height: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.white),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 160,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: Colors.black,
                        ),
                        child: Column(
                          children: [
                            const PrincipalTitle(),
                            const SizedBox(height: 11),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[800],
                              ),
                              child: const TextField(
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    padding: EdgeInsets.only(left: 10),
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  hintText: 'Search for something tasty...',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.repeat),
                                ),
                                Text(
                                  'Repeat last order',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          greyBarWidget,
                          Container(
                            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.question_mark),
                                ),
                                Text(
                                  'Help me choose',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          greyBarWidget,
                          Container(
                            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.restaurant),
                                ),
                                Text(
                                  'Surprise me',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          importantTitle(0),
          topCategories,
          importantTitle(1),
          gridFoodDishes,
        ],
      ),
    );
  }
}

////////// GREY BAR WIDGET ////////////

Widget greyBarWidget = Container(
  margin: const EdgeInsets.only(left: 30, right: 40, top: 10, bottom: 10),
  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
  color: Colors.grey[300],
  height: 3,
);

////////// GREY BAR WIDGE ////////////

////////// TITLE 'TOP CATEGORIES' AND 'RECOMMENDED FOR YOU' ////////////

class Title {
  const Title({required this.text});
  final Text text;
}

const allTitles = [
  Title(
      text: Text(
    'Top Categories',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  )),
  Title(
      text: Text(
    'Recommended for you',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  )),
];

Widget importantTitle(int index) {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
          child: allTitles[index].text,
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(0, 33, 30, 0),
        child: Row(
          children: [
            Text(
              'View all ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                  fontSize: 15),
            ),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colors.grey[500],
              size: 20,
            ),
          ],
        ),
      ),
    ],
  );
}
////////// TITLE TOP CATEGORIES ////////////

////////// TOP CATEGORIES ////////////

Widget topCategories = Container(
  padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
  height: 65,
  alignment: Alignment.centerLeft,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: allCategories.length,
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        width: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            allCategories[index].icon,
            allCategories[index].text,
          ],
        ),
      );
    },
  ),
);

class TopCategories {
  const TopCategories({required this.icon, required this.text});
  final Icon icon;
  final Text text;
}

const allCategories = [
  TopCategories(
      icon: Icon(Icons.nature_sharp, color: Colors.green),
      text: Text(
        ' Vegan',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      )),
  TopCategories(
      icon: Icon(Icons.coffee, color: Colors.orange),
      text: Text(
        ' Coffee',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      )),
  TopCategories(
      icon: Icon(Icons.cookie, color: Colors.pink),
      text: Text(
        ' Cookie',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      )),
  TopCategories(
      icon: Icon(Icons.icecream, color: Colors.pink),
      text: Text(
        ' Ice cream',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      )),
];

////////// TOP CATEGORIES ////////////

////////// RECOMMENDED FOR YOU CATEGORY ////////////

Widget gridFoodDishes = Expanded(
  child: GridView.builder(
    shrinkWrap: true,
    physics: const ScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 15),
    padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
    itemCount: allFoodDishes.length,
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        height: 120,
        width: 200,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPageFood(
                  number: index,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[300]),
                child: allFoodDishes[index].image,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(child: allFoodDishes[index].title)),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(top: 19, left: 20),
                      child: Row(
                        children: [
                          const Text(
                            '\$',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Text(
                            '${allFoodDishes[index].price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  ),
);

class FoodDishes {
  const FoodDishes(
      {required this.id,
      required this.image,
      required this.title,
      required this.price});
  final int id;
  final Image image;
  final Text title;
  final int price;
}

var allFoodDishes = [
  FoodDishes(
    id: 1,
    image: Image.asset(
      'assets/quinoa.jpg',
      fit: BoxFit.fill,
      alignment: Alignment.center,
    ),
    title: const Text('TheKitchen~ Quinoa',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    price: 20,
  ),
  FoodDishes(
      id: 2,
      image: Image.asset(
        'assets/asparagus.jpg',
        fit: BoxFit.fill,
        alignment: Alignment.center,
      ),
      title: const Text(
        'TheKitchen~ Asparagus',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      price: 18),
  FoodDishes(
    id: 3,
    image: Image.asset(
      'assets/chole.jpg',
      fit: BoxFit.fill,
      alignment: Alignment.center,
    ),
    title: const Text('TheKitchen~ Chole',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    price: 25,
  ),
  FoodDishes(
    id: 4,
    image: Image.asset(
      'assets/salmon.jpg',
      fit: BoxFit.fill,
      alignment: Alignment.center,
    ),
    title: const Text('TheKitchen~ Salmon',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    price: 30,
  ),
];

////////// RECOMMENDED FOR YOU CATEGORY ////////////

const IconData shopping_cart = IconData(0xe59c, fontFamily: 'MaterialIcons');

class PrincipalTitle extends StatelessWidget {
  const PrincipalTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cartState = context.watch<CartModel>();
    var itemsIds = cartState.itemIds;
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 50, left: 30),
              child: const Text(
                'TheKitchen~',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 40),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(75, 30),
                primary: Colors.yellow,
                alignment: Alignment.center,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    shopping_cart,
                    size: 20,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                      child: Text(
                        '${itemsIds.length}',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
