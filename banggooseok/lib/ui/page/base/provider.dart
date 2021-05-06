import 'dart:io';

import 'package:banggooseok/arch/observable.dart';
import 'package:banggooseok/repository/aries/model.dart';
import 'package:banggooseok/repository/aries/repository.dart';
import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:banggooseok/repository/banggooseok/repository.dart';
import 'package:kakao_flutter_sdk/auth.dart';

class BaseProvider {

    final BanggooseokRepository _banggooseokRepository = BanggooseokRepository();
    final AriesRepository _ariesRepository = AriesRepository();

    ObservableData<String> _token;
    ObservableData<AgentResponse> _agentResponse;
    ObservableData<String> _invReponse;
    ObservableData<String> _invRecResponse;
    ObservableData<V20Response> _credResponse;
    ObservableData<V20Response> _knockResponse;
    ObservableData<RecordsResponse> _recordsResponse;
    ObservableData<VerifiedResponse> _verifiedResponse;

    void requestToken() {
        AccessTokenStore.instance.fromStore().then((value) {
            _token.setData(value.accessToken);
        });
    }

    void requestIssuerAgent(String token) {
        _banggooseokRepository.issuerAgent(token: token).then((value) {
            _agentResponse.setData(value);
        });
    }

    void requestIssuerInv(String token, String alias) {
        _banggooseokRepository.issuerInvitation(token: token, alias: alias).then((value) {
            _invReponse.setData(value);
        });
    }

    void requestIssuerCred(String token, String alias) {
        _banggooseokRepository.issuerCredential(token: token, alias: alias).then((value) {
            _credResponse.setData(value);
        });
    }

    void requestVerifierKnock(String alias) {
        _banggooseokRepository.verifierKnock(alias: alias).then((value) {
            _knockResponse.setData(value);
        });
    }

    void requestVerifierVerified(String presExId) {
        _requestVerifierVerifiedRec(presExId, 3);
    }

    void _requestVerifierVerifiedRec(String presExId, int retrieve) async {
        Future.delayed(const Duration(seconds: 3)).then((_) {
            _banggooseokRepository.verifierVerified(presExId: presExId).then((value) {
                _verifiedResponse.setData(value);
            }).onError((error, stackTrace) {
                if (retrieve > 0) {
                    _requestVerifierVerifiedRec(presExId, --retrieve);
                } else {
                    throw Exception("서버에서 요청이 처리되지않았습니다.");
                }
            });
        });
    }

    void requestHolderReceiveInv(int port, String alias, String invitation) {
        _ariesRepository.holderReceiveInv(port: port, alias: alias, body: invitation).then((value) {
            _invRecResponse.setData(value);
        });
    }

    void requestHolderRecords(int port, String threadId) {
        _ariesRepository.holderRecords(port: port, threadId: threadId).then((value) {
            _recordsResponse.setData(value);
        });
    }

    ObservableData<String> get getToken {
        if (_token == null) {
            _token = ObservableData();
        }
        
        return _token;
    }

    ObservableData<AgentResponse> get getAgentResponse {
        if (_agentResponse == null) {
            _agentResponse = ObservableData();
        }
        
        return _agentResponse;
    }

    ObservableData<String> get getInvReponse {
        if (_invReponse == null) {
            _invReponse = ObservableData();
        }
        
        return _invReponse;
    }

    ObservableData<V20Response> get getCredResponse {
        if (_credResponse == null) {
            _credResponse = ObservableData();
        }
        
        return _credResponse;
    }

    ObservableData<V20Response> get getKnockResponse {
        if (_knockResponse == null) {
            _knockResponse = ObservableData();
        }
        
        return _knockResponse;
    }

    ObservableData<VerifiedResponse> get getVerifiedResponse {
        if (_verifiedResponse == null) {
            _verifiedResponse = ObservableData();
        }
        
        return _verifiedResponse;
    }

    ObservableData<String> get getInvRecResponse {
        if (_invRecResponse == null) {
            _invRecResponse = ObservableData();
        }
        
        return _invRecResponse;
    }

    ObservableData<RecordsResponse> get getRecordsResponse {
        if (_recordsResponse == null) {
            _recordsResponse = ObservableData();
        }
        
        return _recordsResponse;
    }

}
