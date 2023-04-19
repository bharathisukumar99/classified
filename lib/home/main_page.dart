import 'package:classified/home/models/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: [
        GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 20),
              shrinkWrap: true,
              itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/images/${items[index].assets}.svg',height: height/10,),
                  Flexible(child: Text(items[index].name,maxLines: 2,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600),))
                ],
              ),
            );
          },
        )
      ],
    ));
  }
}
