#include "http.pb.h"


namespace http {

class HttpServiceImpl : public HttpService {
public:
    HttpServiceImpl();
    virtual ~HttpServiceImpl();
    void HttpTalk(google::protobuf::RpcController* cntl_base,
            const HttpRequest*,
            HttpResponse*,
            google::protobuf::Closure* done);
};

}

