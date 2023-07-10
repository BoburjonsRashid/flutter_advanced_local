import 'package:flutter/material.dart';
import 'package:flutter_advanced/pages/employeeInfoPage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../service/http_service.dart';
import '../service/log_service..dart';
import '../service/model/emp_response.dart';

class NetworkPage extends StatefulWidget {
  static const String id = "/network_page";
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  var isLoading = false;
  EmpResponse? items;

  @override
  void initState() {
    super.initState();
    _apiPostList();
  }

  void _apiPostList() async {
    setState(() {
      isLoading = true;
    });
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
      setState(() {});
    }

    setState(() {
      isLoading = false;
    });
    print(response);
  }

  void _apiPostGet(Employee tost) {
    Network.POST(Network.API_GET, Network.paramsEmpty()).then((response) => {});
  }

  void _apiPostCreate(EmpResponse tost) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(tost))
        .then((response) => {
              _apiPostList(),
            });
  }

  void _apiPostUpdate(EmpResponse tost) {
    Network.PUT(Network.API_UPDATE + tost.status.toString(),
            Network.paramsUpdate(tost))
        .then((response) => {
              LogService.i(response.toString()),
            });
  }

  void _apiPostDelete(Employee? tost) {
    Network.DEL(Network.API_DELETE + (tost?.id?.toString() ?? ""),
            Network.paramsEmpty())
        .then((response) => {_apiPostList(), print(response)});
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Networking'),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: items?.data?.length,
              itemBuilder: (ctx, index) {
                return itemHomePost(items?.data?[index]);
              },
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink(),
          ],
        ));
  }

  Widget itemHomePost(Employee? tost) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              _apiPostDelete(tost);
            },
            flex: 3,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "Delete",
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EmployeeInfoPage(name: tost?.employeeName ?? "");
          }));
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tost?.employeeAge.toString() ?? "",
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ), // SizedBox
              Text(tost?.employeeName ?? '')
            ],
          ),
        ),
      ),
    );
  }
}
