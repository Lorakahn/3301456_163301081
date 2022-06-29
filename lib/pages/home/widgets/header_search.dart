import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/constants.dart';

class HeaderSearch extends StatelessWidget {
  const HeaderSearch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: SizedBox(
        height: size.height * 0.1,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: kDefaultPadding),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (values) {},
                      decoration: InputDecoration(
                        hintText: 'Search',
                        helperStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.6),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
