import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:submission/request_detail_page.dart';
import 'package:submission/shared/theme.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: HexColor("#F8F6FF"),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: buttonMain,
              title: Text(
                "ABC Mobile",
                style: appbarTxt,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/icon-qr.png'),
                ),
              ],
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.w, top: 20.h, right: 20.w, bottom: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: HexColor('EBEDEE'),
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.search_rounded),
                              onPressed: () {},
                            ),
                            iconColor: Colors.black,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            labelText: "Search by Username",
                            labelStyle: searchTxt,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Recents",
                          style: subTitleText,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RequestDetail(),
                                    )),
                                child: SizedBox(
                                  width: 60.w,
                                  height: 83.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          child: Image.network(
                                            "https://i.ibb.co/ggZ0vqX/20210116-090058-1.jpg",
                                            width: 60.w,
                                            height: 60.h,
                                          )),
                                      Text(
                                        "Mukhamad Azis Tholib",
                                        style: nameTxt,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "All",
                              style: subTitleText,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Add New(+)",
                                style: addText,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RequestDetail(),
                                  )),
                              child: Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
