import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation> with TickerProviderStateMixin{
   
  
   late AnimationController controller;
   int itemcount = 5;
   late List<Animation<Offset>> animatedlist;
  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1500),);

  animatedlist = List.generate(itemcount, (index) => Tween<Offset>(begin: Offset(-1, 0),end: Offset.zero).animate(CurvedAnimation(parent: controller, curve: Interval(index*(1/itemcount), 1))),);


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),
      body: ListView.builder(
        itemCount: itemcount,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: animatedlist[index],
            child: ListTile(
              title: Text('Hello World, Rivaan. ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(controller.isCompleted){
            controller.reverse();
          }else{
          controller.forward();
          }
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
