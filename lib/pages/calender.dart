import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Monthly extends StatefulWidget {
  @override
  _MonthlyState createState() => _MonthlyState();
}

class _MonthlyState extends State<Monthly> {
  DateTime _selectedDate = DateTime.now();
  void PreviousMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
    });
  }

  void NextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
    });
  }

  late DateTime lastdayinMonth;
  late DateTime firstdayInMonth;
  late int daysinmonth;
  final List<DateTime> dates = [];
  final List<DateTime> before = [];
  final List<DateTime> after = [];

  late DateTime nextmonth = _selectedDate;

  List<DateTime> getPreviousDays(DateTime firstday) {
    if (firstday.weekday == 7) {
      return [];
    } else {
      List<DateTime> previousDays = [];
      for (int i = 1; i <= (firstday.weekday); i++) {
        previousDays.add(firstday.subtract(Duration(days: i)));
      }
      return previousDays;
    }
  }

  List<DateTime> getAfterDays(DateTime lastday) {
    if (lastday.weekday == 6) {
      return [];
    } else {
      List<DateTime> afterDays = [];
      for (int i = 1; i <= (6 - lastday.weekday); i++) {
        afterDays.add(lastday.add(Duration(days: i)));
      }
      return afterDays;
    }
  }

//  final days = {'sun', 'Mon', 'Tue', 'Wed', 'Thu', 'sat'};
  @override
  Widget build(BuildContext context) {
    before.clear();
    dates.clear();
    after.clear();

    lastdayinMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0);
    firstdayInMonth = DateTime(_selectedDate.year, _selectedDate.month, 1);
    daysinmonth = lastdayinMonth.difference(firstdayInMonth).inDays;
    for (int i = 0; i <= daysinmonth; i++) {
      dates.add(firstdayInMonth.add(Duration(days: i)));
    }
    nextmonth = _selectedDate =
        DateTime(_selectedDate.year, _selectedDate.month + 1, 1);

    before.addAll(getPreviousDays(firstdayInMonth).reversed);
    after.addAll(getAfterDays(lastdayinMonth));
    print("after$after");
    print("dates$dates");
    print("before$before");

    List<DateTime> total = [...before, ...dates, ...after];
    print("Total$total");
    return Column(children: [
      Row(
          //  textDirection:TextDirection.values,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(DateFormat.yMMMM().format(_selectedDate)),
            )),
            //   Text(DateFormat.EEEE().format(thursday)),
            IconButton(
              onPressed: PreviousMonth,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
              ),
            ),
            IconButton(
              onPressed: NextMonth,
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
          ]),
      const SizedBox(
        height: 30,
      ),
      const Padding(
        padding: EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Mon'),
            Text('Tue'),
            Text('Wed'),
            Text('Thu'),
            Text('Fri'),
            Text('Sat'),
            Text('Sun'),
            //days.entries.map((entry)=>Text(entry.value)).toList()
            //  days.map((day) => Text(day.toString())())
          ],
        ),
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7),
            itemBuilder: (context, index) {
              final formattedDate = total[index].day;
              print("FORMATTED DATE::::$formattedDate");
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    // height: 20,
                    // width: 20,
                    //color: Colors.blueAccent,
                    child: InkWell(
                      onTap: () {},
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          formattedDate.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                    ),
                  ));
            },
            itemCount: total.length,
          ))
    ]);
  }
}

class CustomDate {
  // DateTime date;
}
