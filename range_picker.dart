import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:intl/intl.dart';
import 'package:mcp_project/modalclasses/CalendarBookEventShow.dart';
import 'package:mcp_project/modalclasses/calendarPageModal.dart';

import 'package:mcp_project/utils/color_picker_dialog.dart';
import 'package:mcp_project/utils/color_selector_btn.dart';
import 'package:mcp_project/utils/comman.dart';
import 'package:mcp_project/utils/event.dart';
import 'package:mcp_project/utils/theme.dart';
import 'package:provider/provider.dart';

/// Page with the [RangePicker].
class RangePickerPage extends StatefulWidget {
  /// Custom events.
  final List<Event> events;
  final Function selectedDates;
  ValueChanged<DateTime> onMonthChanged;
  SelectableDayPredicate dateDisable;

  ///
  RangePickerPage(
      {Key key,
      this.events,
      this.selectedDates,
      this.onMonthChanged,
      this.dateDisable})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RangePickerPageState();
}

class _RangePickerPageState extends State<RangePickerPage> {
  DateTime _firstDate;
  DateTime _lastDate;
  DatePeriod _selectedPeriod;
  Color selectedPeriodStartColor;
  Color selectedPeriodLastColor;
  Color selectedPeriodMiddleColor;
  static DateTime initialDate = DateTime.now();
  static DateFormat dateFormat = new DateFormat("yyyy-MM-dd");
  String formattedDate = dateFormat.format(initialDate);
  String currentDate = dateFormat.format(initialDate);
  var unavailableDates = [];
  bool isLoading = false;

  DateTime fromStringDate;

