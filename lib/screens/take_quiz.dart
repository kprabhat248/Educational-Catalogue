import 'package:brain_school/constants.dart';
import 'package:brain_school/screens/take_quiz_data.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TakequizScreen extends StatelessWidget {
  const TakequizScreen({Key? key}) : super(key: key);
  static const String routeName = 'TakequizScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: kOtherColor,
          borderRadius: kTopBorderRadius,
        ),
        child: ListView.builder(
          itemCount: takequiz.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: kDefaultPadding / 2, right: kDefaultPadding / 2),
              padding: EdgeInsets.all(kDefaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 3.h,
                    child: Divider(
                      thickness: 1.0,
                    ),
                  ),
                  //first need a row, then 3 columns
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //1st column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            takequiz[index].number.toString(),
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                          ),
                          Text(takequiz[index].topic,
                              style: Theme.of(context).textTheme.caption),
                        ],
                      ),

                      //2nd one
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            takequiz[index].Question,
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                          ),
                          Text(takequiz[index].Answer,
                              style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                      //3rd one
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '🕒${takequiz[index].Counter}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                    child: Divider(
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
