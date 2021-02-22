import 'package:demo_app/screens/screens.dart';
import 'package:flutter/material.dart';

// class MainAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size appSize = MediaQuery.of(context).size;
//     var appBarHeight = appSize.height * 0.25;

//     return Container(
//       height: appBarHeight,
//       child: Stack(
//         children: [
//           Container(
//             height: appBarHeight * 0.6,
//             decoration: BoxDecoration(
//               color: Colors.deepPurpleAccent,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(36),
//                 bottomRight: Radius.circular(36),
//               ),
//             ),
//           ),
//           Container(
//             height: appBarHeight * 0.5,
//             child: Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 2),
//                   child: Icon(
//                     Icons.search,
//                     size: 30,
//                   ),
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: (){
//                       Navigator.pushNamed(context, SearchScreen.route);
//                     },
//                     child: Container(
//                       height: 30,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 10),
//                             child: Icon(
//                               Icons.search,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           Text(
//                             'Tìm kiếm sản phẩm...',
//                             style: TextStyle(
//                               color: Colors.grey,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 2),
//                   child: Icon(Icons.search),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             left: 0,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: Container(
//                 height: appBarHeight * 0.5,
//                 decoration: BoxDecoration(
//                   color: Colors.orange,
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.search),
//                           Text('Nạp tiền'),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.search),
//                           Text('Nạp tiền'),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.search),
//                           Text('Nạp tiền'),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.search),
//                           Text('Nạp tiền'),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final List<Icon> icons;

  const MainAppBar({this.height, this.icons});

  @override
  Widget build(BuildContext context) {
    if (icons.length > 1)
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.deepPurpleAccent,
        child: Row(
          children: [
            icons[0],
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
                    Navigator.pushNamed(context, SearchScreen.route);
                  },
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    hintText: 'Tìm kiếm sản phẩm',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            icons[1],
          ],
        ),
      );
    else
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.deepPurpleAccent,
        child: Row(
          children: [
            icons[0],
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    hintText: 'Tìm kiếm sản phẩm',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