  @override
  void initState() {
    super.initState();
    getUserEvents();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // defaults for styles
    selectedPeriodLastColor = AppColors.primaryColor;
    selectedPeriodMiddleColor = AppColors.primaryColor;
    selectedPeriodStartColor = AppColors.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    // add selected colors to default settings
    DatePickerRangeStyles styles = DatePickerRangeStyles(
        selectedPeriodLastDecoration: BoxDecoration(
            color: selectedPeriodLastColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24.0),
                bottomRight: Radius.circular(24.0))),
        selectedPeriodStartDecoration: BoxDecoration(
          color: selectedPeriodStartColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0),
              bottomLeft: Radius.circular(24.0)),
        ),
        selectedPeriodMiddleDecoration: BoxDecoration(
            color: selectedPeriodMiddleColor, shape: BoxShape.rectangle),
        nextIcon: const Icon(Icons.arrow_right),
        prevIcon: const Icon(Icons.arrow_left),
        dayHeaderStyleBuilder: _dayHeaderStyleBuilder);

    return isLoading
        ? RangePicker(
            selectedPeriod: _selectedPeriod != null
                ? _selectedPeriod
                : DatePeriod(DateTime.now(), DateTime.now()),
            onChanged: _onSelectedDateChanged,
            firstDate: _firstDate != null ? _firstDate : DateTime.now(),
            lastDate: _lastDate != null
                ? _lastDate
                : DateTime.now().add(Duration(days: 365)),
            datePickerStyles: styles,
            eventDecorationBuilder: _eventDecorationBuilder,
            selectableDayPredicate: widget.dateDisable,
            onSelectionError: _onSelectionError,
            onMonthChanged: widget.onMonthChanged,
          )
        : Container(
            height: 350, child: Center(child: CircularProgressIndicator()));
  }

  // Block with show information about selected date
  // and boundaries of the selected period.
  Widget _selectedBlock() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _selectedPeriod != null
              ? Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text("Selected period boundaries:"),
                  ),
                  Text(_selectedPeriod.start.toString()),
                  Text(_selectedPeriod.end.toString()),
                ])
              : Container()
        ],
      );

  // block with color buttons inside
  Widget _stylesBlock() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ColorSelectorBtn(
                title: "Start",
                color: selectedPeriodStartColor,
                showDialogFunction: _showSelectedStartColorDialog),
            SizedBox(
              width: 12.0,
            ),
            ColorSelectorBtn(
                title: "Middle",
                color: selectedPeriodMiddleColor,
                showDialogFunction: _showSelectedMiddleColorDialog),
            SizedBox(
              width: 12.0,
            ),
            ColorSelectorBtn(
                title: "End",
                color: selectedPeriodLastColor,
                showDialogFunction: _showSelectedEndColorDialog),
          ],
        ),
      );

  // select background color for the first date of the selected period
  void _showSelectedStartColorDialog() async {
    Color newSelectedColor = await showDialog(
        context: context,
        builder: (_) => ColorPickerDialog(
              selectedColor: selectedPeriodStartColor,
            ));

    if (newSelectedColor != null) {
      setState(() {
        selectedPeriodStartColor = newSelectedColor;
      });
    }
  }

  // select background color for the last date of the selected period
  void _showSelectedEndColorDialog() async {
    Color newSelectedColor = await showDialog(
        context: context,
        builder: (_) => ColorPickerDialog(
              selectedColor: selectedPeriodLastColor,
            ));

    if (newSelectedColor != null) {
      setState(() {
        selectedPeriodLastColor = newSelectedColor;
      });
    }
  }

  // select background color for the middle dates of the selected period
  void _showSelectedMiddleColorDialog() async {
    Color newSelectedColor = await showDialog(
        context: context,
        builder: (_) => ColorPickerDialog(
              selectedColor: selectedPeriodMiddleColor,
            ));

    if (newSelectedColor != null) {
      setState(() {
        selectedPeriodMiddleColor = newSelectedColor;
      });
    }
  }

  void _onSelectedDateChanged(DatePeriod newPeriod) {
    setState(() {
      _selectedPeriod = newPeriod;
      widget.selectedDates(
          _selectedPeriod.start.toString(), _selectedPeriod.end.toString());
    });
  }

  EventDecoration _eventDecorationBuilder(DateTime date) {
    List<DateTime> eventsDates =
        widget.events?.map<DateTime>((Event e) => e.date)?.toList();

    bool isEventDate = eventsDates?.any((DateTime d) =>
            date.year == d.year &&
            date.month == d.month &&
            d.day == date.day) ??
        false;

    BoxDecoration roundedBorder = BoxDecoration(
        border: Border.all(
          color: Colors.green,
        ),
        borderRadius: BorderRadius.all(Radius.circular(3.0)));

    return isEventDate ? EventDecoration(boxDecoration: roundedBorder) : null;
  }

  // ignore: prefer_expression_function_bodies
  bool _isSelectableCustom(DateTime day) {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(Duration(days: 1));
    DateTime tomorrow = DateTime.now();
    bool isYesterday = sameDate(day, yesterday);
    bool isTomorrow = sameDate(day, tomorrow);

    return !isYesterday && !isTomorrow;

/*    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 10))))) {
      return true;
    }
    return false;*/
    // return true;
//    return day.weekday < 6;
//    return day.day != DateTime.now().add(Duration(days: 7)).day ;
  }

  void _onSelectionError(UnselectablePeriodException exception) {
    DatePeriod errorPeriod = exception.period;

    // If user supposed to set another start of the period.
    bool selectStart = _selectedPeriod.start != errorPeriod.start;

    DateTime newSelection = selectStart ? errorPeriod.start : errorPeriod.end;

    DatePeriod newPeriod = DatePeriod(newSelection, newSelection);

    setState(() {
      _selectedPeriod = newPeriod;
    });
  }

  // 0 is Sunday, 6 is Saturday
  DayHeaderStyle _dayHeaderStyleBuilder(int weekday) {
    bool isWeekend = weekday == 0 || weekday == 6;

    return DayHeaderStyle(
        textStyle: TextStyle(color: isWeekend ? Colors.red : Colors.teal));
  }

  void getUserEvents() async {
    unavailableDates =
        await Provider.of<CalendarBookShow>(context, listen: false)
            .userEventDates;
    if (unavailableDates != null && unavailableDates.length > 0) {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      print('get user events Data $unavailableDates');
      unavailableDates.sort(((a, b) => a.compareTo(b)));
      for (var unavdate in unavailableDates) {
        if (unavdate.compareTo(formattedDate) == 0) {
          formattedDate = unavdate;
          fromStringDate = DateTime.parse(formattedDate);
          initialDate = fromStringDate.add(new Duration(days: 1));
          formattedDate = dateFormat.format(initialDate);
          _firstDate = initialDate;
          _lastDate = DateTime.now().add(Duration(days: 345));
          DateTime selectedPeriodStart = initialDate;
          DateTime selectedPeriodEnd = initialDate;
          _selectedPeriod = DatePeriod(selectedPeriodStart, selectedPeriodEnd);
        } else {
          initialDate = initialDate.add(new Duration(days: 1));
          if (unavdate.compareTo(dateFormat.format(initialDate)) == 0) {
            currentDate = unavdate;
            fromStringDate = DateTime.parse(currentDate);
            initialDate = fromStringDate.add(new Duration(days: 1));
            currentDate = dateFormat.format(initialDate);
          }
          _firstDate = DateTime.now();
          _lastDate = DateTime.now().add(Duration(days: 345));
          DateTime selectedPeriodStart = initialDate;
          DateTime selectedPeriodEnd = initialDate;
          _selectedPeriod = DatePeriod(selectedPeriodStart, selectedPeriodEnd);
        }
      }
    }
    else {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      _firstDate = DateTime.now();
      _lastDate = DateTime.now().add(Duration(days: 365));
      /* DateTime selectedPeriodStart = _firstDate;
      DateTime selectedPeriodEnd = _firstDate;
      _selectedPeriod = DatePeriod(selectedPeriodStart, selectedPeriodEnd);*/
      DateTime selectedPeriodStart = DateTime.now();
      DateTime selectedPeriodEnd = DateTime.now();
      _selectedPeriod = DatePeriod(selectedPeriodStart, selectedPeriodEnd);
    }
  }
}

bool sameDate(DateTime first, DateTime second) {
  return first.year == second.year &&
      first.month == second.month &&
      first.day == second.day;
}
