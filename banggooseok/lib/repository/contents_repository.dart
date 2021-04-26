import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:banggooseok/repository/model.dart';

part 'contents_repository.g.dart';

@RestApi(baseUrl: 'http://34.64.218.185:8080/')
abstract class ContentsRepository {
  factory ContentsRepository({String baseUrl}) {
    final dio = Dio();

    return _ContentsRepository(dio);
  }

  @GET("/bbanggooseok-core/api/room/list/{page}")
  Future<List<RoomData>> getRoomData({@Path("page") int page});
}
