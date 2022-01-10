import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:theme_animation_2/provider/theme_provider.dart';

void main() {
  return runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(
        ThemeData.light(),
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).getTheme,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isThemeDark = false;

  AnimationController _animationController1;
  AnimationController _animationController2;
  Animation<double> _animPart1;
  Animation<double> _animPart2;
  Animation<double> _animPart3;
  Animation<double> _animPart1Neg;
  Animation<double> _animPart2Neg;
  Animation<double> _animPart3Neg;
  Animation<double> _animOpacity1;
  Animation<double> _animOpacity2;
  Animation<double> _animOpacity3;
  Animation<double> _animOpacityNeg1;
  Animation<double> _animOpacityNeg2;
  Animation<double> _animOpacityNeg3;
  Animation<double> _animPart3LTR;

  @override
  void initState() {
    super.initState();

    _animationController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    _animationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    _animOpacity1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: Interval(0.0, 0.30, curve: Curves.linear),
      ),
    );
    _animOpacity2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: Interval(0.30, 0.50, curve: Curves.linear),
      ),
    );
    _animOpacity3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: Interval(0.70, 1.0, curve: Curves.linear),
      ),
    );

    _animOpacityNeg1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Interval(0.0, 0.30, curve: Curves.linear),
      ),
    );
    _animOpacityNeg2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Interval(0.30, 0.60, curve: Curves.linear),
      ),
    );
    _animOpacityNeg3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Interval(0.60, 1.0, curve: Curves.linear),
      ),
    );

    _animPart1 = Tween(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: Interval(0.0, 0.30, curve: Curves.linear),
      ),
    );
    _animPart2 = Tween(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: Interval(0.30, 0.60, curve: Curves.linear),
      ),
    );
    _animPart3 = Tween(begin: 20.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: Interval(0.60, 1.0, curve: Curves.linear),
      ),
    );

    _animPart3LTR = Tween(begin: -40.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: Interval(0.30, 1.0, curve: Curves.linear),
      ),
    );

    _animPart1Neg = Tween(begin: 0.0, end: 40.0).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Interval(0.0, 0.30, curve: Curves.linear),
      ),
    );
    _animPart2Neg = Tween(begin: 0.0, end: 30.0).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Interval(0.30, 0.60, curve: Curves.linear),
      ),
    );
    _animPart3Neg = Tween(begin: 0.0, end: 20.0).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Interval(0.60, 1.00, curve: Curves.linear),
      ),
    );
    _animationController1.forward();

    // _animationController1.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isThemeDark ? Color(0xff2C2C2C) : Color(0xffEAEAEA),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: AnimatedBuilder(
              animation: _animationController1,
              builder: (BuildContext context, Widget child) {
                return AnimatedBuilder(
                  animation: _animationController2,
                  builder: (BuildContext context, Widget child) {
                    _animationController1.addStatusListener((status) {
                      if (status == AnimationStatus.completed) {
                        _animationController2.forward();
                      }
                    });
                    _animationController2.addStatusListener((status) {
                      if (status == AnimationStatus.completed) {
                        _animationController1.reset();
                        _animationController2.reset();
                        _animationController1.forward();
                      }
                    });
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: Offset(
                                0.0, _animPart1.value + _animPart1Neg.value),
                            child: Opacity(
                              opacity: (_animOpacity1.value) -
                                  (_animOpacityNeg1.value),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hi John',
                                          style: TextStyle(
                                            color: isThemeDark
                                                ? Color(0xffC0CAD0)
                                                : Color(0xff545454),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'Your tasks for the day',
                                          style: TextStyle(
                                            color: Color(0xffBEC9CF),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: FlutterSwitch(
                                      activeIcon: Icon(
                                        FontAwesomeIcons.moon,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                      inactiveIcon: Icon(
                                        FontAwesomeIcons.sun,
                                        size: 12,
                                        color: Colors.yellow,
                                      ),
                                      activeColor: Color(0xff191919),
                                      activeToggleColor: Colors.black,
                                      height: 25,
                                      width: 50,
                                      value: isThemeDark,
                                      borderRadius: 30.0,
                                      onToggle: (value) {
                                        setState(() {
                                          isThemeDark = value;
                                          if (isThemeDark) {
                                            Provider.of<ThemeProvider>(context,
                                                    listen: false)
                                                .setTheme = ThemeData.dark();
                                          } else if (!isThemeDark) {
                                            Provider.of<ThemeProvider>(context,
                                                    listen: false)
                                                .setTheme = ThemeData.light();
                                          }
                                        });
                                      },
                                    ),
                                    margin: EdgeInsets.only(right: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            child: ListView.builder(
                              padding: EdgeInsets.only(
                                  left: 20, bottom: 20, top: 20),
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: 7,
                              itemBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                return Opacity(
                                  opacity: (_animOpacity1.value) -
                                      (_animOpacityNeg1.value),
                                  child: Transform.translate(
                                    offset: Offset(
                                      0.0,
                                      ((_animPart1.value * index) +
                                          (_animPart1Neg.value * index)),
                                    ),
                                    child: DayWidget(
                                      index: index + 1,
                                      isThemeDark: isThemeDark,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 5),
                          Transform.translate(
                            offset: Offset(
                                0.0, _animPart2.value + _animPart2Neg.value),
                            child: Opacity(
                              opacity: (_animOpacity2.value) -
                                  (_animOpacityNeg2.value),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                decoration: BoxDecoration(
                                  color: Color(0xffF8787B),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: isThemeDark
                                      ? [
                                          BoxShadow(
                                            color: Color(0xffF8787B)
                                                .withOpacity(0.4),
                                            blurRadius: 10,
                                            spreadRadius: 4,
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Losing Phase',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'In this phase, low-calorie diet. you',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          'will experience rapid, healthy',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          'weight loss without hunger or',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          'cravings.',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: Container(
                                        child: Image(
                                          image: AssetImage('assets/fish.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Transform.translate(
                            offset: Offset(
                              (_animPart3LTR.value * 2),
                              ((_animPart3.value * 2) +
                                  (_animPart3Neg.value * 2)),
                            ),
                            child: Opacity(
                              opacity: (_animOpacity3.value) -
                                  (_animOpacityNeg3.value),
                              child: ItemTaskWidget(
                                icon: 'assets/escala.png',
                                title: 'Measure today\'s Weight',
                                text:
                                    'It is better to log weight early in the morning for better results.',
                                isThemeDark: isThemeDark,
                                color: Color(0xff4A83D9),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(
                              (_animPart3LTR.value * 3),
                              ((_animPart3.value * 3) +
                                  (_animPart3Neg.value * 3)),
                            ),
                            child: Opacity(
                              opacity: (_animOpacity3.value) -
                                  (_animOpacityNeg3.value),
                              child: ItemTaskWidget(
                                icon: 'assets/checked.png',
                                title: 'Meal Intake for the day',
                                text:
                                    'Watching your calories is very important in your weight loss journey',
                                isThemeDark: isThemeDark,
                                color: Color(0xff2CD14B),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(
                              (_animPart3LTR.value * 4),
                              ((_animPart3.value * 4) +
                                  (_animPart3Neg.value * 4)),
                            ),
                            child: Opacity(
                              opacity: (_animOpacity3.value) -
                                  (_animOpacityNeg3.value),
                              child: ItemTaskWidget(
                                icon: 'assets/water-glass.png',
                                title: 'Had enough water today?',
                                text:
                                    'Water intake is important to get rid of toxins.',
                                isThemeDark: isThemeDark,
                                color: Color(0xff65D7FE),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(
                              (_animPart3LTR.value * 5),
                              ((_animPart3.value * 5) +
                                  (_animPart3Neg.value * 5)),
                            ),
                            child: Opacity(
                              opacity: (_animOpacity3.value) -
                                  (_animOpacityNeg3.value),
                              child: ItemTaskWidget(
                                icon: 'assets/cinta-metrica.png',
                                title: 'Body measurement for the week',
                                text:
                                    'Follow the instructions while measuring your body.',
                                isThemeDark: isThemeDark,
                                color: Color(0xffBB82FF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}

class DayWidget extends StatelessWidget {
  const DayWidget({
    Key key,
    this.isThemeDark = false,
    this.index,
  }) : super(key: key);

  final bool isThemeDark;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: isThemeDark ? Color(0xff323232) : Color(0xffababab),
            offset: Offset(
              2,
              2,
            ),
          ),
          BoxShadow(
            blurRadius: 8,
            color: isThemeDark ? Color(0xff191919) : Color(0xffEAEAEA),
            offset: Offset(
              -2,
              -2,
            ),
          ),
        ],
        gradient: LinearGradient(
          stops: [0, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isThemeDark
              ? [
                  Color(0xff2C2C2C),
                  Color(0xff2C2C2C),
                ]
              : [
                  Color(0xffc1c1c1),
                  Color(0xffffffff),
                ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            index.toString(),
            style: TextStyle(
              color: Color(0xffF8787B),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'MON',
            style: TextStyle(
              color: Color(0xffF8787B),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

class ItemTaskWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String text;
  final bool isThemeDark;
  final Color color;

  const ItemTaskWidget({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.text,
    @required this.isThemeDark,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              color: isThemeDark ? Color(0xff2C2C2C) : Color(0xfff4f4f4),
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  color: isThemeDark ? Color(0xff323232) : Color(0xffababab),
                  offset: Offset(
                    6,
                    6,
                  ),
                ),
                BoxShadow(
                  blurRadius: 12,
                  color: isThemeDark ? Color(0xff191919) : Color(0xffEAEAEA),
                  offset: Offset(
                    -6,
                    -6,
                  ),
                ),
              ],
              gradient: null,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  30,
                ),
              ),
            ),
            child: Stack(
              children: [
                if (isThemeDark)
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                Center(
                  child: Image(
                    image: AssetImage(icon),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isThemeDark ? Color(0xff2C2C2C) : Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: isThemeDark ? Color(0xff323232) : Color(0xffababab),
                    offset: Offset(
                      6,
                      6,
                    ),
                  ),
                  BoxShadow(
                    blurRadius: 12,
                    color: isThemeDark ? Color(0xff191919) : Color(0xffEAEAEA),
                    offset: Offset(
                      -6,
                      -6,
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff545454),
                    ),
                    softWrap: true,
                  ),
                  SizedBox(height: 8),
                  Text(
                    text,
                    softWrap: true,
                    style: TextStyle(
                      color: Color(0xffBEC9CF),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
