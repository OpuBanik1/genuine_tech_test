import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:genuinetech_test/src/model/customer_model.dart';
import 'package:genuinetech_test/src/provider/customer_provider.dart';
import 'package:genuinetech_test/src/utils/constant.dart';
import 'package:genuinetech_test/widget/custom_text.dart';
import 'package:provider/provider.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({super.key});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  List<int> pageNo = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int currentIndex = 2;
  @override
  void initState() {
    Provider.of<Customer_provider>(context, listen: false)
        .getCustomerList(currentIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<CustomerModel> customerList =
        Provider.of<Customer_provider>(context).customerList;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Customer List'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(100, 5, 80, 5),
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      width: double.infinity,
                      color: const Color(0xff03045E),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: pageNo.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? Colors.white
                                      : Colors.blue,
                                  borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.all(12),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                  child: Text('${pageNo[index]}')),
                            );
                          }),
                    ),
                    Positioned(
                      top: 8,
                      left: -10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        color: Colors.blueAccent,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                currentIndex--;
                              });
                            },
                            child: Text(
                              'Previous',
                              style: myStyle(20, Colors.white),
                            )),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: -10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        color: Colors.blueAccent,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                currentIndex++;
                              });
                            },
                            child: Text(
                              'Next',
                              style: myStyle(20, Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
                customerList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      )
                    : ListView.builder(
                        itemCount: customerList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CachedNetworkImage(
                              height: 80,
                              fit: BoxFit.cover,
                              imageUrl: baseImg +
                                  customerList[index].imagePath.toString(),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            title: Text('${customerList[index].name}'),
                            subtitle: Text('${customerList[index].email}'),
                          );
                        })
                // FutureBuilder<List<CustomerModel>>(
                //     future: CustomHttp.fetchCustomer(currentIndex.toInt()),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         List<CustomerModel>? customerList = snapshot.data;
                //         return ListView.builder(
                //             physics: const NeverScrollableScrollPhysics(),
                //             itemCount: customerList!.length,
                //             shrinkWrap: true,
                //             itemBuilder: (context, index) {
                //               return ListTile(
                //                 leading: Image.network(
                //                   '$baseImg${customerList[index].imagePath}',
                //                   fit: BoxFit.cover,
                //                   height: 80,
                //                 ),
                //                 title: Text('${customerList[index].name}'),
                //                 subtitle: Text('${customerList[index].email}'),
                //               );
                //             });
                //       } else if (snapshot.connectionState ==
                //           ConnectionState.waiting) {
                //         return const Center(
                //           child: CircularProgressIndicator(),
                //         );
                //       } else if (snapshot.hasError) {
                //         return Text('${snapshot.error}');
                //       } else if (snapshot.data == null) {
                //         return const Text("No data found");
                //       }
                //       return Text('no data ');
                //     })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
