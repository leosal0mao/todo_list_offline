import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/interfaces/usecases.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final FetchTodosUsecase fetchUsecase;
  final CreateTodoUsecase createUsecase;
  final DeleteTodoUsecase deleteUsecase;
  final UpdateTodoUsecase updateUsecase;

  TodoBloc({
    required this.fetchUsecase,
    required this.createUsecase,
    required this.deleteUsecase,
    required this.updateUsecase,
  }) : super(TodoInitialState()) {
    on<FetchTodosEvent>((event, emit) async {
      emit(TodoLoadingState());
      var response = await fetchUsecase();
      final result = response.fold(
        (left) => TodoFailureState(message: left.message),
        (right) => TodoSucessState(todoList: right),
      );
      emit(result);
    });

    on<CreateTodoEvent>((event, emit) async {
      emit(TodoLoadingState());
      var response = await createUsecase(event.todo);
      final result = response.fold(
        (left) => TodoFailureState(message: left.message),
        (right) => TodoSucessState(todoList: right),
      );
      emit(result);
    });
  }
}
