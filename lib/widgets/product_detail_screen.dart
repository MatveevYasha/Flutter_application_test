import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int counterDetail = 0;

  void _incrementCounter() {
    setState(() {
      counterDetail++;
    });
  }

  bool isLoading = false;

  Map<String, dynamic>? dataProduct;

  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    final responce = await _dio
        .get('https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5');

    dataProduct = responce.data;

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const accentColor = Color.fromARGB(255, 255, 110, 78);
    const mainColor = Color.fromARGB(255, 1, 0, 53);
    const starColor = Color.fromARGB(255, 255, 183, 0);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Product Details',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: mainColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        if (counterDetail == 0)
                          Container(
                            decoration: const BoxDecoration(
                              color: accentColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).pushNamed('/widgets/my_cart');
                              },
                            ),
                          ),
                        if (counterDetail != 0)
                          Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: accentColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pushNamed(
                                      '/widgets/my_cart',
                                      arguments: counterDetail,
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                top: 2,
                                right: 5,
                                child: Text(
                                  '$counterDetail',
                                  key: UniqueKey(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    if (isLoading)
                      const Center(
                          child: CircularProgressIndicator(
                        color: accentColor,
                      ))
                    else
                      CarouselSlider(items: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Image.network('${dataProduct?['images'][0]}'),
                        ),
                        Image.network('${dataProduct?['images'][1]}'),
                      ], options: CarouselOptions())
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${dataProduct?['title']}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: mainColor,
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: starColor,
                          ),
                          Icon(
                            Icons.star,
                            color: starColor,
                          ),
                          Icon(
                            Icons.star,
                            color: starColor,
                          ),
                          Icon(
                            Icons.star,
                            color: starColor,
                          ),
                          Icon(
                            Icons.star,
                            color: starColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Shop',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: mainColor,
                              ),
                            ),
                            Container(
                              height: 3,
                              width: 85,
                              color: accentColor,
                            ),
                          ],
                        ),
                        const Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          'Features',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Icon(
                              Icons.memory_outlined,
                              color: Colors.grey,
                            ),
                            Text(
                              'Exynos 990',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.grey,
                            ),
                            Text(
                              '108 + 12 mp',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(
                              Icons.r_mobiledata_outlined,
                              color: Colors.grey,
                            ),
                            Text(
                              '8 GB',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(
                              Icons.sd_card_outlined,
                              color: Colors.grey,
                            ),
                            Text(
                              '256 GB',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Select color and capacity',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: mainColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(119, 45, 3, 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                        Container(
                          height: 43,
                          width: 43,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                        Container(
                          child: Text(
                            '128 GB',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        Text(
                          '256 GB',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: _incrementCounter,
                      child: Center(
                        child: Container(
                          height: 55,
                          width: 350,
                          decoration: const BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'Add to cart ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '\$1500.00',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
