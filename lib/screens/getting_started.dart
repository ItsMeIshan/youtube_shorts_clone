import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_shorts_clone/utils/image_constants.dart';
import 'package:youtube_shorts_clone/widgets/gradient_text.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Flexible(
        child: Image.asset(ImageConstants.loginDecoration, height: 200, width: 210,)),
        SizedBox(height: 40,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('WELCOME TO',  style: Theme.of(context).textTheme.displaySmall,),
            GradientText('YOUTUBE SHORTS',gradient: const LinearGradient(colors: [Color(
                0xff7f3bec),Color(0xd39a65ea),Color(0xffcaacf9) ]), style: Theme.of(context).textTheme.displayMedium,),
            SizedBox(height: 12,),
        Text('Better experience than ever, new and Improved with exciting amount of content!', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: 40,),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(side: BorderSide(color:Color(0xffcaacf9)), shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),),
              onPressed: () {
                Navigator.of(context).pushNamed('/videos');
              },
              child:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                child: Text('Get Started 🎉', style: Theme.of(context).textTheme.titleLarge,),
              )),
        ),
        ],
      ),
      ),
    );
  }
}
