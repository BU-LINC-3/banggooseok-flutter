import 'dart:io';

import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'repository.g.dart';

@RestApi(baseUrl: 'http://localhost:8080/')
abstract class BanggooseokRepository {

    factory BanggooseokRepository({String baseUrl}) {
        final dio = Dio();

        return _BanggooseokRepository(dio);
    }

    @GET("/api/room/list/{page}")
    Future<RoomList> getRoomList({@Path("page") int page});

    @GET("/api/room/{room_id}")
    Future<Room> getRoom({@Path("room_id") int roomId});

    @POST("/api/room/submit")
    Future<Map<String, int>> postRoom({@Query("token") String token, 
                                       @Query("user_id") int userId, 
                                       @Body() Room room});

    @POST("/api/image/{room_id}/submit")
    Future<RoomImage> postImage({@Path("room_id") int roomId,
                                 @Query("token") String token, 
                                 @Query("user_id") int userId, 
                                 @Part(name: "file") File image});

}
