import 'package:bloc/bloc.dart';

enum DataEvent {save}

class DataBloc extends Bloc<DataEvent, List<String>> {
  DataBloc(List<String> initialState) : super(initialState);
  int index = 0;
  String source = "";

  @override
  Stream<List<String>> mapEventToState(DataEvent event) async* {
    if(event == DataEvent.save) {
      state[this.index] = this.source;
      yield state; // returned the value but not terminate a function
    }
  }

  void changeData(int i, String s) {
    this.index = i;
    this.source = s;
  }
}