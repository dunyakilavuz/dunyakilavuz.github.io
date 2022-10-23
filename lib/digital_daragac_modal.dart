import 'package:flutter/material.dart';

Widget digitalDaragacModal()
{
    return Container
    (
        color: Colors.amber,
        child: Padding
        (
            padding: const EdgeInsets.all(20.0),
            child: Column
            (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                    RichText
                    (
                        textAlign: TextAlign.justify,
                        text: const TextSpan
                        (
                            text:"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
                            style: TextStyle
                            (
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black,
                                wordSpacing: 1
                            ),
                        ),
                    ),
                ],
            ),
        ),
    );
}