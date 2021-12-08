import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../bloc/todo_bloc.dart';
import '../../../../../../core/presenter/widgets/bottom_button_widget.dart';
import '../../../../../../core/presenter/widgets/custom_text_widget.dart';
import '../../../../../../core/presenter/widgets/custom_textfield_widget.dart';
import '../../../../../../core/presenter/widgets/date_picker_widget.dart';
import '../../../../../../core/presenter/widgets/dropdown_tags_widget.dart';
import '../../../../../../core/presenter/widgets/textfield_button_widget.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends ModularState<CreateTodoView, TodoBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      bloc: controller,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextWidget(text: 'Title', color: Colors.black38),
                CustomTextFieldWidget(
                  labelText: 'title',
                  textController: TextEditingController(),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextWidget(text: 'To-do', color: Colors.black38),
                CustomTextFieldWidget(
                  labelText: 'description',
                  textController: TextEditingController(),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomTextWidget(text: 'Tag', color: Colors.black38),
                DropdownTagsWidget(
                  onChanged: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextWidget(text: 'Deadline', color: Colors.black38),
                TextfieldButtonWidget(
                  enableInteractiveSelection: false,
                  controller: TextEditingController(),
                  icon: const Icon(Icons.calendar_today_rounded),
                  onPressed: () async {
                    var date = await DatePickerWidget().of(context);
                    print(date?.toIso8601String());
                  },
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomButtonWidget(
            text: 'Create To-Do',
            onTap: () {},
          ),
        );
      },
    );
  }
}
