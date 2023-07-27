// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../constants.dart';
// import '../core/utils/app_colors.dart';
// import '../enums.dart';
// import '../screens/home/home_screen.dart';
// import '../screens/home/presenation/manager/cubit.dart';
//
// class CustomBottomNavBar extends StatelessWidget {
//   CustomBottomNavBar(
//       {Key? key,required this.currentIndex, required this.callbackAction})
//       : super(key: key);
//
//
//   Function callbackAction;
//   int currentIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     final Color inActiveIconColor = Color(0xFFB6B6B6);
//     return  returnBottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: (value) {
//
//       },
//       items: const [
//         BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "",
//             backgroundColor: AppColors.primary),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.category_outlined),
//             label: "",
//             backgroundColor: AppColors.primary),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border),
//             label: "",
//             backgroundColor: AppColors.primary),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: "",
//             backgroundColor: AppColors.primary),
//       ],
//     );
//   }
// }
//
// // Container(
// // padding: EdgeInsets.symmetric(vertical: 14),
// // decoration: BoxDecoration(
// // color: Colors.white,
// // boxShadow: [
// // BoxShadow(
// // offset: Offset(0, -15),
// // blurRadius: 20,
// // color: Color(0xFFDADADA).withOpacity(0.15),
// // ),
// // ],
// // borderRadius: BorderRadius.only(
// // topLeft: Radius.circular(40),
// // topRight: Radius.circular(40),
// // ),
// // ),
// // child: SafeArea(
// // top: false,
// // child: Row(
// // mainAxisAlignment: MainAxisAlignment.spaceAround,
// // children: [
// // IconButton(
// // icon: SvgPicture.asset(
// // "assets/icons/Shop Icon.svg",
// // color: MenuState.home == selectedMenu
// // ? kPrimaryColor
// //     : inActiveIconColor,
// // ),
// // onPressed: () {
// // callbackAction() {}
// // }),
// // IconButton(
// // icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
// // onPressed: () {
// // callbackAction() {}
// // },
// // ),
// // IconButton(
// // icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg"),
// // onPressed: () {
// // callbackAction() {}
// // },
// // ),
// // IconButton(
// // icon: SvgPicture.asset(
// // "assets/icons/User Icon.svg",
// // color: MenuState.profile == selectedMenu
// // ? kPrimaryColor
// //     : inActiveIconColor,
// // ),
// // onPressed: () {
// // callbackAction() {}
// // }),
// // ],
// // )),
// // );
