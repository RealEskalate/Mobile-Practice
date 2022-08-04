import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class SearchBar extends StatelessWidget {
  Function onSearch;
  SearchBar({Key? key, required this.onSearch}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        child: Row(children: [
          Expanded(
              child: TextField(
            controller: controller,
            decoration: const InputDecoration.collapsed(
              hintStyle: TextStyle(color: CustomColors.hintColor),
              hintText: "Search and article...",
            ),
          )),
          InkWell(
            splashColor: CustomColors.buttonFill,
            onTap: () {
              onSearch(controller.text.trim());
              debugPrint("Inkwell");
            },
            child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    color: CustomColors.searchButtonBkg,
                    border: Border.all(
                      color: CustomColors.searchButtonBkg,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
        ]),
      ),
    );
  }
}
