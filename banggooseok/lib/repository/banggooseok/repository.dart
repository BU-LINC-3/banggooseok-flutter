import 'dart:io';

import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'repository.g.dart';

@RestApi(baseUrl: 'http://34.64.218.185:8080/')
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
    Future<SubmitResponse> postRoom({@Query("pres_ex_id") String presExId, 
                                     @Query("user_id") int userId, 
                                     @Body() Room room});

    @POST("/api/image/{room_id}/submit")
    Future<RoomImage> postImage({@Path("room_id") int roomId,
                                 @Query("pres_ex_id") String presExId, 
                                 @Query("user_id") int userId, 
                                 @Part(name: "file") File image});

    @GET("/api/did/issuer/agent")
    Future<AgentResponse> issuerAgent({@Query("token") String token});

    @GET("/api/did/issuer/invitation")
    Future<String> issuerInvitation({@Query("token") String token, 
                                     @Query("alias") String alias});

    @GET("/api/did/issuer/credential")
    Future<V20Response> issuerCredential({@Query("token") String token, 
                                          @Query("alias") String alias});

    @GET("/api/did/verifier/knock")
    Future<V20Response> verifierKnock({@Query("alias") String alias});

    @GET("/api/did/verifier/verified")
    Future<VerifiedResponse> verifierVerified({@Query("pres_ex_id") String presExId});
    
}
