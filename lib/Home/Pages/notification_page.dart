import 'package:e_wallet/Auth/login/loginPage.dart';
import 'package:e_wallet/Component/headingText.dart';
import 'package:e_wallet/theme/app_pallet.dart';
import 'package:e_wallet/utils/Routes.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: Pallet.back),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notification'),
          backgroundColor: Pallet.background,
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              ...List.generate(10, (index) => Notification(type: 'receive')),
              Container(
                padding: EdgeInsets.all(20),
                child: Text('today', style: TextStyle(fontSize: 24)),
              ),
              ...List.generate(10, (index) => Notification(type: 'send')),
            ],
          ),
        ),
      ),
    );
  }
}

class Notification extends StatefulWidget {
  final bool? isNew;
  final String? type;

  const Notification({super.key, this.type, this.isNew = true});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  late bool _currentIsNew;
  late String icon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIsNew = widget.isNew ?? true;
    icon = widget.type == 'receive'
        ? 'assets/images/receive.png'
        : 'assets/images/send.png';
  }

  @override
  Widget build(BuildContext context) {
    Color color = widget.type == 'receive' ? Colors.blue : Pallet.yellow;
    String title = widget.type == 'receive'
        ? 'Transfer Success'
        : 'Receive payment';
    String subtitle = widget.type == 'receive'
        ? 'You received a payment from alex ferdinand of \u20B95000'
        : 'you have successfully sent johnatan \u20B910.00';

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),

          // color: Color(0xff5A4532),
          color: Pallet.secondaryBack,
        ),
        child: ListTile(
          style: ListTileStyle.list,
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          subtitle: Text(subtitle, style: TextStyle(fontSize: 14)),
          leading: Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Image.asset(icon, color: Colors.black),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1 hour later'),
              _currentIsNew
                  ? Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Pallet.yellow,
                        shape: BoxShape.circle,
                      ),
                    )
                  : Text(''),
            ],
          ),
          titleAlignment: ListTileTitleAlignment.titleHeight,
          textColor: Pallet.text,
          onTap: () {
            setState(() {
              _currentIsNew = false;
            });
            // Navigator.push(context,myRoute(LoginPage()));
          },
        ),
      ),
    );
  }
}
