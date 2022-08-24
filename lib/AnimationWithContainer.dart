import 'package:flutter/material.dart';

class AnimationWithContainer extends StatefulWidget {
  const AnimationWithContainer({Key? key}) : super(key: key);

  @override
  State<AnimationWithContainer> createState() => _AnimationWithContainerState();
}

class _AnimationWithContainerState extends State<AnimationWithContainer> {
  Tween<double> _scaleTween = Tween<double>(begin: 1, end: 2);
  double _width = 200;
  double _height = 200;

  _updateState(){
    setState((){
      _width = 400;
      _height = 400;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    _updateState();
                  },
                  child: Text("Click Me")),
              AnimatedContainer(
                duration: Duration(milliseconds: 800),
                curve: Curves.bounceInOut,
                width: _width,
                height: _height,
                color: Colors.amber,
                child: Center(child: Text("Animation", style:  Theme.of(context).textTheme.headline5,)),

              ),
              TweenAnimationBuilder(
                  tween: _scaleTween,
                  duration: const Duration(milliseconds: 800),
                  builder: (context, scale, child){
                    return Transform.scale(scale: 10.0, child: const Text("Sample"),);
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
