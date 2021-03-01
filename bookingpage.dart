{\rtf1\ansi\ansicpg1252\cocoartf2509
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica-Bold;\f1\fswiss\fcharset0 Helvetica;\f2\fswiss\fcharset0 Helvetica-Oblique;
\f3\fswiss\fcharset0 Helvetica-BoldOblique;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue109;\red15\green112\blue3;\red82\green0\blue103;
\red109\green111\blue5;\red30\green128\blue240;\red0\green0\blue254;\red109\green109\blue109;\red11\green93\blue177;
}
{\*\expandedcolortbl;;\csgenericrgb\c0\c0\c42745;\csgenericrgb\c5882\c43922\c1176;\csgenericrgb\c32157\c0\c40392;
\csgenericrgb\c42745\c43529\c1961;\csgenericrgb\c11765\c50196\c94118;\csgenericrgb\c0\c0\c99608;\csgenericrgb\c42745\c42745\c42745;\csgenericrgb\c4314\c36471\c69412;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww24940\viewh13400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\b\fs36 \cf2 import \cf3 'package:flutter/material.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:flutter/painting.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:flutter_calendar_carousel/classes/event.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:intl/intl.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:project/Widgets/customuserappbar.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:project/modalclasses/CalendarBookEventShow.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:project/modalclasses/calendarPageModal.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:project/utils/comman.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:project/utils/constants.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:project/utils/dimention.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:project/utils/range_picker_page.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:project/utils/theme.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:provider/provider.dart'
\f1\b0 \cf0 ;\
\

\f0\b \cf2 import \cf3 'card_layout_screen.dart'
\f1\b0 \cf0 ;\
\

\f0\b \cf2 class 
\f1\b0 \cf0 Pad_BookingPage 
\f0\b \cf2 extends 
\f1\b0 \cf0 StatefulWidget \{\
  
\f0\b \cf2 var \cf4 bookingData
\f1\b0 \cf0 ;\
  String 
\f0\b \cf4 startDate
\f1\b0 \cf0 , 
\f0\b \cf4 endDate
\f1\b0 \cf0 , 
\f0\b \cf4 adultCount
\f1\b0 \cf0 , 
\f0\b \cf4 childCount
\f1\b0 \cf0 ;\
  String 
\f0\b \cf4 selectEndDate 
\f1\b0 \cf0 = 
\f0\b \cf3 ''
\f1\b0 \cf0 , 
\f0\b \cf4 selectStartDate 
\f1\b0 \cf0 = 
\f0\b \cf3 ''
\f1\b0 \cf0 ;\
  DateTime 
\f0\b \cf4 yearMonth
\f1\b0 \cf0 , 
\f0\b \cf4 dateTimeSel
\f1\b0 \cf0 ;\
  String 
\f0\b \cf4 yearVal
\f1\b0 \cf0 , 
\f0\b \cf4 monthVal
\f1\b0 \cf0 ;\
\
  Pad_BookingPage(\{\
    
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 bookingData
\f1\b0 \cf0 ,\
    
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 startDate
\f1\b0 \cf0 ,\
    
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 endDate
\f1\b0 \cf0 ,\
    
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 childCount
\f1\b0 \cf0 ,\
    
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 adultCount
\f1\b0 \cf0 ,\
  \});\
\
  \cf5 @override\
  \cf0 _Pad_BookingPageState createState() => \cf6 _Pad_BookingPageState\cf0 ();\
\}\
\

\f0\b \cf2 class 
\f1\b0 \cf0 _Pad_BookingPageState 
\f0\b \cf2 extends 
\f1\b0 \cf0 State<Pad_BookingPage> \{\
  List<DateTime> 
\f0\b \cf4 datePicker 
\f1\b0 \cf0 = [];\
  int 
\f0\b \cf4 adultCounter 
\f1\b0 \cf0 = \cf7 0\cf0 , 
\f0\b \cf4 childCounter 
\f1\b0 \cf0 = \cf7 0\cf0 ;\
\
  
\f2\i \cf8 // static var unavailableDates = ["2021-01-4", "2021-01-20", "2021-01-13","2021-01-21","2021-01-23"];\
  /*List<DateTime> unavailableDates = [];*/\
  
\f0\i0\b \cf2 static var 
\f2\i\b0 \cf4 unavailableDatesVal 
\f1\i0 \cf0 = [];\
  String 
\f0\b \cf4 Dates
\f1\b0 \cf0 ;\
\
  
\f0\b \cf2 static 
\f1\b0 \cf0 DateTime 
\f2\i \cf4 initialDate 
\f1\i0 \cf0 = \cf6 DateTime\cf0 .\cf6 now\cf0 ();\
  
\f0\b \cf2 static 
\f1\b0 \cf0 DateFormat 
\f2\i \cf4 dateFormat 
\f1\i0 \cf0 = 
\f0\b \cf2 new 
\f1\b0 \cf6 DateFormat\cf0 (
\f0\b \cf3 "yyyy-MM-dd"
\f1\b0 \cf0 );\
  EventList<Event> 
\f0\b \cf4 _markedDateMap 
\f1\b0 \cf0 = 
\f0\b \cf2 new 
\f1\b0 \cf6 EventList\cf0 <Event>(\
    events: \{\},\
  );\
\
  DateTime 
\f0\b \cf4 fromStringDate
\f1\b0 \cf0 ;\
  bool 
\f0\b \cf4 isLoading 
\f1\b0 \cf0 = 
\f0\b \cf2 false
\f1\b0 \cf0 ;\
\
  \cf5 @override\
  
\f0\b \cf2 void 
\f1\b0 \cf0 initState() \{\
    
\f0\b \cf2 super
\f1\b0 \cf0 .initState();\
  \}\
\
  \cf5 @override\
  
\f0\b \cf2 void 
\f1\b0 \cf0 didChangeDependencies() \{\
    
\f2\i \cf8 // 
\f3\b \cf9 TODO: implement didChangeDependencies\
    
\f1\i0\b0 \cf0 getApiCall();\
    
\f2\i \cf8 /* unavailableDates.addAll(\
        Provider.of<CalendarBookShow>(context, listen: true).eventDates);*/\
    
\f0\i0\b \cf2 super
\f1\b0 \cf0 .didChangeDependencies();\
  \}\
\
  
\f0\b \cf2 var \cf4 _scafoldKey 
\f1\b0 \cf0 = \cf6 GlobalKey\cf0 <ScaffoldState>();\
\
  \cf5 @override\
  \cf0 Widget build(BuildContext context) \{\
    
\f2\i \cf8 //Custom appbar\
    
\f0\i0\b \cf2 var 
\f1\b0 \cf0 appBar = \cf6 CustomAppBar\cf0 (\
      toolbarColor: Colors.
\f2\i \cf4 white
\f1\i0 \cf0 ,\
      isBackBtn: 
\f0\b \cf2 true
\f1\b0 \cf0 ,\
      title: Constants.
\f2\i \cf4 pad_booking
\f1\i0 \cf0 ,\
      isShownFilter: 
\f0\b \cf2 false
\f1\b0 \cf0 ,\
      isShowMcplogo: 
\f0\b \cf2 false
\f1\b0 \cf0 ,\
      resetBtn: 
\f0\b \cf2 true
\f1\b0 \cf0 ,\
    );\
\
    
\f2\i \cf8 //Build method\
    
\f0\i0\b \cf2 return 
\f1\b0 \cf6 Scaffold\cf0 (\
      key: 
\f0\b \cf4 _scafoldKey
\f1\b0 \cf0 ,\
      appBar: appBar,\
      body: \cf6 SafeArea\cf0 (\
        child: \cf6 Container\cf0 (\
          color: Colors.
\f2\i \cf4 white
\f1\i0 \cf0 ,\
          height: Comman.
\f2\i displaySize
\f1\i0 (context).
\f0\b \cf4 height 
\f1\b0 \cf0 -\
              appBar.
\f0\b \cf4 preferredSize
\f1\b0 \cf0 .
\f0\b \cf4 height 
\f1\b0 \cf0 -\
              MediaQuery.
\f2\i of
\f1\i0 (context).
\f0\b \cf4 padding
\f1\b0 \cf0 .
\f0\b \cf4 top 
\f1\b0 \cf0 -\
              Dimentions.
\f2\i \cf4 bottomNavHeight
\f1\i0 \cf0 ,\
          width: Comman.
\f2\i displaySize
\f1\i0 (context).
\f0\b \cf4 width
\f1\b0 \cf0 ,\
          child: \cf6 LayoutBuilder\cf0 (builder: (context, constrains) \{\
            
\f0\b \cf2 return 
\f1\b0 \cf6 SingleChildScrollView\cf0 (\
              child: \cf6 Consumer\cf0 <CalendarBookShow>(\
                builder: (context, modal, child) \{\
                  
\f0\b \cf2 return 
\f1\b0 \cf6 Column\cf0 (\
                    mainAxisSize: MainAxisSize.
\f0\b \cf4 min
\f1\b0 \cf0 ,\
                    children: [\
                      
\f0\b \cf4 isLoading\
                          
\f1\b0 \cf0 ? \cf6 RangePickerPage\cf0 (\
                              selectedDates: selectedDates,\
                              dateDisable: _isSelectableCustom,\
                            )\
                          : \cf6 Container\cf0 (\
                              height: constrains.
\f0\b \cf4 maxHeight 
\f1\b0 \cf0 * \cf7 0.6\cf0 ,\
                              child:\
                                  \cf6 Center\cf0 (child: \cf6 CircularProgressIndicator\cf0 ())),\
                      _dateGuest(constrains),\
                      Comman.
\f2\i sizeBoxheight
\f1\i0 (\cf7 40\cf0 ),\
                    ],\
                  );\
                \},\
              ),\
            );\
          \}),\
        ),\
      ),\
      bottomSheet: _bottomnextBtton(context),\
    );\
  \}\
\
  List<DateTime> 
\f0\b \cf4 presentDates 
\f1\b0 \cf0 = [];\
\
  
\f2\i \cf8 // Dates and Guests  items\
\
  
\f0\i0\b \cf2 void 
\f1\b0 \cf0 getApiCall() 
\f0\b \cf2 async 
\f1\b0 \cf0 \{\
    
\f0\b \cf2 try
\f1\b0 \cf0 \{\
      
\f0\b \cf2 await 
\f1\b0 \cf0 Provider.
\f2\i of
\f1\i0 <CalendarBookShow>(
\f0\b \cf4 context
\f1\b0 \cf0 , listen: 
\f0\b \cf2 false
\f1\b0 \cf0 )\
          .getAvailPads(
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 bookingData
\f1\b0 \cf0 [
\f0\b \cf3 'pad_id'
\f1\b0 \cf0 ],\
          \cf6 DateTime\cf0 .\cf6 now\cf0 ().
\f0\b \cf4 year
\f1\b0 \cf0 .toString(), 
\f0\b \cf4 _scafoldKey
\f1\b0 \cf0 )\
          .then((value) => \{\
        
\f0\b \cf2 if 
\f1\b0 \cf0 (
\f0\b \cf4 mounted
\f1\b0 \cf0 )\
          \{\
            setState(() \{\
              
\f0\b \cf4 isLoading 
\f1\b0 \cf0 =
\f0\b \cf2 true
\f1\b0 \cf0 ;\
            \})\
          \}\
      \});\
    \}
\f0\b \cf2 catch
\f1\b0 \cf0 (e)\{\
      print(e);\
      setState(() \{\
        
\f0\b \cf4 isLoading 
\f1\b0 \cf0 =
\f0\b \cf2 true
\f1\b0 \cf0 ;\
      \});\
    \}\
   
\f2\i \cf8 /* .catchError(() \{\
    setState(() \{\
    isLoading =true;\
    \});*/\
\
  
\f1\i0 \cf0 \}\
\
  
\f2\i \cf8 /*void onChange(dateTime)  async\{\
    unavailableDates =  new List();\
    widget.yearMonth = dateTime;\
    var date = DateTime.parse(widget.yearMonth.toString());\
    widget.yearVal = "$\{date.year\}";\
    widget.monthVal = "$\{date.month\}";\
   await Provider.of<CalendarBookShow>(context, listen: false).getAvailPads(\
        widget.bookingData['pad_id'],\
        widget.yearVal,\
       "",\
        _scafoldKey);\
    unavailableDates.addAll(Provider.of<CalendarBookShow>(context,listen: false)\
        .eventDates);\
    if(mounted)\
      \{\
        setState(() \{\
\
        \});\
      \}\
\
\
\
  \}*/\
\
/*  String sanitizeDateTime(DateTime dateTime) =>\
      "$\{dateTime.year\}-$\{dateTime.month\}-$\{dateTime.day\}";*/\
\
  
\f1\i0 \cf0 bool _isSelectableCustom(DateTime day) \{\
    
\f2\i \cf8 /*String formattedDate = dateFormat.format(initialDate);\
     unavailableDates.sort(((a, b) => a.compareTo(b)));\
\
\
    for(var unavdate in unavailableDates)\{\
      if (unavdate.compareTo(formattedDate) == 0) \{\
        formattedDate = unavdate;\
        fromStringDate = DateTime.parse(formattedDate);\
        initialDate = fromStringDate.add(new Duration(days: 1));\
        formattedDate = dateFormat.format(initialDate);\
\
\
      \}\
    \}*/\
\
    // Dates = dateFormat.format(day);\
\
    
\f1\i0 \cf0 Provider.
\f2\i of
\f1\i0 <CalendarBookShow>(
\f0\b \cf4 context
\f1\b0 \cf0 , listen: 
\f0\b \cf2 false
\f1\b0 \cf0 )\
        .
\f0\b \cf4 eventDates\
        
\f1\b0 \cf0 .sort(((a, b) => a.compareTo(b)));\
    
\f0\b \cf2 return 
\f1\b0 \cf0 !Provider.
\f2\i of
\f1\i0 <CalendarBookShow>(
\f0\b \cf4 context
\f1\b0 \cf0 , listen: 
\f0\b \cf2 false
\f1\b0 \cf0 )\
        .
\f0\b \cf4 eventDates\
        
\f1\b0 \cf0 .contains(day);\
  \}\
\
  _dateGuest(BoxConstraints constraints) \{\
    
\f0\b \cf2 return 
\f1\b0 \cf6 Container\cf0 (\
      height: constraints.
\f0\b \cf4 maxHeight 
\f1\b0 \cf0 * \cf7 0.45\cf0 ,\
      width: constraints.
\f0\b \cf4 maxWidth 
\f1\b0 \cf0 * \cf7 1.0\cf0 ,\
      child: \cf6 Column\cf0 (\
        children: [\
          \cf6 Container\cf0 (\
            padding: 
\f0\b \cf2 const 
\f1\b0 \cf6 EdgeInsets\cf0 .\cf6 symmetric\cf0 (horizontal: \cf7 10.0\cf0 ),\
            child: \cf6 Column\cf0 (\
              crossAxisAlignment: CrossAxisAlignment.
\f0\b \cf4 start
\f1\b0 \cf0 ,\
              children: [\
                \cf6 Align\cf0 (\
                  alignment: Alignment.
\f2\i \cf4 topLeft
\f1\i0 \cf0 ,\
                  child: \cf6 Text\cf0 (\
                    Constants.
\f2\i \cf4 dates
\f1\i0 \cf0 ,\
                    style: _textStyle1(
\f0\b \cf4 context
\f1\b0 \cf0 ),\
                  ),\
                ),\
                Comman.
\f2\i sizeBoxheight
\f1\i0 (\cf7 15.0\cf0 ),\
                \cf6 Align\cf0 (\
                  alignment: Alignment.
\f2\i \cf4 topLeft
\f1\i0 \cf0 ,\
                  child: \cf6 Row\cf0 (\
                    mainAxisAlignment: MainAxisAlignment.
\f0\b \cf4 spaceBetween
\f1\b0 \cf0 ,\
                    children: [\
                      
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectStartDate
\f1\b0 \cf0 .toString() != 
\f0\b \cf2 null 
\f1\b0 \cf0 &&\
                              
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectStartDate
\f1\b0 \cf0 .toString() != 
\f0\b \cf3 ''\
                          
\f1\b0 \cf0 ? \cf6 Text\cf0 (\
                              
\f0\b \cf3 "Check-in Date\cf2 \\n\cf3 " 
\f1\b0 \cf0 +\
                                  \cf6 DateFormat\cf0 .\cf6 yMMMd\cf0 ().format(\
                                      DateTime.
\f2\i parse
\f1\i0 (
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectStartDate
\f1\b0 \cf0 )),\
                              style: _textStyle2(
\f0\b \cf4 context
\f1\b0 \cf0 ),\
                            )\
                          : \cf6 Text\cf0 (
\f0\b \cf3 "Check-in Date "
\f1\b0 \cf0 , style: _textStyle2(
\f0\b \cf4 context
\f1\b0 \cf0 )),\
                      
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectEndDate
\f1\b0 \cf0 .toString() != 
\f0\b \cf2 null 
\f1\b0 \cf0 &&\
                              
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectEndDate
\f1\b0 \cf0 .toString() != 
\f0\b \cf3 ''\
                          
\f1\b0 \cf0 ? \cf6 Text\cf0 (\
                              
\f0\b \cf3 "Check-out Date\cf2 \\n\cf3 " 
\f1\b0 \cf0 +\
                                  \cf6 DateFormat\cf0 .\cf6 yMMMd\cf0 ().format(\
                                      DateTime.
\f2\i parse
\f1\i0 (
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectEndDate
\f1\b0 \cf0 )),\
                              style: _textStyle2(
\f0\b \cf4 context
\f1\b0 \cf0 ),\
                            )\
                          : \cf6 Text\cf0 (
\f0\b \cf3 "Check-out Date "
\f1\b0 \cf0 ,\
                              style: _textStyle2(
\f0\b \cf4 context
\f1\b0 \cf0 )),\
                    ],\
                  ),\
                ),\
              ],\
            ),\
          ),\
          Comman.
\f2\i sizeBoxheight
\f1\i0 (\cf7 10\cf0 ),\
          Comman.
\f2\i divider
\f1\i0 (Colors.
\f2\i \cf4 black
\f1\i0 \cf0 , \cf7 0.3\cf0 ),\
          Comman.
\f2\i sizeBoxheight
\f1\i0 (\cf7 10\cf0 ),\
          \cf6 Container\cf0 (\
            child: \cf6 Column\cf0 (\
              crossAxisAlignment: CrossAxisAlignment.
\f0\b \cf4 start
\f1\b0 \cf0 ,\
              children: [\
                \cf6 Padding\cf0 (\
                  padding: 
\f0\b \cf2 const 
\f1\b0 \cf6 EdgeInsets\cf0 .\cf6 only\cf0 (left: \cf7 10\cf0 ),\
                  child: \cf6 Align\cf0 (\
                    alignment: Alignment.
\f2\i \cf4 topLeft
\f1\i0 \cf0 ,\
                    child: \cf6 Text\cf0 (\
                      Constants.
\f2\i \cf4 Guests
\f1\i0 \cf0 ,\
                      style: _textStyle1(
\f0\b \cf4 context
\f1\b0 \cf0 ),\
                    ),\
                  ),\
                ),\
                Comman.
\f2\i sizeBoxheight
\f1\i0 (\cf7 20.0\cf0 ),\
                \cf6 Row\cf0 (\
                  mainAxisAlignment: MainAxisAlignment.
\f0\b \cf4 spaceAround
\f1\b0 \cf0 ,\
                  children: [\
                    \cf6 Column\cf0 (\
                      crossAxisAlignment: CrossAxisAlignment.
\f0\b \cf4 start
\f1\b0 \cf0 ,\
                      children: <Widget>[\
                        \cf6 Text\cf0 (\
                          Constants.
\f2\i \cf4 adults
\f1\i0 \cf0 ,\
                          style: _textStyle2(
\f0\b \cf4 context
\f1\b0 \cf0 ),\
                        ),\
                        Comman.
\f2\i sizeBoxheight
\f1\i0 (\cf7 10\cf0 ),\
                        \cf6 Container\cf0 (\
                          height: constraints.
\f0\b \cf4 maxHeight 
\f1\b0 \cf0 * \cf7 0.065\cf0 ,\
                          width: constraints.
\f0\b \cf4 maxWidth 
\f1\b0 \cf0 * \cf7 0.32\cf0 ,\
                          decoration: \cf6 BoxDecoration\cf0 (\
                            border: \cf6 Border\cf0 .\cf6 all\cf0 (\
                                color: \cf6 Color\cf0 .\cf6 fromRGBO\cf0 (\cf7 0\cf0 , \cf7 0\cf0 , \cf7 0\cf0 , \cf7 0.16\cf0 )),\
                            borderRadius: \cf6 BorderRadius\cf0 .\cf6 circular\cf0 (\cf7 10.0\cf0 ),\
                          ),\
                          child: \cf6 Row\cf0 (\
                            children: [\
                              \cf6 IconButton\cf0 (\
                                icon: \cf6 Icon\cf0 (\
                                  Icons.
\f2\i \cf4 remove
\f1\i0 \cf0 ,\
                                  size: \cf7 16.0\cf0 ,\
                                ),\
                                onPressed: () \{\
                                  setState(() \{\
                                    
\f0\b \cf2 if 
\f1\b0 \cf0 (
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 adultCounter 
\f1\b0 \cf0 > \cf7 1\cf0 ) \{\
                                      
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 adultCounter
\f1\b0 \cf0 --;\
                                    \}\
                                  \});\
                                \},\
                              ),\
                              \cf6 FittedBox\cf0 (child: \cf6 Text\cf0 (
\f0\b \cf4 adultCounter
\f1\b0 \cf0 .toString())),\
                              \cf6 IconButton\cf0 (\
                                icon: \cf6 Icon\cf0 (Icons.
\f2\i \cf4 add
\f1\i0 \cf0 , size: \cf7 16.0\cf0 ),\
                                onPressed: () \{\
                                  setState(() \{\
                                    
\f0\b \cf2 if 
\f1\b0 \cf0 (
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 adultCounter 
\f1\b0 \cf0 < \cf7 10\cf0 ) \{\
                                      
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 adultCounter
\f1\b0 \cf0 ++;\
                                    \}\
                                  \});\
                                \},\
                              ),\
                            ],\
                          ),\
                        ),\
                      ],\
                    ),\
                    Comman.
\f2\i sizeBoxwidth
\f1\i0 (\cf7 20\cf0 ),\
                    \cf6 Column\cf0 (\
                      crossAxisAlignment: CrossAxisAlignment.
\f0\b \cf4 start
\f1\b0 \cf0 ,\
                      children: <Widget>[\
                        \cf6 Text\cf0 (\
                          Constants.
\f2\i \cf4 children
\f1\i0 \cf0 ,\
                          style: _textStyle2(
\f0\b \cf4 context
\f1\b0 \cf0 ),\
                        ),\
                        Comman.
\f2\i sizeBoxheight
\f1\i0 (\cf7 10\cf0 ),\
                        \cf6 Container\cf0 (\
                          height: constraints.
\f0\b \cf4 maxHeight 
\f1\b0 \cf0 * \cf7 0.065\cf0 ,\
                          width: constraints.
\f0\b \cf4 maxWidth 
\f1\b0 \cf0 * \cf7 0.32\cf0 ,\
                          decoration: \cf6 BoxDecoration\cf0 (\
                            border: \cf6 Border\cf0 .\cf6 all\cf0 (\
                                color: \cf6 Color\cf0 .\cf6 fromRGBO\cf0 (\cf7 0\cf0 , \cf7 0\cf0 , \cf7 0\cf0 , \cf7 0.16\cf0 )),\
                            borderRadius: \cf6 BorderRadius\cf0 .\cf6 circular\cf0 (\cf7 10.0\cf0 ),\
                          ),\
                          child: \cf6 Row\cf0 (\
                            children: [\
                              \cf6 IconButton\cf0 (\
                                icon: \cf6 Icon\cf0 (\
                                  Icons.
\f2\i \cf4 remove
\f1\i0 \cf0 ,\
                                  size: \cf7 16.0\cf0 ,\
                                ),\
                                onPressed: () \{\
                                  setState(() \{\
                                    
\f0\b \cf2 if 
\f1\b0 \cf0 (
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 childCounter 
\f1\b0 \cf0 > \cf7 0\cf0 ) \{\
                                      
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 childCounter
\f1\b0 \cf0 --;\
                                    \}\
                                  \});\
                                \},\
                              ),\
                              \cf6 Flexible\cf0 (child: \cf6 Text\cf0 (
\f0\b \cf4 childCounter
\f1\b0 \cf0 .toString())),\
                              \cf6 IconButton\cf0 (\
                                icon: \cf6 Icon\cf0 (\
                                  Icons.
\f2\i \cf4 add
\f1\i0 \cf0 ,\
                                  size: \cf7 16.0\cf0 ,\
                                ),\
                                onPressed: () \{\
                                  setState(() \{\
                                    
\f0\b \cf2 if 
\f1\b0 \cf0 (
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 childCounter 
\f1\b0 \cf0 < \cf7 10\cf0 ) \{\
                                      
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf4 childCounter
\f1\b0 \cf0 ++;\
                                    \}\
                                  \});\
                                \},\
                              ),\
                            ],\
                          ),\
                        ),\
                      ],\
                    ),\
                  ],\
                ),\
              ],\
            ),\
          ),\
        ],\
      ),\
    );\
  \}\
\
  
\f2\i \cf8 // BottomSheet Next Button\
  
\f1\i0 \cf0 _bottomnextBtton(BuildContext ctx) \{\
    
\f0\b \cf2 return 
\f1\b0 \cf6 Container\cf0 (\
        width: double.
\f2\i \cf4 infinity
\f1\i0 \cf0 ,\
        margin: 
\f0\b \cf2 const 
\f1\b0 \cf6 EdgeInsets\cf0 .\cf6 only\cf0 (left: \cf7 40.0\cf0 , right: \cf7 40.0\cf0 , bottom: \cf7 10.0\cf0 ),\
        child: \cf6 MaterialButton\cf0 (\
          shape: \cf6 OutlineInputBorder\cf0 (borderRadius: \cf6 BorderRadius\cf0 .\cf6 circular\cf0 (\cf7 10.0\cf0 )),\
          color: \cf6 Color\cf0 .\cf6 fromRGBO\cf0 (\cf7 24\cf0 , \cf7 38\cf0 , \cf7 43\cf0 , \cf7 1\cf0 ),\
          padding: 
\f0\b \cf2 const 
\f1\b0 \cf6 EdgeInsets\cf0 .\cf6 only\cf0 (top: \cf7 5.0\cf0 , bottom: \cf7 8.0\cf0 ),\
          onPressed: () 
\f0\b \cf2 async 
\f1\b0 \cf0 \{\
            
\f0\b \cf2 if 
\f1\b0 \cf0 (
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectEndDate 
\f1\b0 \cf0 == 
\f0\b \cf3 '' 
\f1\b0 \cf0 && 
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectStartDate 
\f1\b0 \cf0 == 
\f0\b \cf3 ''
\f1\b0 \cf0 ) \{\
              
\f2\i \cf8 /*Comman.showSnakbar(Constants.selectstartendDate,\
                  context, Colors.red);*/\
              
\f1\i0 \cf0 Comman.
\f2\i show_dialog
\f1\i0 (
\f0\b \cf4 context
\f1\b0 \cf0 , Constants.
\f2\i \cf4 selectstartendDate
\f1\i0 \cf0 );\
            \} 
\f0\b \cf2 else if 
\f1\b0 \cf0 (DateTime.
\f2\i parse
\f1\i0 (
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectEndDate
\f1\b0 \cf0 )\
                .isBefore(DateTime.
\f2\i parse
\f1\i0 (
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectStartDate
\f1\b0 \cf0 ))) \{\
              Comman.
\f2\i showSnakBarwithkey
\f1\i0 (\
                  Constants.
\f2\i \cf4 endDategrether
\f1\i0 \cf0 , 
\f0\b \cf4 _scafoldKey
\f1\b0 \cf0 , Colors.
\f2\i \cf4 red
\f1\i0 \cf0 );\
            \} 
\f0\b \cf2 else if 
\f1\b0 \cf0 (
\f0\b \cf4 adultCounter
\f1\b0 \cf0 .toString() == 
\f0\b \cf3 '0'
\f1\b0 \cf0 ) \{\
              Comman.
\f2\i show_dialog
\f1\i0 (
\f0\b \cf4 context
\f1\b0 \cf0 , Constants.
\f2\i \cf4 adultblk
\f1\i0 \cf0 );\
            \} 
\f0\b \cf2 else 
\f1\b0 \cf0 \{\
              showModalBottomSheet(\
                  context: ctx,\
                  builder: (BuildContext context) \{\
                    
\f0\b \cf2 return 
\f1\b0 \cf6 CardLayout\cf0 (data: \{\
                      
\f0\b \cf3 'padId'
\f1\b0 \cf0 : 
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 bookingData
\f1\b0 \cf0 [
\f0\b \cf3 'pad_id'
\f1\b0 \cf0 ],\
                      
\f0\b \cf3 'priceAmount'
\f1\b0 \cf0 : 
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 bookingData
\f1\b0 \cf0 [
\f0\b \cf3 'price_amount'
\f1\b0 \cf0 ],\
                      
\f0\b \cf3 'Taxamount'
\f1\b0 \cf0 : 
\f0\b \cf3 '20'
\f1\b0 \cf0 ,\
                      
\f0\b \cf3 'startDate'
\f1\b0 \cf0 : 
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectStartDate
\f1\b0 \cf0 ,\
                      
\f0\b \cf3 'endDate'
\f1\b0 \cf0 : 
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectEndDate
\f1\b0 \cf0 ,\
                      
\f0\b \cf3 'childCount'
\f1\b0 \cf0 : 
\f0\b \cf4 childCounter
\f1\b0 \cf0 .toString(),\
                      
\f0\b \cf3 'adultCount'
\f1\b0 \cf0 : 
\f0\b \cf4 adultCounter
\f1\b0 \cf0 .toString(),\
                    \});\
                  \});\
            \}\
          \},\
          child: \cf6 Text\cf0 (\
            Constants.
\f2\i \cf4 next_button_text
\f1\i0 \cf0 ,\
            style: \cf6 TextStyle\cf0 (\
              fontFamily: FontFamily.
\f2\i \cf4 HelveticaNew
\f1\i0 \cf0 ,\
              fontWeight: FontWeight.
\f2\i \cf4 w400
\f1\i0 \cf0 ,\
              fontSize: MediaQuery.
\f2\i of
\f1\i0 (
\f0\b \cf4 context
\f1\b0 \cf0 ).
\f0\b \cf4 size
\f1\b0 \cf0 .
\f0\b \cf4 height 
\f1\b0 \cf0 * \cf7 0.04\cf0 ,\
              color: Colors.
\f2\i \cf4 white
\f1\i0 \cf0 ,\
            ),\
          ),\
        ));\
  \}\
\
  
\f2\i \cf8 //text style\
  
\f1\i0 \cf0 _textStyle1(BuildContext context) \{\
    
\f0\b \cf2 return 
\f1\b0 \cf6 TextStyle\cf0 (\
        fontSize: Comman.
\f2\i displayWidth
\f1\i0 (context) * \cf7 0.050\cf0 ,\
        fontFamily: FontFamily.
\f2\i \cf4 HelveticaNew
\f1\i0 \cf0 ,\
        fontWeight: FontWeight.
\f2\i \cf4 w400
\f1\i0 \cf0 ,\
        color: Colors.
\f2\i \cf4 black
\f1\i0 \cf0 );\
  \}\
\
  _textStyle2(BuildContext context) \{\
    
\f0\b \cf2 return 
\f1\b0 \cf6 TextStyle\cf0 (\
        fontSize: Comman.
\f2\i displayWidth
\f1\i0 (context) * \cf7 0.045\cf0 ,\
        fontFamily: FontFamily.
\f2\i \cf4 HelveticaNew
\f1\i0 \cf0 ,\
        fontWeight: FontWeight.
\f2\i \cf4 w400
\f1\i0 \cf0 ,\
        color: Colors.
\f2\i \cf4 black
\f1\i0 \cf0 );\
  \}\
\
  
\f0\b \cf2 void 
\f1\b0 \cf0 selectedDates(startDate, endDate) \{\
    setState(() \{\
      
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectEndDate 
\f1\b0 \cf0 = endDate;\
      
\f0\b \cf4 widget
\f1\b0 \cf0 .
\f0\b \cf4 selectStartDate 
\f1\b0 \cf0 = startDate;\
    \});\
    print(
\f0\b \cf3 'selected start date 
\f1\b0 \cf0 $\{startDate\}
\f0\b \cf3 '
\f1\b0 \cf0 );\
    print(
\f0\b \cf3 'selected end date 
\f1\b0 \cf0 $\{endDate\}
\f0\b \cf3 '
\f1\b0 \cf0 );\
  \}\
\}\
\
}