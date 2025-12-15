import 'package:flutter/material.dart';
import 'package:flutter_basics_c17/ui/utils/app_assets.dart';





class XoButton extends StatelessWidget {
  final String symbol;
  final Function onClick;
  final int index;

   XoButton({required this.symbol, required this.onClick, required this.index});

  @override
  Widget build(BuildContext context) {
    String image;
    if(symbol == "x"){
      image = AppAssets.icX;
    }else {
      image = AppAssets.icO;
    }
    
    return Expanded(
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.all(8),
        child: InkWell(
          onTap: (){
            onClick(index);
          },
          child: symbol.isEmpty
              ? Container()
              : Image.asset( image),
        ),
      ),
    );
  }
}
