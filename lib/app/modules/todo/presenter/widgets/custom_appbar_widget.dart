import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: Stack(
        children: <Widget>[
          Container(
            // Background
            child: const Center(
              child: Text(
                "Todos",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            color: Colors.purple,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
          ),
          Container(),
          Positioned(
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Icon(
                              Icons.done_outline_rounded,
                              color: Colors.green,
                              size: 24,
                            ),
                            Text(
                              'DONE: 10',
                              style: TextStyle(color: Colors.black26),
                            ),
                          ],
                        )),
                    Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Icon(Icons.error_outline_rounded,
                                size: 24, color: Colors.red),
                            Text('TO DO: 10',
                                style: TextStyle(color: Colors.black26)),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
