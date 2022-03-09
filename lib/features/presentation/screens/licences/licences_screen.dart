// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/application/app_theme.dart';

import 'dummy_data/dummy_data.dart';

class LicencesScreen extends StatelessWidget {
  static const routeName = '/Licences-Screen';
  const LicencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          'Licences',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                height: 70,
                width: 70,
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/splash_screen.png',
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              const Text(
                'Powered by Flutter',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return MyListTile(
                    title: licences[index].licenceTitle,
                    subtitle: licences[index].numberLicences,
                  );
                },
                itemCount: licences.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  String? title;
  String? subtitle;

  MyListTile({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle!),
    );
  }
}
