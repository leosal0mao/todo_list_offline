import 'package:flutter/material.dart';
import 'package:todo_list_offline/app/core/presenter/widgets/custom_text_widget.dart';

class DropdownTagsWidget extends StatefulWidget {
  final VoidCallback onChanged;

  const DropdownTagsWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DropdownTagsWidget> createState() => _DropdownTagsWidgetState();
}

class _DropdownTagsWidgetState extends State<DropdownTagsWidget> {
  int _tagValue = Tags.none.index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: InputDecorator(
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black12,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black12,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            borderRadius: BorderRadius.circular(10),
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 30,
              color: Colors.purple,
            ),
            elevation: 10,
            value: _tagValue,
            onChanged: (value) => setState(() {
              _tagValue = value!;
            }),
            items: Tags.values.map((Tags tags) {
              return DropdownMenuItem<int>(
                  value: tags.index,
                  child: CustomTextWidget(
                    text: tags.toString().replaceAll('Tags.', ''),
                    fontsize: 18,
                  ));
            }).toList(),
          ),
        ),
      ),
    );
  }
}

enum Tags {
  none,
  personal,
  public,
  esports,
  health,
  work,
  family,
}
