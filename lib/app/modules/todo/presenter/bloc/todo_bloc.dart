import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list_offline/app/core/helpers/errors/failure.dart';

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

    on<CrudTodoEvent>((event, emit) async {
      late final Either<Failure, int> response;
      emit(TodoLoadingState());
      if (event.crudEnum == CrudEnum.create) {
        response = await createUsecase(event.todo);
      } else if (event.crudEnum == CrudEnum.update) {
        response = await updateUsecase(event.todo);
      } else {
        response = await deleteUsecase(event.todo);
      }
      response.fold(
        (left) => emit(TodoFailureState(message: left.message)),
        (right) {
          add(FetchTodosEvent());
        },
      );
    });
  }
}
