import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalavarana/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int corousalIndex = 0;
  CarouselController featuredCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LayoutBuilder(builder: (context, d) {
            if (d.maxWidth > 1000)
              return Container(
                height: context.height * 0.87,
                color: blue,
                width: context.width,
                padding: EdgeInsets.symmetric(horizontal: 140),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: heroMainText(d.maxWidth),
                    ),
                    SizedBox(
                      width: 170,
                    ),
                    Container(
                      width: 500,
                      child: mainCarousel(),
                    )
                  ],
                ),
              );
            else
              return Container(
                height: context.height * 0.87,
                color: blue,
                width: context.width,
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 26),
                child: Column(
                  children: [
                    Container(
                      width: 250,
                      child: mainCarousel(),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Expanded(
                      child: heroMainText(d.maxWidth),
                    ),
                  ],
                ),
              );
          }),
          Container(
            height: context.width > 800 ? 750 : 400,
            padding: EdgeInsets.symmetric(
                horizontal: context.width > 800 ? 140 : 36),
            child: featuredPaintingsCaroursel(),
          )
        ],
      ),
    );
  }

  Column featuredPaintingsCaroursel() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: context.width > 800 ? 116 : 30,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Featured Paintings",
            style: context.width > 800
                ? subtitle1
                : subtitle1.copyWith(fontSize: 18),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: context.width > 800 ? 54 : 25,
        ),
        Expanded(
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  featuredCarouselController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
                child: Container(
                  height: context.width > 800 ? 78 : 25,
                  width: context.width > 800 ? 78 : 25,
                  color: Color(0xff9CA8B2),
                  child: Icon(
                    Icons.chevron_left,
                    size: context.width > 800 ? 50 : 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: CarouselSlider(
                    items: List.generate(3, (index) => carourselCardItem()),
                    carouselController: featuredCarouselController,
                    options: CarouselOptions(
                      aspectRatio: context.width > 800 ? 2.5 : 0.73,
                      viewportFraction: context.width > 800 ? 0.3 : 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      onPageChanged: (i, v) {},
                      scrollDirection: Axis.horizontal,
                    )),
              ),
              InkWell(
                onTap: () {
                  featuredCarouselController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
                child: Container(
                  height: context.width > 800 ? 78 : 25,
                  width: context.width > 800 ? 78 : 25,
                  color: Color(0xff9CA8B2),
                  child: Icon(
                    Icons.chevron_right,
                    size: context.width > 800 ? 50 : 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget carourselCardItem() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            height: context.width > 800 ? 347 : 210,
            width: context.width > 800 ? 280 : 170,
            child: Image.asset('assets/08.png')),
        SizedBox(
          height: 18,
        ),
        Text(
          "Balaji Painting",
          style: context.width > 800
              ? subtitle2
              : subtitle2.copyWith(fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "3'11'' X 3'2'",
          style: context.width > 800
              ? bodytext2
              : bodytext2.copyWith(fontSize: 14),
        ),
        Text(
          "Rs. 1,200",
          style: context.width > 800
              ? bodytext2.copyWith(fontWeight: FontWeight.bold)
              : bodytext2.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Column heroMainText(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Home For Tanjore Paintings",
          style: maxWidth > 800 ? headline1 : headline1.copyWith(fontSize: 18),
        ),
        SizedBox(
          height: maxWidth > 800 ? 60 : 36,
        ),
        Text(
          "Discover All Kalavarana Techniques",
          style: maxWidth > 800 ? headline2 : headline2.copyWith(fontSize: 12),
        ),
        SizedBox(
          height: maxWidth > 800 ? 30 : 15,
        ),
        Text(
          'A classical form of art which had developed in 16th Century Tanjore (Thanjavur) during the reign of the Marathas, this form of painting is the most popular in the southern regions of India. Embedded with semi-precious stones, exquisite glass pieces, and pearls, they add a multi-dimensional effect, further adding to their magnificence.\n Exquisite customized portrait of your loved ones, grandparents, couples, saints, murals, modern painting, corporate gifts, home decors, and more in Tanjore Painting using 22-carat original gold foil 2D and 3D embossing, semi-precious stone, antique finish, and wood frame.',
          style: maxWidth > 800 ? bodytext1 : bodytext1.copyWith(fontSize: 11),
        ),
        SizedBox(
          height: 56,
        ),
        maxWidth > 800
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: yellow,
                ),
                child: Text(
                  "Shop Now",
                  style: button,
                ),
              )
            : Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: yellow,
                  ),
                  child: Text(
                    "Shop Now",
                    style: button.copyWith(fontSize: 14),
                  ),
                ),
              )
      ],
    );
  }

  Column mainCarousel() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
            items: List.generate(
                3,
                (index) => Container(
                    height: 500,
                    width: 500,
                    child: Image.asset('assets/3.png'))),
            options: CarouselOptions(
              aspectRatio: 1.0,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (i, v) {
                setState(() {
                  corousalIndex = i;
                });
              },
              scrollDirection: Axis.horizontal,
            )),
        SizedBox(
          height: context.width > 800 ? 64 : 21,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              3,
              (index) => Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: context.width > 800 ? 13 : 6),
                    height: context.width > 800 ? 16 : 6,
                    width: context.width > 800 ? 16 : 6,
                    decoration: BoxDecoration(
                        color: corousalIndex == index
                            ? yellow
                            : yellow.withOpacity(0.6),
                        shape: BoxShape.circle),
                  )),
        )
      ],
    );
  }
}
