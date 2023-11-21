import 'package:flutter/cupertino.dart';

import '../../../Widgets/Bookings_Widget.dart';

class CancelledBookings extends StatelessWidget {
  const CancelledBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: 3, // Number of items in your list
              itemBuilder: (BuildContext context, int index) {
                // Return a widget for each item at the specified index
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Bookings_Widget(isupcoming: false, iscompleted: false, iscancelled: true,),
                );
              },
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.1,)

      ],
    );
  }
}
