import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../core/presenter/widgets/global_widgets.dart';
import '../../../domain/entities/entities.dart';
import '../../../presenter/bloc/todo_bloc.dart';

class EditTodoView extends StatefulWidget {
  final Todo? todo;
  const EditTodoView({Key? key, this.todo}) : super(key: key);

  @override
  State<EditTodoView> createState() => _EditTodoViewState();
}

class _EditTodoViewState extends ModularState<EditTodoView, TodoBloc> {
  @override
  void initState() {
    super.initState();
  }

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
            text: 'Edit To-Do',
            onTap: () {},
          ),
        );
      },
    );
  }
}
