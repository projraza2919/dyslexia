import 'package:flutter/material.dart';
class ObjectCard extends StatefulWidget {
  const ObjectCard({Key? key,required this.height,required this.width, required this.image, required this.content}) : super(key: key);
  final double height;
  final double width;
  final String image;
  final String content;
  @override
  State<ObjectCard> createState() => _ObjectCardState();
}

class _ObjectCardState extends State<ObjectCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Column(
          children: [
            Container(
              height: widget.height*0.6,
              width: widget.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.fitHeight,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: widget.height*0.4,
              width: widget.width,
              child: Text(widget.content, overflow: TextOverflow.ellipsis,),
            )
          ],
        ),
      ),
    );
  }
}
