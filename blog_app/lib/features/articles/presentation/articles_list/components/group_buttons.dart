import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../../utils/colors.dart';

class GroupButtons extends StatefulWidget {
  List<String> buttons;
  Function onChange;
  int selectedIdx;
  GroupButtons({
    Key? key,
    required this.selectedIdx,
    required this.buttons,
    required this.onChange,
  }) : super(key: key);

  @override
  State<GroupButtons> createState() => _GroupButtonsState();
}

class _GroupButtonsState extends State<GroupButtons> {
  final controller = GroupButtonController();

  @override
  void initState() {
    super.initState();
    controller.selectIndex(widget.selectedIdx);
  }

  @override
  Widget build(BuildContext context) {
    return GroupButton(
        options: GroupButtonOptions(
          borderRadius: BorderRadius.circular(100),
          spacing: 12,
          unselectedBorderColor: CustomColors.buttonBoarder,
          selectedColor: CustomColors.buttonFill,
          buttonWidth: 76,
        ),
        maxSelected: 1,
        isRadio: false,
        controller: controller,
        buttons: widget.buttons,
        onSelected: (val, i, selected) {
          controller.unselectAll();
          controller.selectIndex(i);
          widget.onChange(i);
          debugPrint('Button: $val index: $i selected: $selected');
        });
  }
}
