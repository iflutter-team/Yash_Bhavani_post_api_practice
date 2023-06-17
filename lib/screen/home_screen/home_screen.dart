import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http_service/get_api_response.dart';
import '../../model/ProductList.dart';

class GetHomeScreen extends StatefulWidget {
  const GetHomeScreen({super.key});

  @override
  State<GetHomeScreen> createState() => _GetHomeScreenState();
}

ProductList? productList;

class _GetHomeScreenState extends State<GetHomeScreen> {
  SharedPreferences? preferences;

  Future<void> setPref() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPref();
  }

  Future<ProductList?> getData() async {
    productList = await APIResponse.getHomeAPIData();
    setState(() {});
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get API Demo'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              preferences!.clear();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: APIResponse.getHomeAPIData(),
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
