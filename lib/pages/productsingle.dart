import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class productsingle extends StatelessWidget {
  const productsingle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          // Container with 150px height and fullscreen width after the appBar, with an image
          fullscreenContainer(context),
          twoSectionContainer(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Represent',
        style: TextStyle(
            color: Colors.black, fontSize: 22, fontFamily: 'fightt3_'),
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
              borderRadius: BorderRadius.circular(10)),
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
                borderRadius: BorderRadius.circular(10)),
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

  // Image in the fullscreen container
  Image fullscreenImage() {
    return Image.asset(
      '../assets/images/sneaker.jpg',
      fit: BoxFit.cover,
    );
  }

  Container fullscreenContainer(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: fullscreenImage(),
    );
  }

  Expanded twoSectionContainer() {
    return Expanded(
      child: Row(
        children: [
          // Left section with a fixed width of 40px containing two vertical sections
          Container(
            width: 40,
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
          // Right section takes up the remaining space
          Expanded(
            child: Container(
              color: Colors.blue,
              // Add your content for the right section here
            ),
          ),
        ],
      ),
    );
  }
}
