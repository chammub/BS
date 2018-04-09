import 'package:bhavani_shoppe/about/about_home.dart';
import 'package:bhavani_shoppe/common/gradient_colors.dart';
import 'package:bhavani_shoppe/common/text_style.dart';
import 'package:bhavani_shoppe/food/food_menu_home.dart';
import 'package:bhavani_shoppe/model/homeGrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // 1.0 is normal animation speed.
    return new Scaffold(
        body: new Container(
            decoration:
                new BoxDecoration(gradient: GradientColors.homeScreenGradient),
            child: new Column(children: <Widget>[
              new HomeGradientAppBar(),
              new BuildBodyContent('CHITTOOR', true),
              new BuildBodyContent('SELECT YOUR FAVORITE CATEGORY', false),
              new HomePageBody()
            ])));
  }
}

class HomeGradientAppBar extends StatelessWidget {
  final double barHeight = 165.0;
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
        padding: new EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + barHeight,
        child: new Row(children: <Widget>[
          new Container(
              child: new Hero(
                  tag: "logo-hero",
                  child: new Center(
                    child: new Image.asset(
                      'res/images/ic_logo.png',
                      height: 90.0,
                      width: 120.0,
                      fit: BoxFit.contain,
                    ),
                  ))),
          new Container(
              margin: const EdgeInsets.only(top: 25.0),
              child: new Image.asset('res/images/ic_logo_text.png',
                  height: 100.0,
                  // width: 90.0,
                  fit: BoxFit.contain))
        ]));
  }
}

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new Container(
            child: new CustomScrollView(
                scrollDirection: Axis.vertical,
                shrinkWrap: false,
                slivers: <Widget>[
          new SliverPadding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              sliver: new SliverGrid(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 1.1,
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 2.0),
                  delegate: new SliverChildBuilderDelegate(
                      (context, index) =>
                          new HomeGridBuilder(homeGridList[index]),
                      childCount: homeGridList.length)))
        ])));
  }
}

class HomeGridBuilder extends StatefulWidget {
  final HomeGrid homeGrid;
  HomeGridBuilder(this.homeGrid, {Key key}) : super(key: key);

  @override
  _HomeGridBuilderState createState() => new _HomeGridBuilderState();
}

class _HomeGridBuilderState extends State<HomeGridBuilder>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animationBounceOut;
  var aGradients;
  var aMenuActions;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = new AnimationController(
        duration: new Duration(milliseconds: 50), vsync: this);

    animationBounceOut = new CurvedAnimation(
        parent: animationController, curve: Curves.elasticInOut)
      ..addListener(() => this.setState(() {}))
      ..addStatusListener((AnimationStatus status) {});

    animationController.repeat(
        min: 0.6, max: 1.0, period: new Duration(seconds: 1));

    // gradient
    aGradients = [
      GradientColors.blueGradient,
      GradientColors.redGradient,
      GradientColors.orangeGradient,
      GradientColors.purpleGradient,
    ];
  }

  @override
  Widget build(BuildContext context) {
    var navPage;
    var navPageAction;
    switch (widget.homeGrid.name) {
      case "FOOD":
        navPage = new FoodHomePage();
        break;
      case "TEXTILE":
        navPage = null;
        break;
      case "MATTRESS":
        navPage = null;
        break;
      case "ABOUT":
        navPage = new AboutHomePage();
        break;
    }

    if (navPage != null) {
      navPageAction = () => Navigator.of(context).push(
            new PageRouteBuilder(
              pageBuilder: (_, __, ___) => navPage,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      new FadeTransition(opacity: animation, child: child),
            ),
          );
    } else {
      navPageAction = () => Scaffold
          .of(context)
          .showSnackBar(new SnackBar(content: new Text("Coming Soon!")));
    }

    return new GestureDetector(
        onTap: navPageAction,
        child: new Container(
          margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                new BoxShadow(
                    color: Colors.black38,
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    offset: new Offset(0.0, 1.0)),
              ],
              gradient: aGradients[widget.homeGrid.count]),
          child: new Stack(
            children: <Widget>[
              new Opacity(
                  opacity: 0.8,
                  child: new Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(top: 25.0),
                      child: new Image.asset(
                          "res/images/" + widget.homeGrid.icon,
                          height: animationBounceOut.value * 65.0,
                          width: animationBounceOut.value * 65.0,
                          color: Colors.white))),
              new Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 35.0),
                child:
                    new Text(widget.homeGrid.name, style: Style.titleTextStyle),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class BuildBodyContent extends StatelessWidget {
  final String title;
  final bool iconVisibility;

  BuildBodyContent(this.title, this.iconVisibility);

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 5.0),
        // color: Colors.yellowAccent,
        child: new Row(children: <Widget>[
          new Text(title, style: Style.homeContentTextStyle),
          iconVisibility
              ? new Container(
                  margin: const EdgeInsets.only(left: 3.0, bottom: 3.0),
                  child: new Icon(Icons.place, color: Colors.red))
              : new Container()
        ]));
  }
}
