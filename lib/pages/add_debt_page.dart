import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:provider/provider.dart';
import 'package:qarz_app/model/contact_model.dart';
import 'package:qarz_app/viewmodel/add_debt_view_model.dart';
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
  var viewModel = AddDebtViewModel();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      viewModel.hourScrollController.scrollTo(
        alignment: 0.6,
        index: viewModel.hours.indexOf(viewModel.selectedHour),
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });

    super.initState();
  }

  MonthScrollToIndex() async {
    Future.delayed(Duration(milliseconds: 500), () {
      viewModel.monthScrollController.scrollTo(
          index: viewModel.selectedMonth - 1,
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
        body: ChangeNotifierProvider(
          create: (context) => viewModel,
          child: Consumer<AddDebtViewModel>(
            builder: (ctx, model, index) => Stack(
              children: [
                // UI
                SingleChildScrollView(
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
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            )),

                        SizedBox(
                          height: 30,
                        ),

                        // Debt amount
                        FadeInRight(
                          duration: Duration(milliseconds: 500),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: TextField(
                              controller: viewModel.amount,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.numberWithOptions(
                                  signed: true, decimal: true),
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                              onSubmitted: (value) =>
                                  viewModel.setDebtAmount(value),
                              onTap: () => viewModel.tapDebtAmount(),
                              inputFormatters: [ThousandsFormatter()],
                              decoration: InputDecoration(
                                  hintText: "Enter Amount",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 20),
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
                              // Text Year and month
                              FadeInRight(
                                  duration: Duration(milliseconds: 1000),
                                  child: Row(
                                    children: [
                                      Text(viewModel.months[
                                              viewModel.selectedMonth - 1] +
                                          ' ' +
                                          viewModel.selectedYear.toString()),
                                      Spacer(),
                                      IconButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          viewModel.selectViewYearsAndMonths();
                                          MonthScrollToIndex();
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down_circle_outlined,
                                          color: Colors.grey.shade700,
                                        ),
                                      )
                                    ],
                                  )),

                              viewModel.viewYearsAndMonths
                                  ? Column(
                                      children: [
                                        // Year
                                        FadeInRight(
                                            duration:
                                                Duration(milliseconds: 1000),
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 1.5,
                                                    color:
                                                        Colors.grey.shade200),
                                              ),
                                              child: ScrollablePositionedList
                                                  .builder(
                                                      itemScrollController:
                                                          viewModel
                                                              .yearScrollController,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: viewModel
                                                          .years.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return GestureDetector(
                                                          onTap: () => viewModel
                                                              .selectYear(
                                                                  index),
                                                          child:
                                                              AnimatedContainer(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: viewModel
                                                                          .selectedYear ==
                                                                      viewModel
                                                                              .years[
                                                                          index]
                                                                  ? Colors.blue
                                                                      .shade100
                                                                      .withOpacity(
                                                                          0.5)
                                                                  : Colors.blue
                                                                      .withOpacity(
                                                                          0),
                                                              border:
                                                                  Border.all(
                                                                color: viewModel
                                                                            .selectedYear ==
                                                                        viewModel.years[
                                                                            index]
                                                                    ? Colors
                                                                        .blue
                                                                    : Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0),
                                                                width: 1.5,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  viewModel
                                                                      .years[
                                                                          index]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
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
                                            duration:
                                                Duration(milliseconds: 1000),
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 1.5,
                                                    color:
                                                        Colors.grey.shade200),
                                              ),
                                              child: ScrollablePositionedList
                                                  .builder(
                                                      itemScrollController:
                                                          viewModel
                                                              .monthScrollController,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: viewModel
                                                          .months.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return GestureDetector(
                                                          onTap: () => viewModel
                                                              .selectMonth(
                                                                  index),
                                                          child:
                                                              AnimatedContainer(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: viewModel.selectedMonth -
                                                                          1 ==
                                                                      index
                                                                  ? Colors
                                                                      .orange
                                                                      .shade100
                                                                      .withOpacity(
                                                                          0.5)
                                                                  : Colors
                                                                      .orange
                                                                      .withOpacity(
                                                                          0),
                                                              border:
                                                                  Border.all(
                                                                color: viewModel.selectedMonth -
                                                                            1 ==
                                                                        index
                                                                    ? Colors
                                                                        .orange
                                                                    : Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0),
                                                                width: 1.5,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  viewModel
                                                                          .months[
                                                                              index]
                                                                          .substring(
                                                                              0,
                                                                              3) +
                                                                      '.',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
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
                                    itemCount: viewModel.days.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return FadeInDownBig(
                                          duration: Duration(milliseconds: 800),
                                          delay: Duration(
                                              milliseconds:
                                                  (1000 + index) ~/ 6),
                                          child: GestureDetector(
                                            onTap: () =>
                                                viewModel.selectDay(index),
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              width: 62,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: viewModel.selectedDay ==
                                                        viewModel.days[index][0]
                                                    ? Colors.blue.shade100
                                                        .withOpacity(0.5)
                                                    : Colors.blue
                                                        .withOpacity(0),
                                                border: Border.all(
                                                  color: viewModel
                                                              .selectedDay ==
                                                          viewModel.days[index]
                                                              [0]
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
                                                    viewModel.days[index][0]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    viewModel.days[index][1],
                                                    style:
                                                        TextStyle(fontSize: 16),
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
                                          width: 1.5,
                                          color: Colors.grey.shade200),
                                    ),
                                    child: ScrollablePositionedList.builder(
                                        itemScrollController:
                                            viewModel.hourScrollController,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: viewModel.hours.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () =>
                                                viewModel.selectHour(index),
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: viewModel.selectedHour ==
                                                        viewModel.hours[index]
                                                    ? Colors.orange.shade100
                                                        .withOpacity(0.5)
                                                    : Colors.orange
                                                        .withOpacity(0),
                                                border: Border.all(
                                                  color: viewModel
                                                              .selectedHour ==
                                                          viewModel.hours[index]
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
                                                    viewModel.hours[index],
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
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),

                        // Button : Save
                        FadeInUp(
                          duration: Duration(milliseconds: 500),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                              child: MaterialButton(
                                onPressed: () => viewModel.doAddDebt(Contact(
                                    fullname: widget.name,
                                    avatar: widget.avatar,
                                    id: "Here is the contact id.")),
                                minWidth: double.infinity,
                                height: 50,
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: TextField(
                              controller: viewModel.noteTextEditingController,
                              maxLines: 3,
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
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
                ),

                // Circular Progress Indicator
                viewModel.isLoading
                    ? Center(
                        child: CupertinoActivityIndicator(
                        radius: 40,
                      ))
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ));
  }
}
