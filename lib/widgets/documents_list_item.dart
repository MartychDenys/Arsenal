import 'package:flutter/material.dart';

class DocumentsListItem extends StatelessWidget {
  final int listNumber;
  final String description;

  DocumentsListItem(this.listNumber, this.description);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$listNumber.',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: 'HelveticaRegular',
                color: Color.fromRGBO(40, 46, 58, 1),
                height: 1.5),
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              '$description',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'HelveticaRegular',
                  color: Color.fromRGBO(96, 110, 117, 1),
                  height: 1.5),
            ),
          )
        ],
      ),
    );
  }
}
