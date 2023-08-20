import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orbyx/application/home/home_page_bloc.dart';
import 'package:orbyx/core/base_text.dart';

AppBar buildUiAppBar() {
  return AppBar(
    elevation: 0,
    title: Container(
      margin: EdgeInsets.only(left: 1.w, right: 1.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/person.png"),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 30.w,
            height: 30.h,
            child: Image.asset("assets/icons/bell.png"),
          ),
        ],
      ),
    ),
  );
}

//reUseble Big Text Widget
Widget homePageText() {
  return Container(
    margin: EdgeInsets.only(top: 18.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        reUsebleMenuText("Categories"),
        GestureDetector(
            child:
                reUsebleMenuText("See all", color: Colors.grey, fontSize: 15)),
      ],
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(left: 1.w, right: 1.w),
        width: 353.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            15.h,
          ),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16.w),
              width: 19.w,
              height: 19.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: 300.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  hintText: "Find Cars,Mobile Phones and more products",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp,
                    fontFamily: "Avenir"),
                autocorrect: false,
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget sliderView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(
          top: 20.h,
        ),
        width: 310.w,
        height: 210.h,
        child: PageView(
          physics: const BouncingScrollPhysics(),
          onPageChanged: (value) {
            context.read<HomePageBloc>().add(HomePageDots(value));
          },
          children: [
            _sliderContainer(path: "assets/icons/art.png"),
            _sliderContainer(path: "assets/icons/image_1.png"),
            _sliderContainer(path: "assets/icons/image_2.png"),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 6.h),
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: Colors.grey,
            activeColor: Colors.black,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _sliderContainer({String path = "assets/icons/art.png"}) {
  return Container(
    margin: EdgeInsets.only(
      left: 2.w,
      right: 2.w,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.h),
      ),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}

Widget categories() {
  return LimitedBox(
    maxHeight: 110.h,
    maxWidth: 110.w,
    child: ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: List.generate(
        10,
        (index) {
          return Row(
            children: [
              SizedBox(
                width: 7.w,
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/icons/image_1.png"),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
