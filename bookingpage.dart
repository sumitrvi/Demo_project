import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:project/Widgets/customuserappbar.dart';
import 'package:project/modalclasses/CalendarBookEventShow.dart';
import 'package:project/modalclasses/calendarPageModal.dart';
import 'package:project/utils/comman.dart';
import 'package:project/utils/constants.dart';
import 'package:project/utils/dimention.dart';
import 'package:project/utils/range_picker_page.dart';
import 'package:project/utils/theme.dart';
import 'package:provider/provider.dart';

import 'card_layout_screen.dart';

class BookingPage extends StatefulWidget {
  var bookingData;
  String startDate, endDate, adultCount, childCount;
  String selectEndDate = '', selectStartDate = '';
  DateTime yearMonth, dateTimeSel;
  String yearVal, monthVal;

  BookingPage({
    this.bookingData,
    this.startDate,
    this.endDate,
    this.childCount,
    this.adultCount,
  });

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<DateTime> datePicker = [];
  int adultCounter = 0, childCounter = 0;

  // static var unavailableDates = ["2021-01-4", "2021-01-20", "2021-01-13","2021-01-21","2021-01-23"];
  /*List<DateTime> unavailableDates = [];*/
  static var unavailableDatesVal = [];
  String Dates;

  static DateTime initialDate = DateTime.now();
  static DateFormat dateFormat = new DateFormat("yyyy-MM-dd");
  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  DateTime fromStringDate;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getApiCall();
    /* unavailableDates.addAll(
        Provider.of<CalendarBookShow>(context, listen: true).eventDates);*/
    super.didChangeDependencies();
  }

  var _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //Custom appbar
    var appBar = CustomAppBar(
      toolbarColor: Colors.white,
      isBackBtn: true,
      title: Constants.pad_booking,
      isShownFilter: false,
      isShowMcplogo: false,
      resetBtn: true,
    );

    //Build method
    return Scaffold(
      key: _scafoldKey,
      appBar: appBar,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: Comman.displaySize(context).height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top -
              Dimentions.bottomNavHeight,
          width: Comman.displaySize(context).width,
          child: LayoutBuilder(builder: (context, constrains) {
            return SingleChildScrollView(
              child: Consumer<CalendarBookShow>(
                builder: (context, modal, child) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isLoading
                          ? RangePickerPage(
                              selectedDates: selectedDates,
                              dateDisable: _isSelectableCustom,
                            )
                          : Container(
                              height: constrains.maxHeight * 0.6,
                              child:
                                  Center(child: CircularProgressIndicator())),
                      _dateGuest(constrains),
                      Comman.sizeBoxheight(40),
                    ],
                  );
                },
              ),
            );
          }),
        ),
      ),
      bottomSheet: _bottomnextBtton(context),
    );
  }

  List<DateTime> presentDates = [];

  // Dates and Guests  items

  void getApiCall() async {
    try{
      await Provider.of<CalendarBookShow>(context, listen: false)
          .getAvailPads(widget.bookingData['pad_id'],
          DateTime.now().year.toString(), _scafoldKey)
          .then((value) => {
        if (mounted)
          {
            setState(() {
              isLoading =true;
            })
          }
      });
    }catch(e){
      print(e);
      setState(() {
        isLoading =true;
      });
    }
   /* .catchError(() {
    setState(() {
    isLoading =true;
    });*/

  }

  /*void onChange(dateTime)  async{
    unavailableDates =  new List();
    widget.yearMonth = dateTime;
    var date = DateTime.parse(widget.yearMonth.toString());
    widget.yearVal = "${date.year}";
    widget.monthVal = "${date.month}";
   await Provider.of<CalendarBookShow>(context, listen: false).getAvailPads(
        widget.bookingData['pad_id'],
        widget.yearVal,
       "",
        _scafoldKey);
    unavailableDates.addAll(Provider.of<CalendarBookShow>(context,listen: false)
        .eventDates);
    if(mounted)
      {
        setState(() {

        });
      }



  }*/

