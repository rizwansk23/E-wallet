import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/Component/obscureText.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List data = ['receive', 'send', 'send'];
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Pallet.background),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('My Available Balance'),
          ),
          Gap(gap: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              spacing: 20,
              children: [
                Text(
                  obscure('shj', isVisible),
                  style: TextStyle(fontSize: 42, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                    !isVisible ? Icons.visibility : Icons.visibility_off,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Gap(gap: 30),
          _middleContainer(),
          Gap(gap: 10),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Transactions', style: TextStyle(fontSize: 18)),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
              ],
            ),
          ),
          Gap(gap: 10),
          ...List.generate(3, (index) => _recentList(data[index])),
        ],
      ),
    );
  }

  Widget _middleContainer() {
    return Container(
      padding: EdgeInsets.all(20),
      height: 280,
      decoration: BoxDecoration(
        color: Pallet.secondaryBack,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Spending'),
                H1(text: '\u20B9 20000'),
              ],
            ),
          ),
          Divider(color: Colors.grey, thickness: 0.4),
          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 100,

                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),

                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    barWidth: 3,
                    isStrokeCapRound: true,

                    color: Pallet.orange,

                    spots: const [
                      FlSpot(0, 30),
                      FlSpot(1, 45),
                      FlSpot(2, 35),
                      FlSpot(3, 60),
                      FlSpot(4, 50),
                      FlSpot(5, 70),
                      FlSpot(6, 65),
                    ],

                    dotData: FlDotData(show: false),

                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Pallet.orange.withOpacity(.35),
                          Pallet.orange.withOpacity(.05),
                        ],
                      ),
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

  Widget _recentList(String type) {
    String icon = type == 'receive'
        ? 'assets/images/receive.png'
        : 'assets/images/send.png';
    String operator = type == 'receive' ? '+' : '-';
    Color color = type == 'receive' ? Pallet.yellow : Pallet.orange;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Pallet.secondaryBack,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: ListTile(
          iconColor: Colors.white54,
          textColor: Colors.white,
          leading: Container(
            padding: EdgeInsets.all(8),
            width: 55,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: BoxBorder.all(color: Colors.white30),
              gradient: RadialGradient(
                radius: 2,
                colors: [Color(0xff3a2815), Colors.white],
              ),
            ),
            child: Image.asset(icon, color: color),
          ),
          title: Text(type, style: TextStyle(fontSize: 14, color: Pallet.text)),
          subtitle: Text('name', style: TextStyle(fontSize: 20)),
          trailing: Text(
            ' $operator \u20B9 16677',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
