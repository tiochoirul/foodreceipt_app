import 'package:flutter/material.dart';
import 'package:foodreceipt_app/component/like_dislike_button.dart';
import 'package:foodreceipt_app/model/receipt.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.receipt}) : super(key: key);

  final Receipt receipt;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 800) {
        return DetailWebPage(receipt: receipt);
      } else {
        return DetailMobilePage(receipt: receipt);
      }
    });
  }
}

class DetailMobilePage extends StatelessWidget {
  const DetailMobilePage({Key? key, required this.receipt}) : super(key: key);

  final Receipt receipt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    receipt.imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 196, 195, 195),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    receipt.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const LikeDislikeButton(),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(receipt.description),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Bahan-bahan:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  ...receipt.ingredients.map(
                    (ing) {
                      return Text('- $ing');
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Cara Membuat:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  ...receipt.howToMake.map(
                    (htm) {
                      return Text(htm);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatelessWidget {
  const DetailWebPage({Key? key, required this.receipt}) : super(key: key);

  final Receipt receipt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
              child: Center(
                child: SizedBox(
                  width: 900,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 196, 195, 195),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            receipt.name,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(receipt.imageAsset),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      const LikeDislikeButton(),
                      const SizedBox(
                        width: 24,
                      ),
                      Text(
                        receipt.description,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Bahan-bahan:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      ...receipt.ingredients.map(
                        (ing) {
                          return Text('- $ing');
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Cara Membuat:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      ...receipt.howToMake.map(
                        (htm) {
                          return Text(htm);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
