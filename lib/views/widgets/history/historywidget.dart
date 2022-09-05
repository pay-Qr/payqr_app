import 'package:flutter/material.dart';

import '../../../data/datasource/data.dart';

class AppHistoryPage extends StatelessWidget {
  const AppHistoryPage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(
            left: 25, right: 12, top: 10),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'History',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              '35500DA',
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
                  title: Text(data[index].place),
                  subtitle: Text(
                      '${data[index].time.day}/${data[index].time.month}/${data[index].time.year}'),
                  trailing: Text(
                      '${data[index].price} DA'),
                  leading: CircleAvatar(
                    maxRadius: 25,
                    backgroundColor:
                        data[index].color,
                    child: Icon(
                      data[index].icon,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                );
              })))
    ]));
  }
}