/*  String sanitizeDateTime(DateTime dateTime) =>
      "${dateTime.year}-${dateTime.month}-${dateTime.day}";*/

  bool _isSelectableCustom(DateTime day) {
    /*String formattedDate = dateFormat.format(initialDate);
     unavailableDates.sort(((a, b) => a.compareTo(b)));


    for(var unavdate in unavailableDates){
      if (unavdate.compareTo(formattedDate) == 0) {
        formattedDate = unavdate;
        fromStringDate = DateTime.parse(formattedDate);
        initialDate = fromStringDate.add(new Duration(days: 1));
        formattedDate = dateFormat.format(initialDate);


      }
    }*/

    // Dates = dateFormat.format(day);

    Provider.of<CalendarBookShow>(context, listen: false)
        .eventDates
        .sort(((a, b) => a.compareTo(b)));
    return !Provider.of<CalendarBookShow>(context, listen: false)
        .eventDates
        .contains(day);
  }

  _dateGuest(BoxConstraints constraints) {
    return Container(
      height: constraints.maxHeight * 0.45,
      width: constraints.maxWidth * 1.0,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    Constants.dates,
                    style: _textStyle1(context),
                  ),
                ),
                Comman.sizeBoxheight(15.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.selectStartDate.toString() != null &&
                              widget.selectStartDate.toString() != ''
                          ? Text(
                              "Check-in Date\n" +
                                  DateFormat.yMMMd().format(
                                      DateTime.parse(widget.selectStartDate)),
                              style: _textStyle2(context),
                            )
                          : Text("Check-in Date ", style: _textStyle2(context)),
                      widget.selectEndDate.toString() != null &&
                              widget.selectEndDate.toString() != ''
                          ? Text(
                              "Check-out Date\n" +
                                  DateFormat.yMMMd().format(
                                      DateTime.parse(widget.selectEndDate)),
                              style: _textStyle2(context),
                            )
                          : Text("Check-out Date ",
                              style: _textStyle2(context)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Comman.sizeBoxheight(10),
          Comman.divider(Colors.black, 0.3),
          Comman.sizeBoxheight(10),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      Constants.Guests,
                      style: _textStyle1(context),
                    ),
                  ),
                ),
                Comman.sizeBoxheight(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Constants.adults,
                          style: _textStyle2(context),
                        ),
                        Comman.sizeBoxheight(10),
                        Container(
                          height: constraints.maxHeight * 0.065,
                          width: constraints.maxWidth * 0.32,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0.16)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  size: 16.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (this.adultCounter > 1) {
                                      this.adultCounter--;
                                    }
                                  });
                                },
                              ),
                              FittedBox(child: Text(adultCounter.toString())),
                              IconButton(
                                icon: Icon(Icons.add, size: 16.0),
                                onPressed: () {
                                  setState(() {
                                    if (this.adultCounter < 10) {
                                      this.adultCounter++;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Comman.sizeBoxwidth(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Constants.children,
                          style: _textStyle2(context),
                        ),
                        Comman.sizeBoxheight(10),
                        Container(
                          height: constraints.maxHeight * 0.065,
                          width: constraints.maxWidth * 0.32,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0.16)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  size: 16.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (this.childCounter > 0) {
                                      this.childCounter--;
                                    }
                                  });
                                },
                              ),
                              Flexible(child: Text(childCounter.toString())),
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 16.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (this.childCounter < 10) {
                                      this.childCounter++;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // BottomSheet Next Button
  _bottomnextBtton(BuildContext ctx) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
        child: MaterialButton(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Color.fromRGBO(24, 38, 43, 1),
          padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
          onPressed: () async {
            if (widget.selectEndDate == '' && widget.selectStartDate == '') {
              /*Comman.showSnakbar(Constants.selectstartendDate,
                  context, Colors.red);*/
              Comman.show_dialog(context, Constants.selectstartendDate);
            } else if (DateTime.parse(widget.selectEndDate)
                .isBefore(DateTime.parse(widget.selectStartDate))) {
              Comman.showSnakBarwithkey(
                  Constants.endDategrether, _scafoldKey, Colors.red);
            } else if (adultCounter.toString() == '0') {
              Comman.show_dialog(context, Constants.adultblk);
            } else {
              showModalBottomSheet(
                  context: ctx,
                  builder: (BuildContext context) {
                    return CardLayout(data: {
                      'padId': widget.bookingData['pad_id'],
                      'priceAmount': widget.bookingData['price_amount'],
                      'Taxamount': '20',
                      'startDate': widget.selectStartDate,
                      'endDate': widget.selectEndDate,
                      'childCount': childCounter.toString(),
                      'adultCount': adultCounter.toString(),
                    });
                  });
            }
          },
          child: Text(
            Constants.next_button_text,
            style: TextStyle(
              fontFamily: FontFamily.HelveticaNew,
              fontWeight: FontWeight.w400,
              fontSize: MediaQuery.of(context).size.height * 0.04,
              color: Colors.white,
            ),
          ),
        ));
  }

  //text style
  _textStyle1(BuildContext context) {
    return TextStyle(
        fontSize: Comman.displayWidth(context) * 0.050,
        fontFamily: FontFamily.HelveticaNew,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  _textStyle2(BuildContext context) {
    return TextStyle(
        fontSize: Comman.displayWidth(context) * 0.045,
        fontFamily: FontFamily.HelveticaNew,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  void selectedDates(startDate, endDate) {
    setState(() {
      widget.selectEndDate = endDate;
      widget.selectStartDate = startDate;
    });
    print('selected start date ${startDate}');
    print('selected end date ${endDate}');
  }
}
