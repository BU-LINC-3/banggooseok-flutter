import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'model.dart';

part 'repository.g.dart';

@RestApi(baseUrl: 'http://34.64.218.185:')
abstract class AriesRepository {

    factory AriesRepository({String baseUrl}) {
        final dio = Dio();

        return _AriesRepository(dio);
    }

    @POST("{port}/connections/receive-invitation")
    Future<String> holderReceiveInv({@Path("port") int port,
                                     @Query("alias") String alias,
                                     @Query("auto_accept") bool autoAccept = true,
                                     @Body() String body});
    
    @GET("{port}/present-proof-2.0/records")
    Future<RecordsResponse> holderRecords({@Path("port") int port,
                                           @Query("thread_id") String threadId});
                                             
}
