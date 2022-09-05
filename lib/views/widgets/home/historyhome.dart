import 'package:flutter/material.dart';

import '../../../data/datasource/data.dart';

class AppHistoryHome extends StatelessWidget {
  const AppHistoryHome({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30))),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Today',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                '2500DA',
                style: TextStyle(fontSize: 22),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title:
                        Text(data[index].place),
                    subtitle: Text(
                        '${data[index].time.hour}:${data[index].time.minute}'),
                    trailing: Text(
                        '${data[index].price} DA'),
                    leading: CircleAvatar(
                      backgroundColor:
                          data[index].color,
                      child: Icon(
                        data[index].icon,
                        color: Colors.white,
                      ),
                    ),
                  );
                })))
      ]),
    ));
  }
}
