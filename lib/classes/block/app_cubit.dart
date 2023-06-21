import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  bool isMaleSelected = true;
  double sliderValue = 175.0;
  int age = 19;
  int weight = 52;
  late double result;
  int data = 0;
  int count = 0;

  static AppCubit get(context) => BlocProvider.of(context);

  void selectMale() {
    isMaleSelected = true;
    emit(AppChangingToMale());
  }

  void selectFemale() {
    isMaleSelected = false;
    emit(AppChangingToFemale());
  }


  void changetoData() {
    data = 1;
    emit(AppChangingToFemale());
  }

  void increaseCount(){
    count = count  + 1;
    emit(CountIncrease());
  }
  void descreaseCount(){
    if(count > 0){
      count = count - 1;
    }
    emit(CountDecrease());
  }
}