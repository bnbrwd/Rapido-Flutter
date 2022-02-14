import 'package:flutter/cupertino.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

// class _DemoState extends State<Demo> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       child: Center(
//         child: Text('hello world', style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
//       ),
//     );
//   }
// }

class _DemoState extends State<Demo> {
  var size, height, width, statusBarHeight;
  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).viewPadding.top;
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: width * 0.22,
                right: width * 0.22,
                top: height * 0.085,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/image/cross.png',
                  height: height * 0.32,
                  width: width * 0.55,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: height * 0.068),
            Container(
              margin: EdgeInsets.only(
                left: width * 0.166,
                right: width * 0.166,
              ),
              child: Image.asset(
                'assets/image/rapido_Logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
