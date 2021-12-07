import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:qarz_app/model/debt_model.dart';
import 'package:qarz_app/values/user_avatars.dart';

// ignore: non_constant_identifier_names
Widget DebtListViews(List<Debt> debtList) {
  // Sort debList
  debtList.sort((a, b) {
    var adate = DateTime.parse(a.datetime);
    var bdate = DateTime.parse(b.datetime);
    return -bdate.compareTo(adate);
  });

  // DebtList
  return GroupedListView<dynamic, String>(
    elements: debtList,
    // grouped by date
    groupBy: (element) =>
        element.datetime.substring(0, 4) +
        '.' +
        element.datetime.substring(5, 7),

    // Header
    groupSeparatorBuilder: (String groupByValue) => Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            getMonthName(groupByValue),
            style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ]),
        SizedBox(
          height: 10,
        ),
      ],
    ),

    // Items
    itemBuilder: (context, dynamic element) => Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Avatar
              Image.asset(
                userAvatars[int.parse(element.avatar)],
                height: 50,
                width: 50,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Fullname
                  Text(
                    element.fullname,
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  // DateTime
                  Text(
                    element.datetime.substring(8, 10) +
                        '.' +
                        element.datetime.substring(5, 7) +
                        '   ' +
                        element.datetime.substring(11, 16),
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),

          // Sum debt
          Text(
            '\$' + element.sum,
            style: TextStyle(
                color: element.gave == 'false'
                    ? Colors.grey.shade800
                    : Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    ),
    itemComparator: (item1, item2) =>
        item1.fullname.compareTo(item2.fullname), // optional
    useStickyGroupSeparators: false, // optional
    floatingHeader: true, // optional
    order: GroupedListOrder.ASC,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.only(top: 20), // optional
  );
}

String getMonthName(String datetime) {
  String result = 'unknown';

  switch (datetime.substring(5, 7)) {
    case '01':
      result = 'Yanvar, ' + datetime.substring(0, 4);
      break;
    case '02':
      result = 'Fevral, ' + datetime.substring(0, 4);
      break;
    case '03':
      result = 'Mart, ' + datetime.substring(0, 4);
      break;
    case '04':
      result = 'Aprel, ' + datetime.substring(0, 4);
      break;
    case '05':
      result = 'May, ' + datetime.substring(0, 4);
      break;
    case '06':
      result = 'Iyun, ' + datetime.substring(0, 4);
      break;
    case '07':
      result = 'Iyul, ' + datetime.substring(0, 4);
      break;
    case '08':
      result = 'Avgust, ' + datetime.substring(0, 4);
      break;
    case '09':
      result = 'Sentabr, ' + datetime.substring(0, 4);
      break;
    case '10':
      result = 'Oktabr, ' + datetime.substring(0, 4);
      break;
    case '11':
      result = 'Noyabr, ' + datetime.substring(0, 4);
      break;
    case '12':
      result = 'Dekabr, ' + datetime.substring(0, 4);
      break;
    default:
      result = 'Unknown';
  }

  return result;
}
