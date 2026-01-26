import 'package:e_wallet/Starting_page/pages.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Startpage extends StatefulWidget {
  const Startpage({super.key});

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {

  final List<Map<String,String>> data = [
    {'photo' : 'page1','heading':'Easy way to track your Financial','text':'All your financial activities will be recorded and displayed briefly and clearly'},
    {'photo' : 'page2','heading':'Set your finances for the future','text':'Features that can make it easier for you to save and plan finances in the future'},
    {'photo' : 'page3','heading':'New experience in manage money ','text':'Let get started and feel a new and fun experience in managing your finances'},
  ];

  PageController _controller = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,toolbarHeight: 20,),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
              children: data.map((item){
                return Pages(photo: item['photo']!, heading: item['heading']!, text: item['text']!);
              }).toList()
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    _controller.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Skips',
                      style: TextStyle(fontSize: 16, color: Pallet.text),
                    ),
                  ),
                ),
                SmoothPageIndicator(controller: _controller, count: data.length,effect:WormEffect(dotWidth: 7,dotHeight: 7,dotColor: Pallet.text,activeDotColor: Pallet.yellow))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40,left: 20,right: 20),
            child: Container(
              alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Pallet.yellow,
                      minimumSize: Size(double.infinity, 60)
                    ),
                    onPressed: (){
                      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    child: Text('Next',textAlign: TextAlign.center,style: TextStyle(color: Pallet.black,fontSize: 18),))),
          )
        ],
      )
    );
  }
}
