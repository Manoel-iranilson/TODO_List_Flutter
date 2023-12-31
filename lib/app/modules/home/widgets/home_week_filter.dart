import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/core/ui/theme_extensions.dart';

class HomeWeekFilter extends StatelessWidget {
  HomeWeekFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      // visible: context.select<HomeController, TaskFilterEnum>(
      //         (controller) => controller.filterSelected) ==
      //     TaskFilterEnum.week,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'DIA DA SEMANA',
            style: context.titleStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 95,
              child: DatePicker(
                DateTime.now(),
                locale: 'pt_BR',
                height: 2,
                initialSelectedDate: DateTime.now(),
                selectionColor: context.primaryColor,
                selectedTextColor: Colors.white,
                daysCount: 7,
                monthTextStyle: TextStyle(fontSize: 8),
                dayTextStyle: TextStyle(fontSize: 13),
                dateTextStyle: TextStyle(fontSize: 13),
                // onDateChange: (selectedDate) {
                //   context.read<HomeController>().filterByDay(selectedDate);
                // },
              )),
        ],
      ),
    );
  }
}
