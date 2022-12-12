import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0) {
        _counter--;
      }
    });
  }

  void _deleteCounter() {
    setState(() {
      if (_counter != 0) {
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const accentColor = Color.fromARGB(255, 255, 110, 78);
    const mainColor = Color.fromARGB(255, 1, 0, 53);
    const twoColor = Color.fromRGBO(40, 40, 67, 1);

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
                          child: SizedBox(
                            width: 100,
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Add address',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: mainColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'My Cart',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                padding: const EdgeInsets.only(
                  top: 65,
                  left: 23,
                  right: 10,
                  bottom: 35,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          'https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg',
                          height: 89,
                          width: 111,
                        ),
                        SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Galaxy Note 20 Ultra',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                '\$${_counter * 1500}.00',
                                key: UniqueKey(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: accentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: twoColor,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: _incrementCounter,
                              ),
                              Text(
                                '$_counter',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.remove_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: _decrementCounter,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: twoColor,
                          ),
                          onPressed: _deleteCounter,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 250,
                    ),
                    Container(
                      height: 4,
                      color: twoColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              const Expanded(
                                child: SizedBox(
                                  width: 15,
                                ),
                              ),
                              Text(
                                '\$${_counter * 1500}.00 us',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Delivery',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: 15,
                                ),
                              ),
                              Text(
                                'Free',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 2,
                      color: twoColor,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 55,
                        width: 320,
                        decoration: const BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: const Center(
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        )),
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
