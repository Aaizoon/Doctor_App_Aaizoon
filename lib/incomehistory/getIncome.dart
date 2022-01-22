import 'package:flutter/material.dart';
import 'inClinicIncome.dart';
import 'incomeOnLine.dart';

class GetIncome extends StatefulWidget {
  @override
  _GetIncomeState createState() => _GetIncomeState();
}

class _GetIncomeState extends State<GetIncome> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          bottom: TabBar(
            tabs: [
              Tab(text: 'In Clinic Earnings'),
              Tab(
                text: 'Online Earnings',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InClinicIncome(),
            OnlineIncome()
          ],
        ),
      ),
    );
  }
}

