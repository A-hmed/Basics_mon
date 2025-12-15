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
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: InkWell(
          onTap: (){
            onClick(index);
          },
          child: symbol.isEmpty
              ? Container(height: 20, width: 20,)
              : Image.asset( image),
        ),
      ),
    );
  }
}
