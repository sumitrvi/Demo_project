{\rtf1\ansi\ansicpg1252\cocoartf2509
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica-Bold;\f1\fswiss\fcharset0 Helvetica;\f2\fswiss\fcharset0 Helvetica-Oblique;
}
{\colortbl;\red255\green255\blue255;\red0\green0\blue109;\red15\green112\blue3;\red109\green109\blue109;
\red82\green0\blue103;\red109\green111\blue5;\red30\green128\blue240;\red0\green0\blue254;}
{\*\expandedcolortbl;;\csgenericrgb\c0\c0\c42745;\csgenericrgb\c5882\c43922\c1176;\csgenericrgb\c42745\c42745\c42745;
\csgenericrgb\c32157\c0\c40392;\csgenericrgb\c42745\c43529\c1961;\csgenericrgb\c11765\c50196\c94118;\csgenericrgb\c0\c0\c99608;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\b\fs36 \cf2 import \cf3 'package:flutter/material.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:flutter_date_pickers/flutter_date_pickers.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:intl/intl.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:mcp_project/modalclasses/CalendarBookEventShow.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:mcp_project/modalclasses/calendarPageModal.dart'
\f1\b0 \cf0 ;\
\

\f0\b \cf2 import \cf3 'package:mcp_project/utils/color_picker_dialog.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:mcp_project/utils/color_selector_btn.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:mcp_project/utils/comman.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:mcp_project/utils/event.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:mcp_project/utils/theme.dart'
\f1\b0 \cf0 ;\

\f0\b \cf2 import \cf3 'package:provider/provider.dart'
\f1\b0 \cf0 ;\
\

\f2\i \cf4 /// Page with the [RangePicker].\

\f0\i0\b \cf2 class 
\f1\b0 \cf0 RangePickerPage 
\f0\b \cf2 extends 
\f1\b0 \cf0 StatefulWidget \{\
  
\f2\i \cf4 /// Custom events.\
  
\f0\i0\b \cf2 final 
\f1\b0 \cf0 List<Event> 
\f0\b \cf5 events
\f1\b0 \cf0 ;\
  
\f0\b \cf2 final 
\f1\b0 \cf0 Function 
\f0\b \cf5 selectedDates
\f1\b0 \cf0 ;\
  ValueChanged<DateTime> 
\f0\b \cf5 onMonthChanged
\f1\b0 \cf0 ;\
  SelectableDayPredicate 
\f0\b \cf5 dateDisable
\f1\b0 \cf0 ;\
\
  
\f2\i \cf4 ///\
  
\f1\i0 \cf0 RangePickerPage(\
      \{Key key,\
      
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf5 events
\f1\b0 \cf0 ,\
      
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf5 selectedDates
\f1\b0 \cf0 ,\
      
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf5 onMonthChanged
\f1\b0 \cf0 ,\
      
\f0\b \cf2 this
\f1\b0 \cf0 .
\f0\b \cf5 dateDisable
\f1\b0 \cf0 \})\
      : 
\f0\b \cf2 super
\f1\b0 \cf0 (key: key);\
\
  \cf6 @override\
  \cf0 State<StatefulWidget> createState() => \cf7 _RangePickerPageState\cf0 ();\
\}\
\

\f0\b \cf2 class 
\f1\b0 \cf0 _RangePickerPageState 
\f0\b \cf2 extends 
\f1\b0 \cf0 State<RangePickerPage> \{\
  DateTime 
\f0\b \cf5 _firstDate
\f1\b0 \cf0 ;\
  DateTime 
\f0\b \cf5 _lastDate
\f1\b0 \cf0 ;\
  DatePeriod 
\f0\b \cf5 _selectedPeriod
\f1\b0 \cf0 ;\
  Color 
\f0\b \cf5 selectedPeriodStartColor
\f1\b0 \cf0 ;\
  Color 
\f0\b \cf5 selectedPeriodLastColor
\f1\b0 \cf0 ;\
  Color 
\f0\b \cf5 selectedPeriodMiddleColor
\f1\b0 \cf0 ;\
  
\f0\b \cf2 static 
\f1\b0 \cf0 DateTime 
\f2\i \cf5 initialDate 
\f1\i0 \cf0 = \cf7 DateTime\cf0 .\cf7 now\cf0 ();\
  
\f0\b \cf2 static 
\f1\b0 \cf0 DateFormat 
\f2\i \cf5 dateFormat 
\f1\i0 \cf0 = 
\f0\b \cf2 new 
\f1\b0 \cf7 DateFormat\cf0 (
\f0\b \cf3 "yyyy-MM-dd"
\f1\b0 \cf0 );\
  String 
\f0\b \cf5 formattedDate 
\f1\b0 \cf0 = 
\f2\i \cf5 dateFormat
\f1\i0 \cf0 .format(
\f2\i \cf5 initialDate
\f1\i0 \cf0 );\
  String 
\f0\b \cf5 currentDate 
\f1\b0 \cf0 = 
\f2\i \cf5 dateFormat
\f1\i0 \cf0 .format(
\f2\i \cf5 initialDate
\f1\i0 \cf0 );\
  
\f0\b \cf2 var \cf5 unavailableDates 
\f1\b0 \cf0 = [];\
  bool 
\f0\b \cf5 isLoading 
\f1\b0 \cf0 = 
\f0\b \cf2 false
\f1\b0 \cf0 ;\
\
  DateTime 
\f0\b \cf5 fromStringDate
\f1\b0 \cf0 ;\
\
  \cf6 @override\
  
\f0\b \cf2 void 
\f1\b0 \cf0 initState() \{\
    
\f0\b \cf2 super
\f1\b0 \cf0 .initState();\
    getUserEvents();\
  \}\
\
  \cf6 @override\
  
\f0\b \cf2 void 
\f1\b0 \cf0 didChangeDependencies() \{\
    
\f0\b \cf2 super
\f1\b0 \cf0 .didChangeDependencies();\
    
\f2\i \cf4 // defaults for styles\
    
\f0\i0\b \cf5 selectedPeriodLastColor 
\f1\b0 \cf0 = AppColors.
\f2\i \cf5 primaryColor
\f1\i0 \cf0 ;\
    
\f0\b \cf5 selectedPeriodMiddleColor 
\f1\b0 \cf0 = AppColors.
\f2\i \cf5 primaryColor
\f1\i0 \cf0 ;\
    
\f0\b \cf5 selectedPeriodStartColor 
\f1\b0 \cf0 = AppColors.
\f2\i \cf5 primaryColor
\f1\i0 \cf0 ;\
  \}\
\
  \cf6 @override\
  \cf0 Widget build(BuildContext context) \{\
    
\f2\i \cf4 // add selected colors to default settings\
    
\f1\i0 \cf0 DatePickerRangeStyles styles = \cf7 DatePickerRangeStyles\cf0 (\
        selectedPeriodLastDecoration: \cf7 BoxDecoration\cf0 (\
            color: 
\f0\b \cf5 selectedPeriodLastColor
\f1\b0 \cf0 ,\
            borderRadius: 
\f0\b \cf2 const 
\f1\b0 \cf7 BorderRadius\cf0 .\cf7 only\cf0 (\
                topRight: \cf7 Radius\cf0 .\cf7 circular\cf0 (\cf8 24.0\cf0 ),\
                bottomRight: \cf7 Radius\cf0 .\cf7 circular\cf0 (\cf8 24.0\cf0 ))),\
        selectedPeriodStartDecoration: \cf7 BoxDecoration\cf0 (\
          color: 
\f0\b \cf5 selectedPeriodStartColor
\f1\b0 \cf0 ,\
          borderRadius: 
\f0\b \cf2 const 
\f1\b0 \cf7 BorderRadius\cf0 .\cf7 only\cf0 (\
              topLeft: \cf7 Radius\cf0 .\cf7 circular\cf0 (\cf8 24.0\cf0 ),\
              bottomLeft: \cf7 Radius\cf0 .\cf7 circular\cf0 (\cf8 24.0\cf0 )),\
        ),\
        selectedPeriodMiddleDecoration: \cf7 BoxDecoration\cf0 (\
            color: 
\f0\b \cf5 selectedPeriodMiddleColor
\f1\b0 \cf0 , shape: BoxShape.
\f0\b \cf5 rectangle
\f1\b0 \cf0 ),\
        nextIcon: 
\f0\b \cf2 const 
\f1\b0 \cf7 Icon\cf0 (Icons.
\f2\i \cf5 arrow_right
\f1\i0 \cf0 ),\
        prevIcon: 
\f0\b \cf2 const 
\f1\b0 \cf7 Icon\cf0 (Icons.
\f2\i \cf5 arrow_left
\f1\i0 \cf0 ),\
        dayHeaderStyleBuilder: _dayHeaderStyleBuilder);\
\
    
\f0\b \cf2 return \cf5 isLoading\
        
\f1\b0 \cf0 ? \cf7 RangePicker\cf0 (\
            selectedPeriod: 
\f0\b \cf5 _selectedPeriod 
\f1\b0 \cf0 != 
\f0\b \cf2 null\
                
\f1\b0 \cf0 ? 
\f0\b \cf5 _selectedPeriod\
                
\f1\b0 \cf0 : \cf7 DatePeriod\cf0 (\cf7 DateTime\cf0 .\cf7 now\cf0 (), \cf7 DateTime\cf0 .\cf7 now\cf0 ()),\
            onChanged: _onSelectedDateChanged,\
            firstDate: 
\f0\b \cf5 _firstDate 
\f1\b0 \cf0 != 
\f0\b \cf2 null 
\f1\b0 \cf0 ? 
\f0\b \cf5 _firstDate 
\f1\b0 \cf0 : \cf7 DateTime\cf0 .\cf7 now\cf0 (),\
            lastDate: 
\f0\b \cf5 _lastDate 
\f1\b0 \cf0 != 
\f0\b \cf2 null\
                
\f1\b0 \cf0 ? 
\f0\b \cf5 _lastDate\
                
\f1\b0 \cf0 : \cf7 DateTime\cf0 .\cf7 now\cf0 ().add(\cf7 Duration\cf0 (days: \cf8 365\cf0 )),\
            datePickerStyles: styles,\
            eventDecorationBuilder: _eventDecorationBuilder,\
            selectableDayPredicate: 
\f0\b \cf5 widget
\f1\b0 \cf0 .
\f0\b \cf5 dateDisable
\f1\b0 \cf0 ,\
            onSelectionError: _onSelectionError,\
            onMonthChanged: 
\f0\b \cf5 widget
\f1\b0 \cf0 .
\f0\b \cf5 onMonthChanged
\f1\b0 \cf0 ,\
          )\
        : \cf7 Container\cf0 (\
            height: \cf8 350\cf0 , child: \cf7 Center\cf0 (child: \cf7 CircularProgressIndicator\cf0 ()));\
  \}\
\
  
\f2\i \cf4 // Block with show information about selected date\
  // and boundaries of the selected period.\
  
\f1\i0 \cf0 Widget _selectedBlock() => \cf7 Column\cf0 (\
        crossAxisAlignment: CrossAxisAlignment.
\f0\b \cf5 start
\f1\b0 \cf0 ,\
        children: <Widget>[\
          
\f0\b \cf5 _selectedPeriod 
\f1\b0 \cf0 != 
\f0\b \cf2 null\
              
\f1\b0 \cf0 ? \cf7 Column\cf0 (children: <Widget>[\
                  \cf7 Padding\cf0 (\
                    padding: 
\f0\b \cf2 const 
\f1\b0 \cf7 EdgeInsets\cf0 .\cf7 only\cf0 (top: \cf8 8.0\cf0 , bottom: \cf8 4.0\cf0 ),\
                    child: \cf7 Text\cf0 (
\f0\b \cf3 "Selected period boundaries:"
\f1\b0 \cf0 ),\
                  ),\
                  \cf7 Text\cf0 (
\f0\b \cf5 _selectedPeriod
\f1\b0 \cf0 .
\f0\b \cf5 start
\f1\b0 \cf0 .toString()),\
                  \cf7 Text\cf0 (
\f0\b \cf5 _selectedPeriod
\f1\b0 \cf0 .
\f0\b \cf5 end
\f1\b0 \cf0 .toString()),\
                ])\
              : \cf7 Container\cf0 ()\
        ],\
      );\
\
  
\f2\i \cf4 // block with color buttons inside\
  
\f1\i0 \cf0 Widget _stylesBlock() => \cf7 Padding\cf0 (\
        padding: 
\f0\b \cf2 const 
\f1\b0 \cf7 EdgeInsets\cf0 .\cf7 symmetric\cf0 (vertical: \cf8 12.0\cf0 ),\
        child: \cf7 Row\cf0 (\
          mainAxisSize: MainAxisSize.
\f0\b \cf5 min
\f1\b0 \cf0 ,\
          children: <Widget>[\
            \cf7 ColorSelectorBtn\cf0 (\
                title: 
\f0\b \cf3 "Start"
\f1\b0 \cf0 ,\
                color: 
\f0\b \cf5 selectedPeriodStartColor
\f1\b0 \cf0 ,\
                showDialogFunction: _showSelectedStartColorDialog),\
            \cf7 SizedBox\cf0 (\
              width: \cf8 12.0\cf0 ,\
            ),\
            \cf7 ColorSelectorBtn\cf0 (\
                title: 
\f0\b \cf3 "Middle"
\f1\b0 \cf0 ,\
                color: 
\f0\b \cf5 selectedPeriodMiddleColor
\f1\b0 \cf0 ,\
                showDialogFunction: _showSelectedMiddleColorDialog),\
            \cf7 SizedBox\cf0 (\
              width: \cf8 12.0\cf0 ,\
            ),\
            \cf7 ColorSelectorBtn\cf0 (\
                title: 
\f0\b \cf3 "End"
\f1\b0 \cf0 ,\
                color: 
\f0\b \cf5 selectedPeriodLastColor
\f1\b0 \cf0 ,\
                showDialogFunction: _showSelectedEndColorDialog),\
          ],\
        ),\
      );\
\
  
\f2\i \cf4 // select background color for the first date of the selected period\
  
\f0\i0\b \cf2 void 
\f1\b0 \cf0 _showSelectedStartColorDialog() 
\f0\b \cf2 async 
\f1\b0 \cf0 \{\
    Color newSelectedColor = 
\f0\b \cf2 await 
\f1\b0 \cf0 showDialog(\
        context: 
\f0\b \cf5 context
\f1\b0 \cf0 ,\
        builder: (_) => \cf7 ColorPickerDialog\cf0 (\
              selectedColor: 
\f0\b \cf5 selectedPeriodStartColor
\f1\b0 \cf0 ,\
            ));\
\
    
\f0\b \cf2 if 
\f1\b0 \cf0 (newSelectedColor != 
\f0\b \cf2 null
\f1\b0 \cf0 ) \{\
      setState(() \{\
        
\f0\b \cf5 selectedPeriodStartColor 
\f1\b0 \cf0 = newSelectedColor;\
      \});\
    \}\
  \}\
\
  
\f2\i \cf4 // select background color for the last date of the selected period\
  
\f0\i0\b \cf2 void 
\f1\b0 \cf0 _showSelectedEndColorDialog() 
\f0\b \cf2 async 
\f1\b0 \cf0 \{\
    Color newSelectedColor = 
\f0\b \cf2 await 
\f1\b0 \cf0 showDialog(\
        context: 
\f0\b \cf5 context
\f1\b0 \cf0 ,\
        builder: (_) => \cf7 ColorPickerDialog\cf0 (\
              selectedColor: 
\f0\b \cf5 selectedPeriodLastColor
\f1\b0 \cf0 ,\
            ));\
\
    
\f0\b \cf2 if 
\f1\b0 \cf0 (newSelectedColor != 
\f0\b \cf2 null
\f1\b0 \cf0 ) \{\
      setState(() \{\
        
\f0\b \cf5 selectedPeriodLastColor 
\f1\b0 \cf0 = newSelectedColor;\
      \});\
    \}\
  \}\
\
  
\f2\i \cf4 // select background color for the middle dates of the selected period\
  
\f0\i0\b \cf2 void 
\f1\b0 \cf0 _showSelectedMiddleColorDialog() 
\f0\b \cf2 async 
\f1\b0 \cf0 \{\
    Color newSelectedColor = 
\f0\b \cf2 await 
\f1\b0 \cf0 showDialog(\
        context: 
\f0\b \cf5 context
\f1\b0 \cf0 ,\
        builder: (_) => \cf7 ColorPickerDialog\cf0 (\
              selectedColor: 
\f0\b \cf5 selectedPeriodMiddleColor
\f1\b0 \cf0 ,\
            ));\
\
    
\f0\b \cf2 if 
\f1\b0 \cf0 (newSelectedColor != 
\f0\b \cf2 null
\f1\b0 \cf0 ) \{\
      setState(() \{\
        
\f0\b \cf5 selectedPeriodMiddleColor 
\f1\b0 \cf0 = newSelectedColor;\
      \});\
    \}\
  \}\
\
  
\f0\b \cf2 void 
\f1\b0 \cf0 _onSelectedDateChanged(DatePeriod newPeriod) \{\
    setState(() \{\
      
\f0\b \cf5 _selectedPeriod 
\f1\b0 \cf0 = newPeriod;\
      
\f0\b \cf5 widget
\f1\b0 \cf0 .
\f0\b \cf5 selectedDates
\f1\b0 \cf0 (\
          
\f0\b \cf5 _selectedPeriod
\f1\b0 \cf0 .
\f0\b \cf5 start
\f1\b0 \cf0 .toString(), 
\f0\b \cf5 _selectedPeriod
\f1\b0 \cf0 .
\f0\b \cf5 end
\f1\b0 \cf0 .toString());\
    \});\
  \}\
\
  EventDecoration _eventDecorationBuilder(DateTime date) \{\
    List<DateTime> eventsDates =\
        
\f0\b \cf5 widget
\f1\b0 \cf0 .
\f0\b \cf5 events
\f1\b0 \cf0 ?.map<DateTime>((Event e) => e.
\f0\b \cf5 date
\f1\b0 \cf0 )?.toList();\
\
    bool isEventDate = eventsDates?.any((DateTime d) =>\
            date.
\f0\b \cf5 year 
\f1\b0 \cf0 == d.
\f0\b \cf5 year 
\f1\b0 \cf0 &&\
            date.
\f0\b \cf5 month 
\f1\b0 \cf0 == d.
\f0\b \cf5 month 
\f1\b0 \cf0 &&\
            d.
\f0\b \cf5 day 
\f1\b0 \cf0 == date.
\f0\b \cf5 day
\f1\b0 \cf0 ) ??\
        
\f0\b \cf2 false
\f1\b0 \cf0 ;\
\
    BoxDecoration roundedBorder = \cf7 BoxDecoration\cf0 (\
        border: \cf7 Border\cf0 .\cf7 all\cf0 (\
          color: Colors.
\f2\i \cf5 green
\f1\i0 \cf0 ,\
        ),\
        borderRadius: \cf7 BorderRadius\cf0 .\cf7 all\cf0 (\cf7 Radius\cf0 .\cf7 circular\cf0 (\cf8 3.0\cf0 )));\
\
    
\f0\b \cf2 return 
\f1\b0 \cf0 isEventDate ? \cf7 EventDecoration\cf0 (boxDecoration: roundedBorder) : 
\f0\b \cf2 null
\f1\b0 \cf0 ;\
  \}\
\
  
\f2\i \cf4 // ignore: prefer_expression_function_bodies\
  
\f1\i0 \cf0 bool _isSelectableCustom(DateTime day) \{\
    DateTime now = \cf7 DateTime\cf0 .\cf7 now\cf0 ();\
    DateTime yesterday = now.subtract(\cf7 Duration\cf0 (days: \cf8 1\cf0 ));\
    DateTime tomorrow = \cf7 DateTime\cf0 .\cf7 now\cf0 ();\
    bool isYesterday = sameDate(day, yesterday);\
    bool isTomorrow = sameDate(day, tomorrow);\
\
    
\f0\b \cf2 return 
\f1\b0 \cf0 !isYesterday && !isTomorrow;\
\

\f2\i \cf4 /*    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&\
        day.isBefore(DateTime.now().add(Duration(days: 10))))) \{\
      return true;\
    \}\
    return false;*/\
    // return true;\
//    return day.weekday < 6;\
//    return day.day != DateTime.now().add(Duration(days: 7)).day ;\
  
\f1\i0 \cf0 \}\
\
  
\f0\b \cf2 void 
\f1\b0 \cf0 _onSelectionError(UnselectablePeriodException exception) \{\
    DatePeriod errorPeriod = exception.
\f0\b \cf5 period
\f1\b0 \cf0 ;\
\
    
\f2\i \cf4 // If user supposed to set another start of the period.\
    
\f1\i0 \cf0 bool selectStart = 
\f0\b \cf5 _selectedPeriod
\f1\b0 \cf0 .
\f0\b \cf5 start 
\f1\b0 \cf0 != errorPeriod.
\f0\b \cf5 start
\f1\b0 \cf0 ;\
\
    DateTime newSelection = selectStart ? errorPeriod.
\f0\b \cf5 start 
\f1\b0 \cf0 : errorPeriod.
\f0\b \cf5 end
\f1\b0 \cf0 ;\
\
    DatePeriod newPeriod = \cf7 DatePeriod\cf0 (newSelection, newSelection);\
\
    setState(() \{\
      
\f0\b \cf5 _selectedPeriod 
\f1\b0 \cf0 = newPeriod;\
    \});\
  \}\
\
  
\f2\i \cf4 // 0 is Sunday, 6 is Saturday\
  
\f1\i0 \cf0 DayHeaderStyle _dayHeaderStyleBuilder(int weekday) \{\
    bool isWeekend = weekday == \cf8 0 \cf0 || weekday == \cf8 6\cf0 ;\
\
    
\f0\b \cf2 return 
\f1\b0 \cf7 DayHeaderStyle\cf0 (\
        textStyle: \cf7 TextStyle\cf0 (color: isWeekend ? Colors.
\f2\i \cf5 red 
\f1\i0 \cf0 : Colors.
\f2\i \cf5 teal
\f1\i0 \cf0 ));\
  \}\
\
  
\f0\b \cf2 void 
\f1\b0 \cf0 getUserEvents() 
\f0\b \cf2 async 
\f1\b0 \cf0 \{\
    
\f0\b \cf5 unavailableDates 
\f1\b0 \cf0 =\
        
\f0\b \cf2 await 
\f1\b0 \cf0 Provider.
\f2\i of
\f1\i0 <CalendarBookShow>(
\f0\b \cf5 context
\f1\b0 \cf0 , listen: 
\f0\b \cf2 false
\f1\b0 \cf0 )\
            .
\f0\b \cf5 userEventDates
\f1\b0 \cf0 ;\
    
\f0\b \cf2 if 
\f1\b0 \cf0 (
\f0\b \cf5 unavailableDates 
\f1\b0 \cf0 != 
\f0\b \cf2 null 
\f1\b0 \cf0 && 
\f0\b \cf5 unavailableDates
\f1\b0 \cf0 .
\f0\b \cf5 length 
\f1\b0 \cf0 > \cf8 0\cf0 ) \{\
      
\f0\b \cf2 if 
\f1\b0 \cf0 (
\f0\b \cf5 mounted
\f1\b0 \cf0 ) \{\
        setState(() \{\
          
\f0\b \cf5 isLoading 
\f1\b0 \cf0 = 
\f0\b \cf2 true
\f1\b0 \cf0 ;\
        \});\
      \}\
      print(
\f0\b \cf3 'get user events Data 
\f1\b0 \cf0 $
\f0\b \cf5 unavailableDates\cf3 '
\f1\b0 \cf0 );\
      
\f0\b \cf5 unavailableDates
\f1\b0 \cf0 .sort(((a, b) => a.compareTo(b)));\
      
\f0\b \cf2 for 
\f1\b0 \cf0 (
\f0\b \cf2 var 
\f1\b0 \cf0 unavdate 
\f0\b \cf2 in \cf5 unavailableDates
\f1\b0 \cf0 ) \{\
        
\f0\b \cf2 if 
\f1\b0 \cf0 (unavdate.compareTo(
\f0\b \cf5 formattedDate
\f1\b0 \cf0 ) == \cf8 0\cf0 ) \{\
          
\f0\b \cf5 formattedDate 
\f1\b0 \cf0 = unavdate;\
          
\f0\b \cf5 fromStringDate 
\f1\b0 \cf0 = DateTime.
\f2\i parse
\f1\i0 (
\f0\b \cf5 formattedDate
\f1\b0 \cf0 );\
          
\f2\i \cf5 initialDate 
\f1\i0 \cf0 = 
\f0\b \cf5 fromStringDate
\f1\b0 \cf0 .add(
\f0\b \cf2 new 
\f1\b0 \cf7 Duration\cf0 (days: \cf8 1\cf0 ));\
          
\f0\b \cf5 formattedDate 
\f1\b0 \cf0 = 
\f2\i \cf5 dateFormat
\f1\i0 \cf0 .format(
\f2\i \cf5 initialDate
\f1\i0 \cf0 );\
          
\f0\b \cf5 _firstDate 
\f1\b0 \cf0 = 
\f2\i \cf5 initialDate
\f1\i0 \cf0 ;\
          
\f0\b \cf5 _lastDate 
\f1\b0 \cf0 = \cf7 DateTime\cf0 .\cf7 now\cf0 ().add(\cf7 Duration\cf0 (days: \cf8 345\cf0 ));\
          DateTime selectedPeriodStart = 
\f2\i \cf5 initialDate
\f1\i0 \cf0 ;\
          DateTime selectedPeriodEnd = 
\f2\i \cf5 initialDate
\f1\i0 \cf0 ;\
          
\f0\b \cf5 _selectedPeriod 
\f1\b0 \cf0 = \cf7 DatePeriod\cf0 (selectedPeriodStart, selectedPeriodEnd);\
        \} 
\f0\b \cf2 else 
\f1\b0 \cf0 \{\
          
\f2\i \cf5 initialDate 
\f1\i0 \cf0 = 
\f2\i \cf5 initialDate
\f1\i0 \cf0 .add(
\f0\b \cf2 new 
\f1\b0 \cf7 Duration\cf0 (days: \cf8 1\cf0 ));\
          
\f0\b \cf2 if 
\f1\b0 \cf0 (unavdate.compareTo(
\f2\i \cf5 dateFormat
\f1\i0 \cf0 .format(
\f2\i \cf5 initialDate
\f1\i0 \cf0 )) == \cf8 0\cf0 ) \{\
            
\f0\b \cf5 currentDate 
\f1\b0 \cf0 = unavdate;\
            
\f0\b \cf5 fromStringDate 
\f1\b0 \cf0 = DateTime.
\f2\i parse
\f1\i0 (
\f0\b \cf5 currentDate
\f1\b0 \cf0 );\
            
\f2\i \cf5 initialDate 
\f1\i0 \cf0 = 
\f0\b \cf5 fromStringDate
\f1\b0 \cf0 .add(
\f0\b \cf2 new 
\f1\b0 \cf7 Duration\cf0 (days: \cf8 1\cf0 ));\
            
\f0\b \cf5 currentDate 
\f1\b0 \cf0 = 
\f2\i \cf5 dateFormat
\f1\i0 \cf0 .format(
\f2\i \cf5 initialDate
\f1\i0 \cf0 );\
          \}\
          
\f0\b \cf5 _firstDate 
\f1\b0 \cf0 = \cf7 DateTime\cf0 .\cf7 now\cf0 ();\
          
\f0\b \cf5 _lastDate 
\f1\b0 \cf0 = \cf7 DateTime\cf0 .\cf7 now\cf0 ().add(\cf7 Duration\cf0 (days: \cf8 345\cf0 ));\
          DateTime selectedPeriodStart = 
\f2\i \cf5 initialDate
\f1\i0 \cf0 ;\
          DateTime selectedPeriodEnd = 
\f2\i \cf5 initialDate
\f1\i0 \cf0 ;\
          
\f0\b \cf5 _selectedPeriod 
\f1\b0 \cf0 = \cf7 DatePeriod\cf0 (selectedPeriodStart, selectedPeriodEnd);\
        \}\
      \}\
    \}\
    
\f0\b \cf2 else 
\f1\b0 \cf0 \{\
      
\f0\b \cf2 if 
\f1\b0 \cf0 (
\f0\b \cf5 mounted
\f1\b0 \cf0 ) \{\
        setState(() \{\
          
\f0\b \cf5 isLoading 
\f1\b0 \cf0 = 
\f0\b \cf2 true
\f1\b0 \cf0 ;\
        \});\
      \}\
      
\f0\b \cf5 _firstDate 
\f1\b0 \cf0 = \cf7 DateTime\cf0 .\cf7 now\cf0 ();\
      
\f0\b \cf5 _lastDate 
\f1\b0 \cf0 = \cf7 DateTime\cf0 .\cf7 now\cf0 ().add(\cf7 Duration\cf0 (days: \cf8 365\cf0 ));\
      
\f2\i \cf4 /* DateTime selectedPeriodStart = _firstDate;\
      DateTime selectedPeriodEnd = _firstDate;\
      _selectedPeriod = DatePeriod(selectedPeriodStart, selectedPeriodEnd);*/\
      
\f1\i0 \cf0 DateTime selectedPeriodStart = \cf7 DateTime\cf0 .\cf7 now\cf0 ();\
      DateTime selectedPeriodEnd = \cf7 DateTime\cf0 .\cf7 now\cf0 ();\
      
\f0\b \cf5 _selectedPeriod 
\f1\b0 \cf0 = \cf7 DatePeriod\cf0 (selectedPeriodStart, selectedPeriodEnd);\
    \}\
  \}\
\}\
\
bool sameDate(DateTime first, DateTime second) \{\
  
\f0\b \cf2 return 
\f1\b0 \cf0 first.
\f0\b \cf5 year 
\f1\b0 \cf0 == second.
\f0\b \cf5 year 
\f1\b0 \cf0 &&\
      first.
\f0\b \cf5 month 
\f1\b0 \cf0 == second.
\f0\b \cf5 month 
\f1\b0 \cf0 &&\
      first.
\f0\b \cf5 day 
\f1\b0 \cf0 == second.
\f0\b \cf5 day
\f1\b0 \cf0 ;\
\}\
\
}