import 'package:flutter/material.dart';
import 'package:flutter_food_order/main.dart';
import 'package:provider/provider.dart';

import 'model_cart.dart';

////////// DETAIL PAGE ////////////

class DetailFoodDishes {
  DetailFoodDishes(
      {required this.id,
      required this.image,
      required this.title,
      required this.weight,
      required this.icon1,
      required this.category,
      required this.icon2,
      required this.calories,
      required this.kcal,
      required this.proteins,
      required this.fats,
      required this.carbohydrates,
      required this.ingredients});
  final int id;
  final Image image;
  final String title;
  final String weight;
  final Icon icon1;
  final Text category;
  final Icon icon2;
  final Text calories;
  final Text kcal;
  final Text proteins;
  final Text fats;
  final Text carbohydrates;
  final Text ingredients;
}

var allDetailFood = [
  DetailFoodDishes(
    id: 1,
    image: Image.asset(
      'assets/quinoa_detail.jpg',
      height: 150,
      fit: BoxFit.cover,
    ),
    title: 'TheKitchen~ Quinoa',
    weight: '196 g',
    icon1: const Icon(Icons.nature_sharp, color: Colors.green),
    category: const Text(' Vegan',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    icon2: const Icon(Icons.fireplace_sharp, color: Colors.orange),
    calories: const Text('  Few Calories',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    kcal: const Text('198',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    proteins: const Text('13.1',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    fats: const Text('13.4',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    carbohydrates: const Text('5.8',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    ingredients: const Text(
        'Quinoa, Fresh peaches, shelled peas, onion pieces, pistachios, chickpeas and lettuces',
        softWrap: true,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 202, 189, 189),
            height: 1.5)),
  ),
  DetailFoodDishes(
    id: 2,
    image: Image.asset(
      'assets/asparagus_detail.jpg',
      height: 150,
      fit: BoxFit.cover,
    ),
    title: 'TheKitchen~ Asparagus',
    weight: '229 g',
    icon1: const Icon(Icons.nature_sharp, color: Colors.green),
    category: const Text(' Vegan',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    icon2: const Icon(Icons.fireplace_sharp, color: Colors.orange),
    calories: const Text('  Few Calories',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    kcal: const Text('150',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    proteins: const Text('13.1',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    fats: const Text('13.4',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    carbohydrates: const Text('5.8',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    ingredients: const Text(
        'Quinoa, Fresh peaches, shelled peas, onion pieces, pistachios, chickpeas and lettuces',
        softWrap: true,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 202, 189, 189),
            height: 1.5)),
  ),
  DetailFoodDishes(
    id: 3,
    image: Image.asset(
      'assets/chole_detail.jpg',
      height: 150,
      fit: BoxFit.cover,
    ),
    title: 'TheKitchen~ Chole',
    weight: '240 g',
    icon1: const Icon(Icons.nature_sharp, color: Colors.green),
    category: const Text(' Vegan',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    icon2: const Icon(Icons.fireplace_sharp, color: Colors.orange),
    calories: const Text('  Few Calories',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    kcal: const Text('150',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    proteins: const Text('13.1',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    fats: const Text('13.4',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    carbohydrates: const Text('5.8',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    ingredients: const Text(
        'Quinoa, Fresh peaches, shelled peas, onion pieces, pistachios, chickpeas and lettuces',
        softWrap: true,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 202, 189, 189),
            height: 1.5)),
  ),
  DetailFoodDishes(
    id: 4,
    image: Image.asset(
      'assets/salmon_detail.jpg',
      height: 150,
      fit: BoxFit.cover,
    ),
    title: 'TheKitchen~ Salmon',
    weight: '149 g',
    icon1: const Icon(Icons.nature_sharp, color: Colors.green),
    category: const Text(' Vegan',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    icon2: const Icon(Icons.fireplace_sharp, color: Colors.orange),
    calories: const Text('  Few Calories',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    kcal: const Text('150',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    proteins: const Text('13.1',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    fats: const Text('13.4',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    carbohydrates: const Text('5.8',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    ingredients: const Text(
        'Quinoa, Fresh peaches, shelled peas, onion pieces, pistachios, chickpeas and lettuces',
        softWrap: true,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 202, 189, 189),
            height: 1.5)),
  ),
];

class DetailPageFood extends StatelessWidget {
  const DetailPageFood({Key? key, required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    var cart = context.read<CartModel>();
    var cartState = context.watch<CartModel>();
    var itemsIds = cartState.itemIds;
    final isInCart = itemsIds.contains(allDetailFood[number].id);
    return Material(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children: [
            const PrincipalTitle(),
            GestureDetector(
              onHorizontalDragUpdate: (DragUpdateDetails) {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.black,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: allDetailFood[number].image,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 25, 0, 5),
              child: Text(allDetailFood[number].title,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 5),
              child: Text(allDetailFood[number].weight,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 5, 0),
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      allDetailFood[number].icon1,
                      allDetailFood[number].category,
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 5, 0),
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      allDetailFood[number].icon2,
                      allDetailFood[number].calories,
                    ],
                  ),
                ),
              ],
            ),
            greyBarWidget2,
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text('Nutricional value per 100 g',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500])),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      allDetailFood[number].kcal,
                      Container(
                        padding: const EdgeInsets.only(top: 5, right: 48),
                        child: Text('kcal',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500])),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      allDetailFood[number].proteins,
                      Container(
                        padding: const EdgeInsets.only(top: 5, right: 48),
                        child: Text('proteins',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500])),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      allDetailFood[number].fats,
                      Container(
                        padding: const EdgeInsets.only(top: 5, right: 48),
                        child: Text('fats',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500])),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      allDetailFood[number].carbohydrates,
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text('carbohydrates',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500])),
                      )
                    ],
                  ),
                ],
              ),
            ),
            greyBarWidget2,
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Text(
                'Ingredients',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: allDetailFood[number].ingredients,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    isInCart ? cart.remove(number) : cart.add(number);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    height: 40,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.yellow,
                    ),
                    child: isInCart
                        ? const Text(
                            'Remove from cart!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        : const Text(
                            'Order now!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

Widget greyBarWidget2 = Container(
  margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
  color: Colors.grey[200],
  height: 2,
);

////////// DETAIL PAGE ////////////