#include <brpc/server.h>
#include <gflags/gflags.h>
#include <butil/logging.h>
#include <brpc/restful.h>

#include "http.pb.h"

DEFINE_int32(port, 8010, "TCP Port of this server");
DEFINE_int32(idle_timeout_s, -1, "Connection will be closed if there is no "
                     "read/write operations during the last `idle_timeout_s'");
DEFINE_int32(logoff_ms, 2000, "Maximum duration of server's LOGOFF state "
                     "(waiting for client to close connection before server stops)");

DEFINE_string(certificate, "cert.pem", "Certificate file path to enable SSL");
DEFINE_string(private_key, "key.pem", "Private key file path to enable SSL");
DEFINE_string(ciphers, "", "Cipher suite used for SSL connections");

namespace http {
class HttpServiceImpl : public HttpService {
public:
    HttpServiceImpl() {};
    virtual ~HttpServiceImpl() {};
    void Echo(google::protobuf::RpcController* cntl_base,
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
};

}

int main(int argc, char **argv) {
    GFLAGS_NAMESPACE::ParseCommandLineFlags(&argc, &argv, true);

    brpc::Server server;
    http::HttpServiceImpl http_service;

    if (server.AddService(&http_service, brpc::SERVER_DOESNT_OWN_SERVICE) != 0) {
        LOG(ERROR) << "Fail to add http_svc";
        return -1;
    }

    brpc::ServerOptions options;
    options.idle_timeout_sec = FLAGS_idle_timeout_s;
    options.ssl_options.default_cert.certificate = FLAGS_certificate;
    options.ssl_options.default_cert.private_key = FLAGS_private_key;
    options.ssl_options.ciphers = FLAGS_ciphers;

    if (server.Start(FLAGS_port, &options) != 0) {
        LOG(ERROR) << "Fail to start HttpServer";
        return -1;
    }

    server.RunUntilAskedToQuit();
    return 0;
}
