import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:practice_app/success.dart';

class OfficeWork extends StatefulWidget {
  const OfficeWork({super.key});

  @override
  State<OfficeWork> createState() => _OfficeWorkState();
}

class _OfficeWorkState extends State<OfficeWork> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Office work")),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Stack(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Success(index: index + 1),
                              ));
                        },
                        child: Container(
                          height: 80,
                          width: mq.width * .74,
                          margin: const EdgeInsets.only(left: 37, top: 10),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('                       data'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('                       data')
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: IconButton(
                                          padding:
                                              const EdgeInsets.only(bottom: 2),
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.play_arrow,
                                            size: 20,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('data')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_vert))
                    ],
                  ),
                  const CircleAvatar(
                    radius: 47,
                    backgroundColor: Colors.red,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
