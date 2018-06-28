import 'package:flutter/material.dart';

const double _mViewportFraction = 0.9;

class CarouselBody extends StatefulWidget {
  CarouselBody({Key key}) : super(key: key);

  @override
  _CarouselBodyState createState() => _CarouselBodyState();
}

class _CarouselBodyState extends State<CarouselBody> {
  final PageController _backgroundController = PageController();
  final PageController _cardController =
  PageController(viewportFraction: _mViewportFraction);
  ValueNotifier<double> selectedIndex = ValueNotifier<double>(0.0);

  bool _handleNotification(ScrollNotification notification,
      PageController leader, PageController follower) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {
      selectedIndex.value = leader.page;
      if (follower.page != leader.page) {
        follower.position.jumpToWithoutSettling(leader.position.pixels); // ignore: deprecated_member_use
      }
      setState(() {});
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /*PageView(
          controller: _backgroundController,
          children: _buildBackgroundImages(),
        ),*/
        NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            return _handleNotification(
                notification, _cardController, _backgroundController);
          },
          child: PageView(
            controller: _backgroundController,
            children: _buildBackgroundImages(),
          ),
        ),

        NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            return _handleNotification(
                notification, _cardController, _backgroundController);
          },
          child: PageView(
            controller: _cardController,
            children: _buildCards(),
          ),
        ),
      ],
    );
  }

  Iterable<Widget> _buildBackgroundImages() {
    final List<Widget> backgroundPages = <Widget>[];
    for (int index = 0; index < 10; index++) {

      var imageAsset = 'assets/images/img${index + 1}.jpg';
     // var image = Image.asset(imageAsset, fit: BoxFit.cover);


      backgroundPages.add(Container(
        width: double.infinity,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(imageAsset),
            fit: BoxFit.cover,
          ),
        ),
        child: Opacity(
          opacity: 0.3,

        ),
      ));
    }
    return backgroundPages;
  }

  final roundedCard = new Container(
    // child: image,
    decoration: new BoxDecoration(
      color: new Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );

  Iterable<Widget> _buildCards() {
    final List<Widget> pages = <Widget>[];
    double bgHeight = MediaQuery.of(context).size.height * 0.3;
    double bgWidth = MediaQuery.of(context).size.width * 0.8; // changes width of the image
    for (int index = 0; index < 10; index++) {
      var alignment = Alignment.center.add(
          Alignment((selectedIndex.value - index) * _mViewportFraction, 0.0));
      var resizeFactor =
      (1 - (((selectedIndex.value - index).abs() * 0.0).clamp(0.0, 1.0)));
      pages.add(
          Container(
            alignment: alignment,
            child: new Container(
              width: bgWidth * resizeFactor,
              height: bgHeight * resizeFactor,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return Hero(
                          tag: index,
                          child: null

                        );
                      }));
                },
                child: Hero(
                  tag: index,
                  child: roundedCard
                ),
              ),
            ),
          )
      );
    }
    return pages;
  }
}