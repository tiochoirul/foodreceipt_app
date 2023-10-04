import 'package:flutter/material.dart';
import 'package:foodreceipt_app/component/circle_category.dart';
import 'package:foodreceipt_app/detail_screen.dart';
import 'package:foodreceipt_app/model/receipt.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.gridCount}) : super(key: key);

  final int gridCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Receipe',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Selamat datang kembali, cooker!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleCategory(
                    icon: Icon(Icons.food_bank),
                    description: 'Semua\nMasakan',
                  ),
                  CircleCategory(
                    icon: Icon(Icons.star),
                    description: 'Masakan\nPopuler',
                  ),
                  CircleCategory(
                    icon: Icon(Icons.free_breakfast),
                    description: 'Masakan\nJawa',
                  ),
                  CircleCategory(
                    icon: Icon(Icons.lunch_dining),
                    description: 'Masakan\nSunda',
                  ),
                  CircleCategory(
                    icon: Icon(Icons.breakfast_dining),
                    description: 'Masakan\nBali',
                  ),
                  CircleCategory(
                    icon: Icon(Icons.dinner_dining),
                    description: 'Masakan\nPadang',
                  ),
                  CircleCategory(
                    icon: Icon(Icons.coffee),
                    description: 'Masakan\nKorea',
                  ),
                  CircleCategory(
                    icon: Icon(Icons.icecream),
                    description: 'Masakan\nTionghoa',
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Mau masak apa hari ini?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              crossAxisCount: gridCount,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: receiptList.map((receipt) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(receipt: receipt);
                    }));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            receipt.imageAsset,
                            fit: BoxFit.cover,
                            scale: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            receipt.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
