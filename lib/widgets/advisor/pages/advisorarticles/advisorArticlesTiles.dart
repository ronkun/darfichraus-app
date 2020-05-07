import 'package:crimsy/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 120,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: dirShadowColor,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 25,
              child: Image.asset(image, width: 80,)
            ),
            
            Positioned(
              left: 110,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 120,
                width: MediaQuery.of(context).size.width - 175,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: dirTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),    
            Padding(
              padding: EdgeInsets.only(right: 22),
              child:  Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset("assets/images/forward.svg"),
              ),
            )                
          ],
        ),
      ),
    );
  }
}