import 'package:bloc/bloc.dart';

class EdtPassCubit extends Cubit<bool> {
  EdtPassCubit() : super(true);

  void changeObsecure(bool obsecure) {
    emit(obsecure);
  }
}
