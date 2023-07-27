// import 'package:calculator/screens/cart/presenation/manager/cubit.dart';
// import 'package:calculator/screens/cart/presenation/manager/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../../models/Cart.dart';
// import '../../../../size_config.dart';
// import '../../../home/data/models/CartReponse.dart';
// import 'cart_card.dart';
//
// class BodyCart extends StatefulWidget {
//   const BodyCart({required this.product,super.key});
//   final CartResponse? product;
//
//   @override
//   _BodyCartState createState() => _BodyCartState();
// }
//
// class _BodyCartState extends State<BodyCart> {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Padding(
//       padding:
//           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//       child: ListView.builder(
//         itemCount:widget.product?.data?.products?.length,
//         itemBuilder: (context, index) => Padding(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           child: Dismissible(
//             key: Key(widget. product?.data?.products?[index]?.product?.id??''),
//             direction: DismissDirection.endToStart,
//             onDismissed: (direction) {
//               setState(() {
//                 // widget. product?. cartResponse.removeAt(index);
//               });
//             },
//             background: Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 color: Color(0xFFFFE6E6),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Row(
//                 children: [
//                   Spacer(),
//                   SvgPicture.asset("assets/icons/Trash.svg"),
//                 ],
//               ),
//             ),
//             child: CartCard(product:widget.product),
//           ),
//         ),
//       ),
//     );
//   }
// }
