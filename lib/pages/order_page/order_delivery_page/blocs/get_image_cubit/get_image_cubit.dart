import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

part 'get_image_state.dart';

class GetImageCubit extends Cubit<GetImageState> {
  GetImageCubit()
      : super(
    const GetImageState(),
  );
  final ImagePicker _imagePick = ImagePicker();
  Future<void> getImage() async {
    XFile? _image = await _imagePick.pickImage(source: ImageSource.gallery);
    if (_image != null && _image.path.isNotEmpty) {
      emit(
        state.copyWith(
          image: '1',
        ),
      );
    }
  }
}