import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AddDebtPage extends StatefulWidget {
  static final String id = 'add_debt_page';

  final String name;
  final String avatar;
  const AddDebtPage({Key? key, required this.name, required this.avatar})
      : super(key: key);

  @override
  _AddDebtPageState createState() => _AddDebtPageState();
}

class _AddDebtPageState extends State<AddDebtPage> {
  var amount = TextEditingController(text: "0.00");
  int _selectedDay = 2;
  String _selectedHour = '13:30';
  String _selectedYear = '2021';
  String _selectedMonth = 'Oct.';

  ItemScrollController _yearScrollController = ItemScrollController();
  ItemScrollController _monthScrollController = ItemScrollController();
  ItemScrollController _hourScrollController = ItemScrollController();
  bool _viewYearAndMonth = false;

  final List<String> _years = [
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
  ];

  final List<String> _months = [
    'Jan.',
    'Feb.',
    'Mar.',
    'Apr.',
    'May',
    'Jun.',
    'Jul.',
    'Aug.',
    'Sep.',
    'Oct.',
    'Nov.',
    'Dec.',
  ];

  final List<dynamic> _days = [
    [1, 'Fri'],
    [2, 'Sat'],
    [3, 'Sun'],
    [4, 'Mon'],
    [5, 'Tue'],
    [6, 'Wed'],
    [7, 'Thu'],
    [8, 'Fri'],
    [9, 'Sat'],
    [10, 'Sun'],
    [11, 'Mon'],
    [12, 'Tue'],
    [13, 'Wed'],
    [14, 'Thu'],
    [15, 'Fri'],
    [16, 'Sat'],
    [17, 'Sun'],
    [18, 'Mon'],
    [19, 'Tue'],
    [20, 'Wed'],
    [21, 'Thu'],
    [22, 'Fri'],
    [23, 'Sat'],
    [24, 'Sun'],
    [25, 'Mon'],
    [26, 'Tue'],
    [27, 'Wed'],
    [28, 'Thu'],
    [29, 'Fri'],
    [30, 'Sat'],
    [31, 'Sun']
  ];

  final List<String> _hours = <String>[
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      _hourScrollController.scrollTo(
        alignment: 0.6,
        index: _hours.indexOf(_selectedHour),
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });

    super.initState();
  }

  MonthScrollToIndex() async {
    Future.delayed(Duration(milliseconds: 500), () {
      _monthScrollController.scrollTo(
          index: _months.indexOf(_selectedMonth),
          alignment: 0.3,
          duration: Duration(seconds: 3),
          curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Add debt',
            style: TextStyle(color: Colors.black),
          ),
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),

                // Avatar
                FadeInDown(
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    width: 130,
                    height: 130,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(widget.avatar)),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // Name
                FadeInRight(
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      widget.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),

                SizedBox(
                  height: 30,
                ),

                // Debt amount
                FadeInRight(
                  duration: Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      controller: amount,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      onSubmitted: (value) {
                        setState(() {
                          amount.text = "\$" + value + ".00";
                        });
                      },
                      onTap: () {
                        setState(() {
                          if (amount.text == "0.00") {
                            amount.text = "";
                          } else {
                            amount.text =
                                amount.text.replaceAll(RegExp(r'.00'), '');
                          }
                        });
                      },
                      inputFormatters: [ThousandsFormatter()],
                      decoration: InputDecoration(
                          hintText: "Enter Amount",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                // Text: When do you ...
                FadeInRight(
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      "When do you want to repay your debt?",
                      style: TextStyle(color: Colors.grey),
                    )),

                SizedBox(
                  height: 10,
                ),

                // Text: Select Date
                FadeInLeft(
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      "Select Date and time :",
                      style: TextStyle(color: Colors.grey),
                    )),

                SizedBox(
                  height: 10,
                ),

                // Select Date time
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      // Year and month
                      FadeInRight(
                          duration: Duration(milliseconds: 1000),
                          child: Row(
                            children: [
                              Text("October 2021"),
                              Spacer(),
                              IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  setState(() {
                                    _viewYearAndMonth = true;
                                    MonthScrollToIndex();
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                  color: Colors.grey.shade700,
                                ),
                              )
                            ],
                          )),

                      _viewYearAndMonth
                          ? Column(
                              children: [
                                // Year
                                FadeInRight(
                                    duration: Duration(milliseconds: 1000),
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1.5,
                                            color: Colors.grey.shade200),
                                      ),
                                      child: ScrollablePositionedList.builder(
                                          itemScrollController:
                                              _yearScrollController,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: _years.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // select hour controller
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: _selectedYear ==
                                                          _years[index]
                                                      ? Colors.blue.shade100
                                                          .withOpacity(0.5)
                                                      : Colors.blue
                                                          .withOpacity(0),
                                                  border: Border.all(
                                                    color: _selectedYear ==
                                                            _years[index]
                                                        ? Colors.blue
                                                        : Colors.white
                                                            .withOpacity(0),
                                                    width: 1.5,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      _years[index],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    )),

                                SizedBox(
                                  height: 10,
                                ),

                                // Month
                                FadeInLeft(
                                    duration: Duration(milliseconds: 1000),
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1.5,
                                            color: Colors.grey.shade200),
                                      ),
                                      child: ScrollablePositionedList.builder(
                                          itemScrollController:
                                              _monthScrollController,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: _months.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // select hour controller
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: _selectedMonth ==
                                                          _months[index]
                                                      ? Colors.orange.shade100
                                                          .withOpacity(0.5)
                                                      : Colors.orange
                                                          .withOpacity(0),
                                                  border: Border.all(
                                                    color: _selectedMonth ==
                                                            _months[index]
                                                        ? Colors.orange
                                                        : Colors.white
                                                            .withOpacity(0),
                                                    width: 1.5,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      _months[index],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    )),
                              ],
                            )
                          : Container(),

                      SizedBox(
                        height: 10,
                      ),

                      // Day
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                              width: 1.5, color: Colors.grey.shade200),
                        ),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _days.length,
                            itemBuilder: (BuildContext context, int index) {
                              return FadeInDownBig(
                                  duration: Duration(milliseconds: 800),
                                  delay: Duration(
                                      milliseconds: (1000 + index) ~/ 6),
                                  child: GestureDetector(
                                    onTap: () {
                                      // Select day controller
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      width: 62,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: _selectedDay == _days[index][0]
                                            ? Colors.blue.shade100
                                                .withOpacity(0.5)
                                            : Colors.blue.withOpacity(0),
                                        border: Border.all(
                                          color: _selectedDay == _days[index][0]
                                              ? Colors.blue
                                              : Colors.white.withOpacity(0),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _days[index][0].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            _days[index][1],
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            }),
                      ),

                      SizedBox(height: 10),

                      // time
                      FadeInDownBig(
                          duration: Duration(milliseconds: 1000),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.5, color: Colors.grey.shade200),
                            ),
                            child: ScrollablePositionedList.builder(
                                itemScrollController: _hourScrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount: _hours.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // select hour controller
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: _selectedHour == _hours[index]
                                            ? Colors.orange.shade100
                                                .withOpacity(0.5)
                                            : Colors.orange.withOpacity(0),
                                        border: Border.all(
                                          color: _selectedHour == _hours[index]
                                              ? Colors.orange
                                              : Colors.white.withOpacity(0),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _hours[index],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),
// Button : Save
                FadeInUp(
                  duration: Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      child: MaterialButton(
                        onPressed: () {},
                        minWidth: double.infinity,
                        height: 50,
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                // note textfield
                FadeInRight(
                  duration: Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      maxLines: 3,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        hintText: "Note ...",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1.5),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ));
  }
}
