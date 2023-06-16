import 'package:flutter/material.dart';

import 'get_api_model/get_api_response.dart';
import 'model/ProductList.dart';

class GetHomeScreen extends StatefulWidget {
  const GetHomeScreen({super.key});

  @override
  State<GetHomeScreen> createState() => _GetHomeScreenState();
}

ProductList? productList;

class _GetHomeScreenState extends State<GetHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<ProductList?> getData() async {
    productList = await APIResponse.getAPIData();
    setState(() {});
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get API Demo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: APIResponse.getAPIData(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  );
                } else {
                  print(snapshot.data);

                  productList = snapshot.data;

                  return ListView.builder(
                    itemCount: productList!.products!.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(productList!.products![index].title!),
                      subtitle:
                          Text(productList!.products![index].description!),
                      leading: Image.network(
                        productList!.products![index].images![0],
                        height: 150,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                      trailing:
                          Text(productList!.products![index].price.toString()),
                    ),
                  );
                }

                // print(productList);
                // return productList != null
                //     ? ListView.builder(
                //         itemCount: productList!.products!.length,
                //         itemBuilder: (context, index) => ListTile(
                //           title: Text(productList!.products![index].title!),
                //           subtitle:
                //               Text(productList!.products![index].description!),
                //           leading: Image.network(
                //             productList!.products![index].images![0],
                //             height: 150,
                //             width: 100,
                //             fit: BoxFit.fill,
                //           ),
                //           trailing: Text(
                //               productList!.products![index].price.toString()),
                //         ),
                //       )
                //     : const Align(
                //         alignment: Alignment.center,
                //         child: CircularProgressIndicator(),
                //       );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const AddDataScreen(),
          //   ),
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
