import 'package:essentials/models/service_provider.dart';
import 'package:essentials/pages/list_of_services_page.dart';
import 'package:essentials/util/utilities.dart';
import 'package:flutter/material.dart';

class ServiceProviderListPage extends StatelessWidget {
  final String typeOfService;
  ServiceProviderListPage(this.typeOfService);

  void pushListOfServicesPage(
    BuildContext context,
    ServiceProvider serviceProvider,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => ListOfServicesPage(serviceProvider),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ServiceProvider> serviceProviders =
        Utilities.getServiceProviders(typeOfService);

    String stringBuilder(int index) =>
        serviceProviders[index].phone + '\n' + serviceProviders[index].email;

    Widget buildListTile(int index) => Container(
          color: Colors.blueGrey[50],
          margin: const EdgeInsets.symmetric(
            vertical: 2.5,
            horizontal: 5.0,
          ),
          child: ListTile(
            onTap: () => pushListOfServicesPage(
              context,
              serviceProviders[index],
            ),
            title: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                serviceProviders[index].name,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                ),
              ),
            ),
            trailing: Container(
              padding: const EdgeInsets.all(5.0),
              color: index == 0
                  ? Colors.lightGreen[200]
                  : index == 1 ? Colors.amber[100] : Colors.red[100],
              child: Text(
                'availability',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                  fontSize: 12.0,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                stringBuilder(index),
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2.0,
                  fontSize: 13.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.all(10.0),
          ),
        );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Theme(
        data: ThemeData(
          primaryColor: Colors.grey[900],
          accentColor: Colors.blueGrey[50],
        ),
        child: Container(
          color: Colors.black87,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    typeOfService,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 5.0,
                      fontSize: 25.0,
                    ),
                  ),
                  centerTitle: true,
                  background: Hero(
                    tag: typeOfService,
                    child: Image.asset(
                      'assets/images/$typeOfService.jpg',
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 2.5,
                  ),
                  Column(
                    children: List.generate(
                      serviceProviders.length,
                      (index) => buildListTile(index),
                    ),
                  ),
                  SizedBox(
                    height: 400.0,
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
