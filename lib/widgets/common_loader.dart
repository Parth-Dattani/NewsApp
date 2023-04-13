import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant/constant.dart';

class CommonLoader extends StatelessWidget {
  final Widget body;
  final bool isLoad;
  const CommonLoader({Key? key, required this.body, required this.isLoad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        body,
        isLoad ? const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color:
            ColorsConfig.colorLightGrey))
            : const SizedBox(),

        isLoad ? const Center(
          child:
          CupertinoActivityIndicator(
            radius: 30,
            animating: true,
            color: ColorsConfig.colorRed,
          )
          // CircularProgressIndicator(
          //   backgroundColor: ColorsConfig.colorRed,
          //   strokeWidth: 5,
          //   valueColor: AlwaysStoppedAnimation(ColorsConfig.colorLightBlue, ),
          // ),
        ) :
        Container(),
      ],
    );
  }
}



/*class CommonLoader extends StatelessWidget {
  bool? isLoad = false;
  final Widget? body;
   CommonLoader({Key? key, this.isLoad,this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:
          Stack(
              children: [
            Container(
                width: Get.width-200,
                child: Column(
                  children: <Widget>[
                    body!
                  ],)
            ),
            true ?  CircularProgressIndicator() : Container()    // true or false conditions  according loader show or hide
          ])
      );
      *//*Column(
      children: [
        isLoad!
            ? const CircularProgressIndicator(
          color: ColorsConfig.colorBlue,
        )
            : Container()
      ],
    );*//*
  }
}*/
