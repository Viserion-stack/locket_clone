// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/application/app_size.dart';
import 'package:locket_clone/features/presentation/widgets/appbar/standard_appbar.dart';
import 'package:locket_clone/features/presentation/application/application.dart';
import '../../application/app_insets.dart';
import '../../widgets/drawer/drawer.dart';
import '../login/loging_screen.dart';
import '../question/questions_screen.dart';

class LeaveFeedbackScreen extends StatefulWidget {
  static const routeName = 'LeaveFeedback_Screen';
  const LeaveFeedbackScreen({Key? key}) : super(key: key);

  @override
  _LeaveFeedbackScreenState createState() => _LeaveFeedbackScreenState();
}

class _LeaveFeedbackScreenState extends State<LeaveFeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  bool Valid = false;

  // ignore: unused_field
  String _firstName = '';
  String _email = '';
  String _message = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(),
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            stretch: true,
            expandedHeight: 150,
            elevation: 0.0,
            backgroundColor: context.themeData.appBarTheme.backgroundColor,
            leading: IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              iconSize: AppInsets.xxMedium,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: const Icon(
                  Icons.help_outline,
                ),
                iconSize: AppInsets.xxMedium,
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pushNamed(QuestionsScreen.routeName);
                },
              ),
              IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: const Icon(
                  Icons.menu,
                ),
                iconSize: AppInsets.xxMedium,
                color: Colors.black,
                onPressed: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color(0xFFF3F1EB),
              ),
              centerTitle: false,
              title: const Text(
                'Send feedback',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: AppInsets.mxMedium,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppInsets.xxMedium,
              ),
              child: Column(
                children: [
                  const Text(
                    'We\'d love to hear from you. Do you have questions? Or maybe just want to suggest something? There\'s a way to do it.',
                    style: TextStyle(
                      fontSize: AppInsets.xMedium,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: AppInsets.xxmLarge,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          key: const ValueKey('firstName'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _email = newValue!;
                          },
                          textInputAction: TextInputAction.next,
                          cursorWidth: 0.0,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: 'First Name',
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppInsets.mSmall,
                              ),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppInsets.mSmall,
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppInsets.xxMedium,
                        ),
                        TextFormField(
                          key: const ValueKey('email'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _email = newValue!;
                          },
                          textInputAction: TextInputAction.next,
                          cursorWidth: 0.0,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: 'Email',
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppInsets.mSmall,
                              ),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(AppInsets.mSmall),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppInsets.xxMedium,
                        ),
                        TextFormField(
                          key: const ValueKey('message'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your message name';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _email = newValue!;
                          },
                          onChanged: (val) {
                            final _isValid = _formKey.currentState!.validate();
                            if (_isValid) {
                              setState(() {
                                Valid = true;
                              });
                            }
                          },
                          textInputAction: TextInputAction.next,
                          cursorWidth: 0.0,
                          maxLines: AppInsets.small.toInt(),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: 'Message',
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppInsets.mSmall,
                              ),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppInsets.mSmall,
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppInsets.xxMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppInsets.xMedium,
                  ),
                  LoginScreenButton(
                    function: () {},
                    backgroundColorButton:
                        Valid ? Color(0xFFFFA142) : Colors.grey.shade400,
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Valid ? Colors.black : Colors.grey.shade500,
                        fontSize: AppInsets.xMedium,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
