import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:submission/request_success_page.dart';
import 'package:submission/shared/theme.dart';
import 'package:date_format/date_format.dart';

class RequestDetail extends StatefulWidget {
  const RequestDetail({Key? key}) : super(key: key);

  @override
  _RequestDetailState createState() => _RequestDetailState();
}

class _RequestDetailState extends State<RequestDetail> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => MaterialApp(
          home: Scaffold(
        backgroundColor: HexColor("#F8F6FF"),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: buttonMain,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "ABC Mobile",
            style: appbarTxt,
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 12.w, top: 20.h, right: 20.w, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Image.network(
                          "https://i.ibb.co/ggZ0vqX/20210116-090058-1.jpg",
                          width: 80.w,
                          height: 80.h,
                        )),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: Text(
                      "Mukhamad Azis Tholib",
                      style: nameTitle,
                    ),
                  ),
                  Center(
                    child: Text(
                      "@hi_ajiss",
                      style: usernameDet,
                    ),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  Text(
                    "Amount",
                    style: subTitleText,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Text("IDR", style: inputNumber),
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 0, minHeight: 0),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: HexColor('#ECDAFF'),
                          width: 2.w,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: HexColor('#ECDAFF'),
                          width: 2.w,
                        ),
                      ),
                    ),
                    style: inputNumber,
                  ),
                  SizedBox(
                    height: 36.5.h,
                  ),
                  Text(
                    "Note",
                    style: subTitleText,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Add message',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: HexColor('#ECDAFF'),
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: HexColor('#ECDAFF'),
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    style: inputNote,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Payment Deadline",
                    style: subTitleText,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 1.sw,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border:
                          Border.all(width: 2.w, color: HexColor('#ECDAFF')),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatDate(dateTime, [dd, ' - ', MM, ' - ', yyyy]),
                          style: hintTxt,
                        ),
                        InkWell(
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2069))
                                  .then((date) {
                                setState(() {
                                  dateTime = date!;
                                });
                              });
                            },
                            child: Image.asset(
                              'assets/images/Date_range.png',
                              width: 30.w,
                              height: 30.h,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 51.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 320.w,
                      height: 55.h,
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => buildSheet(),
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10.r),
                              ),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(buttonMain),
                        ),
                        child: Text(
                          'Next',
                          style: textButton,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet() {
    return makeDismissible(
      child: DraggableScrollableSheet(
          initialChildSize: 0.7,
          builder: (_, controller) => Container(
                decoration: BoxDecoration(
                  color: HexColor("#F6F6F6"),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30.r)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                        child: Container(
                      width: 105.w,
                      height: 9.h,
                      decoration: BoxDecoration(
                        color: HexColor("#ECDAFF"),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    )),
                    SizedBox(
                      height: 34.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Send To",
                            style: subTitle2,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15.r),
                                  child: Image.network(
                                    "https://i.ibb.co/ggZ0vqX/20210116-090058-1.jpg",
                                    width: 60.w,
                                    height: 60.h,
                                  )),
                              SizedBox(
                                width: 15.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 245.w,
                                      child: Text(
                                        "Mukhamad Azis Tholib",
                                        style: titleName,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),
                                  SizedBox(
                                      width: 245.w,
                                      child: Text(
                                        "@hi_ajiss",
                                        style: username,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Amount",
                            style: subTitle2,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "IDR",
                                style: amountTxt,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "300.000",
                                style: amountTxt,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Note",
                            style: subTitle2,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Lorem Ipsum Dolor Sit Amet Lorem Ipsum ",
                            style: noteTxt,
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Payment Deadline",
                            style: subTitle2,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            formatDate(dateTime, [dd, ' - ', MM, ' - ', yyyy]),
                            style: noteTxt,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 320.w,
                        height: 55.h,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RequestSuccessPage(),
                                ));
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(buttonMain),
                          ),
                          child: Text(
                            'Confirm',
                            style: textButton,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
