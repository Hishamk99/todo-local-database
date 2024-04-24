import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInitial());
}
