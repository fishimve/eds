import 'package:eds_test/locator.dart';
import 'package:eds_test/models/photo.dart';
import 'package:eds_test/services/api_service.dart';
import 'package:eds_test/services/database_service.dart';
import 'package:stacked/stacked.dart';

class PhotosViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _databaseService = locator<DatabaseService>();


  bool? showSlideShow;

  void initSlideshow(bool slide) {
    showSlideShow = slide;
  }

  void toogleViews() {
    showSlideShow = !showSlideShow!;
    notifyListeners();
  }

  final _albumPhotos = <Photo>[];
  List<Photo> get albumPhotos => _albumPhotos;

  Future<void> getAlbumPhotos(int albumId) async {
    setBusy(true);
    List<Photo> photosFromApi = await _apiService.getAlbumPhotos(albumId);
    _albumPhotos.addAll(photosFromApi);
    setBusy(false);
  }
}
