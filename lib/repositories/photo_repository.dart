import 'package:demo_app/models/models.dart';
import 'package:demo_app/repositories/photo_provider.dart';

class PhotoRepository {
  PhotoApiProvider _photoApiProvider = PhotoApiProvider();

  Future<List<Photo>> fetchPhotoByAlbumId(
          String albumId, int index, int limit) async =>
      _photoApiProvider.fetchPhotosByAlbumId(albumId, index, limit);
}
