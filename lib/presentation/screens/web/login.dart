import 'dart:async';

import "package:flutter/material.dart";
import 'package:truehands/presentation/widgets/main_widgets.dart';
import 'package:flutter/gestures.dart';

class WebLogin extends StatelessWidget {
  WebLogin({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<String> imageUrls = [
    'assets/images/web_login_image1.png',
    'assets/images/web_login_image2.png',
    'assets/images/web_login_image3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
    child: Container(
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/images/background.jpg'),
    fit: BoxFit.cover,
    ),
    ),
    child: Padding(
    padding: const EdgeInsets.all(50),
    child: Container(
    decoration: BoxDecoration(
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 5,
    blurRadius: 7,
    offset: Offset(0, 3), // changes position of shadow
    ),
    ],
    ),
    child: Row(
    children: [
    Expanded(
    child: Container(
    color: Colors.white,
    child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ImageCarousel(
            imageUrls: imageUrls,
            height: 350.0,
          ),
        ),
      ],
    )
    ),
    ),
    ),
    Expanded(
    child: Container(
    decoration: const BoxDecoration(
    gradient: LinearGradient(
    colors: [Color(0xFF00b2f0), Color(0xFF00559e)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    ),
    padding: const EdgeInsets.all(32),
    child: Form(
    key: _formKey,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    commonBoldText(text: 'Welcome Back!...', color: Colors.white, fontSize: 24, textAlign: TextAlign.center),
    SizedBox(height: 32),
    PrimaryInputText(
    controller: _usernameController,
    hintText: 'Enter User Name',
    onValidate: (value){
    if (value == null || value.isEmpty) {
    return 'Please enter the UserName';
    }
    return null;
    },
    ),
    SizedBox(height: 16),
    PrimaryInputText(
    controller: _passwordController,
    hintText: 'Enter Password',
    onValidate: (value){
    if (value == null || value.isEmpty) {
    return 'Please enter the Password';
    }
    return null;
    },
    ),
    SizedBox(height: 24),
    fullIconColorButton(title: 'Login', textColor: Colors.black, buttonColor: Colors.white60, context: context, onPressed: (){
    if (_formKey.currentState!.validate()) {
    final username = _usernameController.text;
    final password = _passwordController.text;
    }
    })
    ],
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    ),
    ),
    );
  }
}


class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final Duration autoplayInterval;
  final bool enableAutoplay;

  const ImageCarousel({
    Key? key,
    required this.imageUrls,
    this.height = 200.0,
    this.autoplayInterval = const Duration(seconds: 3),
    this.enableAutoplay = true,
  }) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage = 0;
  late PageController _pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if (widget.enableAutoplay) {
      _startAutoplay();
    }
  }

  void _startAutoplay() {
    _timer = Timer.periodic(widget.autoplayInterval, (Timer timer) {
      if (_currentPage < widget.imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imageUrls.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.imageUrls[index],
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text('Failed to load image'));
                  },
                );
              },
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imageUrls.length,
                (index) => buildDotIndicator(index),
          ),
        ),
      ],
    );
  }

  Widget buildDotIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
