import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kalavarana/styles.dart';
import 'package:get/get.dart';

class ShopPage extends StatefulWidget {
  ShopPage({Key key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  CarouselController featuredCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, d) {
      if (d.maxWidth > 1000)
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 140),
          color: blue.withOpacity(0.06),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 64,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Home >> Shop",
                  style: subtitle2.copyWith(color: blue, fontSize: 22),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _carousel(context),
            ],
          ),
        );
      else
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          color: blue.withOpacity(0.06),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 21,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Home >> Shop",
                  style: subtitle2.copyWith(color: blue, fontSize: 14),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: List.generate(6, (index) => CarousalCard()),
                ),
              ))
            ],
          ),
        );
    });
  }

  Expanded _carousel(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              featuredCarouselController.previousPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
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
                items: List.generate(3, (index) => CarousalCard()),
                carouselController: featuredCarouselController,
                options: CarouselOptions(
                  aspectRatio: context.width > 800 ? 2.5 : 0.63,
                  viewportFraction: context.width > 800 ? 0.33 : 1,
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
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
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
    );
  }
}

class CarousalCard extends StatefulWidget {
  const CarousalCard({
    Key key,
  }) : super(key: key);

  @override
  _CarousalCardState createState() => _CarousalCardState();
}

class _CarousalCardState extends State<CarousalCard> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (b) {
        setState(() {
          hover = true;
        });
      },
      onExit: (b) {
        setState(() {
          hover = false;
        });
      },
      child: Container(
        height: context.width > 800 ? 600 : 260,
        width: context.width > 800 ? 380 : 170,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: context.width > 800 ? 440 : 210,
              width: context.width > 800 ? 380 : 170,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Center(child: Image.asset('assets/08.png'))),
                  Positioned.fill(
                    child: hover
                        ? Container(
                            color: Colors.white.withOpacity(0.8),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "View all  ",
                                    style: bodytext2,
                                  ),
                                  Icon(Icons.visibility),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.width > 800 ? 0 : 10,
            ),
            Container(
              height: context.width > 800 ? 50 : 30,
              width: context.width > 800 ? 340 : 170,
              decoration: BoxDecoration(
                  color: Color(0xff817365),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "Tanjore 2D Painting",
                  style: headline2.copyWith(
                      fontSize: context.width > 800 ? 24 : 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
