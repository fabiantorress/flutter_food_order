import 'package:flutter/material.dart';
import 'package:flutter_food_order/detail_page.dart';
import 'package:flutter_food_order/main.dart';
import 'package:flutter_food_order/model_counter.dart';
import 'package:flutter_food_order/model_sum.dart';
import 'package:provider/provider.dart';

import 'model_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails) {
        Navigator.pop(context);
      },
      child: Material(
        color: Colors.grey[100],
        child: Column(
          children: [
            ListView.builder(
              itemCount: cart.itemIds.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // for(var i = 0; i <= cart.itemsIds ; i++)
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 15, bottom: 10),
                            height: 90,
                            width: 90,
                            child: allFoodDishes[cart.itemIds[index] - 1].image,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 20,
                                  left: 20,
                                ),
                                child: Text(
                                  allDetailFood[cart.itemIds[index] - 1].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, left: 20),
                                child: Text(
                                  allDetailFood[cart.itemIds[index] - 1].weight,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              AddButton(
                                number: index,
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 80, 20, 20),
                            child: Row(
                              children: [
                                const Text(
                                  '\$',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Text(
                                  '${allFoodDishes[cart.itemIds[index] - 1].price}',
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                        '~3H4KUR0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10),
                    height: 30,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Promocode Confirmed',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            NumberTotal(),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({Key? key, required this.number}) : super(key: key);
  final int number;

  @override
  Widget build(BuildContext context) {
    var sum = context.watch<SumTotal>();
    var counter = context.read<Counter>();
    var cart = context.watch<CartModel>();
    var countState = context.watch<Counter>();
    var countsUpdate = countState.counts;
    cart.itemIds.forEach(
      (e) {
        if (!countsUpdate.containsKey(e)) {
          countsUpdate[e] = 1;
        }
      },
    );
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 0, 13),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
      height: 30,
      width: 90,
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 10),
            child: GestureDetector(
                onTap: () {
                  if (counter.counts[cart.itemIds[number]] > 0) {
                    counter.decrease(number);
                  }
                },
                child: Icon(
                  size: 20,
                  Icons.remove,
                  color: Colors.black,
                )),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 4, right: 4),
            child: Text(
              '${counter.counts[cart.itemIds[number]]}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            child: GestureDetector(
                onTap: () {
                  counter.increment(number);
                },
                child: Icon(
                  size: 20,
                  Icons.add,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}

class NumberTotal extends StatelessWidget {
  const NumberTotal({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    var sum = context.read<SumTotal>();
    var counter = context.watch<Counter>();
    var priceList = [];
    for (int i = 0; i < counter.counts.length; i++) {
      priceList.add(allFoodDishes[(cart.itemIds[i] - 1)].price);
      sum.sumTotal.add(priceList[i] * counter.counts[cart.itemIds[i]]);
    }
    int total = 0;
    if (sum.sumTotal.isEmpty) {
      total = 0;
    } else {
      total = sum.sumTotal.reduce((value, element) => value + element);
    }
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(40, 20, 20, 0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Subtotal',
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Text(
                      '\$',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$total',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(40, 20, 20, 0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Promocode',
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Text(
                      '-',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '6',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(40, 20, 20, 0),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'Total',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    const Text(
                      '\$',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${total - 6}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
