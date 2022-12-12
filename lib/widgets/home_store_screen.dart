import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeStoreScreen extends StatefulWidget {
  const HomeStoreScreen({
    super.key,
  });

  @override
  State<HomeStoreScreen> createState() => _HomeStoreScreenState();
}

class _HomeStoreScreenState extends State<HomeStoreScreen> {
  bool tabButtonPhone = true;
  bool tabButtonComputer = false;
  bool tabButtonHealth = false;
  bool tabButtonBooks = false;

  bool isLoading = false;

  late Map<String, dynamic> data;

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
        .get('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');

    data = responce.data;

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const accentColor = Color.fromARGB(255, 255, 110, 78);
    const mainColor = Color.fromARGB(255, 1, 0, 53);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.location_on_outlined,
                                color: accentColor,
                              ),
                              Text(
                                'Zihuatanejo, Gro',
                                style: TextStyle(color: mainColor),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 40,
                                  ),
                                  height: 414,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: mainColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                            ),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ),
                                          const Expanded(
                                            child: Center(
                                              child: Text(
                                                'Filter options',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: mainColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      accentColor),
                                            ),
                                            child: const Text('Done'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      const Text(
                                        'Brand',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: mainColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Card(
                                        shape: const RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: const [
                                              Expanded(child: Text('Samsung')),
                                              Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                color: Colors.grey,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text(
                                        'Prise',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: mainColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Card(
                                        shape: const RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: const [
                                              Expanded(
                                                child: Text('\$300 - \$500'),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                color: Colors.grey,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text(
                                        'Size',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: mainColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Card(
                                        shape: const RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: const [
                                              Expanded(
                                                  child: Text(
                                                      '4.5 to 5.5 inches')),
                                              Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                color: Colors.grey,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.filter_alt_outlined),
                          color: mainColor,
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Expanded(
                            child: Text(
                          'Select Category',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: mainColor,
                          ),
                        )),
                        Text('view all', style: TextStyle(color: accentColor)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor:
                                  tabButtonPhone ? accentColor : Colors.white,
                              child: IconButton(
                                icon: Icon(
                                  Icons.phone_iphone_outlined,
                                  color: tabButtonPhone
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    tabButtonPhone = true;
                                    tabButtonComputer = false;
                                    tabButtonHealth = false;
                                    tabButtonBooks = false;
                                    ;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Text('Phones')
                          ],
                        ),
                        const SizedBox(
                          width: 23,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: tabButtonComputer
                                  ? accentColor
                                  : Colors.white,
                              child: IconButton(
                                icon: Icon(
                                  Icons.computer,
                                  color: tabButtonComputer
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    tabButtonPhone = false;
                                    tabButtonComputer = true;
                                    tabButtonHealth = false;
                                    tabButtonBooks = false;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Text('Computer')
                          ],
                        ),
                        const SizedBox(
                          width: 23,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor:
                                  tabButtonHealth ? accentColor : Colors.white,
                              child: IconButton(
                                icon: Icon(
                                  Icons.heart_broken,
                                  color: tabButtonHealth
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    tabButtonPhone = false;
                                    tabButtonComputer = false;
                                    tabButtonHealth = true;
                                    tabButtonBooks = false;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Text('Health')
                          ],
                        ),
                        const SizedBox(
                          width: 23,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor:
                                  tabButtonBooks ? accentColor : Colors.white,
                              child: IconButton(
                                icon: Icon(
                                  Icons.book,
                                  color: tabButtonBooks
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    tabButtonPhone = false;
                                    tabButtonComputer = false;
                                    tabButtonHealth = false;
                                    tabButtonBooks = true;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Text('Books')
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: accentColor,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: accentColor,
                          child: IconButton(
                            icon: const Icon(
                              Icons.qr_code,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(
                            child: Text(
                          'Hot sales',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: mainColor,
                          ),
                        )),
                        Text('see more', style: TextStyle(color: accentColor)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    if (isLoading)
                      const Center(
                          child: CircularProgressIndicator(
                        color: accentColor,
                      ))
                    else
                      CarouselSlider(
                        items: <Widget>[
                          Stack(
                            fit: StackFit.passthrough,
                            children: [
                              Image.network(
                                '${data['home_store'][0]['picture']}',
                                height: 195,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: (data['home_store'][0]['is_new']) ==
                                          true
                                      ? [
                                          const SizedBox(height: 7),
                                          const CircleAvatar(
                                            radius: 28,
                                            backgroundColor: accentColor,
                                            child: Text(
                                              'New',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            '${(data['home_store'][0]['title'])}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${(data['home_store'][0]['subtitle'])}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                            ),
                                          ),
                                          const SizedBox(height: 26),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                minimumSize:
                                                    const Size(98, 23)),
                                            child: const Text(
                                              'Buy now!',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ]
                                      : [
                                          const SizedBox(height: 85),
                                          Text(
                                            '${(data['home_store'][0]['title'])}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${(data['home_store'][0]['subtitle'])}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                            ),
                                          ),
                                          const SizedBox(height: 26),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                minimumSize:
                                                    const Size(98, 23)),
                                            child: const Text(
                                              'Buy now!',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              Image.network(
                                '${data['home_store'][1]['picture']}',
                                height: 195,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: (data['home_store'][1]['is_new']) ==
                                          true
                                      ? [
                                          const SizedBox(height: 7),
                                          const CircleAvatar(
                                            radius: 28,
                                            backgroundColor: accentColor,
                                            child: Text(
                                              'New',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            '${(data['home_store'][1]['title'])}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${(data['home_store'][1]['subtitle'])}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                            ),
                                          ),
                                          const SizedBox(height: 26),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                minimumSize:
                                                    const Size(98, 23)),
                                            child: const Text(
                                              'Buy now!',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ]
                                      : [
                                          const SizedBox(height: 85),
                                          Text(
                                            '${(data['home_store'][1]['title'])}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${(data['home_store'][1]['subtitle'])}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                            ),
                                          ),
                                          const SizedBox(height: 26),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                minimumSize:
                                                    const Size(98, 23)),
                                            child: const Text(
                                              'Buy now!',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                ),
                              )
                            ],
                          ),
                          Stack(
                            fit: StackFit.passthrough,
                            children: [
                              Image.network(
                                '${data['home_store'][2]['picture']}',
                                fit: BoxFit.cover,
                                height: 195,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: (data['home_store'][2]['is_new']) ==
                                          true
                                      ? [
                                          const SizedBox(height: 7),
                                          const CircleAvatar(
                                            radius: 28,
                                            backgroundColor: accentColor,
                                            child: Text(
                                              'New',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            '${(data['home_store'][2]['title'])}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${(data['home_store'][2]['subtitle'])}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                            ),
                                          ),
                                          const SizedBox(height: 26),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                minimumSize:
                                                    const Size(98, 23)),
                                            child: const Text(
                                              'Buy now!',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ]
                                      : [
                                          const SizedBox(height: 85),
                                          Text(
                                            '${(data['home_store'][2]['title'])}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${(data['home_store'][2]['subtitle'])}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                            ),
                                          ),
                                          const SizedBox(height: 26),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                minimumSize:
                                                    const Size(98, 23)),
                                            child: const Text(
                                              'Buy now!',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                ),
                              )
                            ],
                          ),
                        ],
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                        ),
                      ),
                    const SizedBox(height: 26),
                    Row(
                      children: const [
                        Expanded(
                            child: Text(
                          'Best Seller',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: mainColor,
                          ),
                        )),
                        Text('see more', style: TextStyle(color: accentColor)),
                      ],
                    ),
                    if (isLoading)
                      const Center(
                          child: CircularProgressIndicator(
                        color: accentColor,
                      ))
                    else
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(
                                      context,
                                    ).pushNamed(
                                        '/widgets/product_detail_screen');
                                  },
                                  child: Container(
                                    height: 227,
                                    width: 181,
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Image.network(
                                              '${data['best_seller'][0]['picture']}',
                                              cacheHeight: 170,
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  (data['best_seller'][0][
                                                              'is_favorites']) ==
                                                          true
                                                      ? Icons.favorite_outlined
                                                      : Icons.favorite_border,
                                                  color: accentColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '\$${data['best_seller'][0]['price_without_discount']}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: mainColor,
                                              ),
                                            ),
                                            const SizedBox(width: 7),
                                            Text(
                                              '\$${data['best_seller'][0]['discount_price']}',
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${data['best_seller'][0]['title']}',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(
                                      context,
                                    ).pushNamed(
                                        '/widgets/product_detail_screen');
                                  },
                                  child: Container(
                                    height: 227,
                                    width: 181,
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Image.network(
                                              '${data['best_seller'][1]['picture']}',
                                              cacheHeight: 170,
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  (data['best_seller'][1][
                                                              'is_favorites']) ==
                                                          true
                                                      ? Icons.favorite_outlined
                                                      : Icons.favorite_border,
                                                  color: accentColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '\$${data['best_seller'][1]['price_without_discount']}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: mainColor,
                                              ),
                                            ),
                                            const SizedBox(width: 7),
                                            Text(
                                              '\$${data['best_seller'][1]['discount_price']}',
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${data['best_seller'][1]['title']}',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(
                                      context,
                                    ).pushNamed(
                                        '/widgets/product_detail_screen');
                                  },
                                  child: Container(
                                    height: 227,
                                    width: 181,
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Image.network(
                                              '${data['best_seller'][2]['picture']}',
                                              cacheHeight: 170,
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  (data['best_seller'][2][
                                                              'is_favorites']) ==
                                                          true
                                                      ? Icons.favorite_outlined
                                                      : Icons.favorite_border,
                                                  color: accentColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '\$${data['best_seller'][2]['price_without_discount']}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: mainColor,
                                              ),
                                            ),
                                            const SizedBox(width: 7),
                                            Text(
                                              '\$${data['best_seller'][2]['discount_price']}',
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${data['best_seller'][2]['title']}',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(
                                      context,
                                    ).pushNamed(
                                        '/widgets/product_detail_screen');
                                  },
                                  child: Container(
                                    height: 227,
                                    width: 181,
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            Image.network(
                                              '${data['best_seller'][3]['picture']}',
                                              cacheHeight: 170,
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  (data['best_seller'][3][
                                                              'is_favorites']) ==
                                                          true
                                                      ? Icons.favorite_outlined
                                                      : Icons.favorite_border,
                                                  color: accentColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '\$${data['best_seller'][3]['price_without_discount']}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: mainColor,
                                              ),
                                            ),
                                            const SizedBox(width: 7),
                                            Text(
                                              '\$${data['best_seller'][3]['discount_price']}',
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${data['best_seller'][3]['title']}',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
