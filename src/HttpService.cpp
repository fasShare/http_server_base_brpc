#include <brpc/controller.h>

#include "HttpService.h"

using http::HttpServiceImpl;

HttpServiceImpl::HttpServiceImpl() {};
HttpServiceImpl::~HttpServiceImpl() {};
void HttpServiceImpl::HttpTalk(google::protobuf::RpcController* cntl_base,
        const HttpRequest*,
        HttpResponse*,
        google::protobuf::Closure* done) {
    // This object helps you to call done->Run() in RAII style. If you need
    // to process the request asynchronously, pass done_guard.release().
    brpc::ClosureGuard done_guard(done);

    brpc::Controller* cntl =
        static_cast<brpc::Controller*>(cntl_base);
    // Fill response.
    cntl->http_response().set_content_type("text/plain");
    butil::IOBufBuilder os;
    os << "queries:";
    for (brpc::URI::QueryIterator it = cntl->http_request().uri().QueryBegin();
            it != cntl->http_request().uri().QueryEnd(); ++it) {
        os << ' ' << it->first << '=' << it->second;
    }
    os << "\nbody: " << cntl->request_attachment() << '\n';
    os.move_to(cntl->response_attachment());
}

