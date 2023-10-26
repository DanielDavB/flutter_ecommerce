import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductSingle extends StatelessWidget {
  const ProductSingle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          buildFullscreenContainer(context),
          TwoSectionContainer(),
          BlackButton(), // Add the black button
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'Represent',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: 'fightt3_',
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      shadowColor: Colors.white,
      leading: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/arrow-left-svgrepo-com.svg',
            height: 25,
            width: 25,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          child: Container(
            width: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/heart-svgrepo-com.svg',
              height: 25,
              width: 25,
            ),
          ),
        )
      ],
    );
  }

  Image fullscreenImage() {
    return Image.asset(
      'assets/images/sneaker.jpg', // Adjust the path as needed
      fit: BoxFit.cover,
    );
  }

  Container buildFullscreenContainer(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: fullscreenImage(),
    );
  }

  Widget leftSection() {
    return SizedBox(
      width: 50,
      child: Container(
        child: Column(
          children: [
            // First vertical section with ListWheelScrollView
            Expanded(
              child: ListWheelScrollView(
                itemExtent: 50, // Adjust this value as needed
                useMagnifier: true,
                magnification: 1.1,
                children: List<Widget>.generate(50, (index) {
                  return Center(
                    child: Text(
                      '$index',
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }),
              ),
            ),
            // Second vertical section
            Expanded(
              flex: 2, // Adjust the flex value to make it larger
              child: Container(
                  // Add your content for the second section here
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded rightSection() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "COLOR",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'fightt3_',
                        ),
                      ),
                    ),
                    CircleWidget(Colors.black),
                    CircleWidget(const Color.fromARGB(255, 197, 162, 59)),
                    CircleWidget(Colors.black),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 20), // Add space between the color section and size text
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Text(
              "SIZE",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'fightt3_',
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0), // Add padding to the text
                child: SingleChildScrollView(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Sed lacinia ligula vitae nisl iaculis, eget feugiat purus tempus. "
                    "Pellentesque ac risus vel justo suscipit bibendum. "
                    "Vestibulum sollicitudin dolor id nunc feugiat, quis tempor quam vehicula. "
                    "Vestibulum sollicitudin dolor id nunc feugiat, quis tempor quam vehicula. "
                    "Vestibulum sollicitudin dolor id nunc feugiat, quis tempor quam vehicula. "
                    "Vestibulum sollicitudin dolor id nunc feugiat, quis tempor quam vehicula. "
                    "Vestibulum sollicitudin dolor id nunc feugiat, quis tempor quam vehicula. "
                    "Suspendisse in nulla id purus feugiat vestibulum.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget TwoSectionContainer() {
    return Expanded(
      child: Row(
        children: [
          leftSection(),
          rightSection(),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BlackButton() {
    return Container(
      width: double.infinity, // Takes the full width of the screen
      height: 50, // Set the height to 20
      margin: EdgeInsets.all(10.0), // Add margin
      decoration: BoxDecoration(
        color: Colors.black, // Black background color
        borderRadius: BorderRadius.circular(10.0), // Add border radius
      ),
      child: const Center(
        child: Text(
          "300 MXN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  final Color color;

  CircleWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30, // Adjust the size of the circles as needed
      height: 30,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
