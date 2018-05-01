find_path(Openssl_INCLUDE_PATH
        NAMES openssl/opensslconf.h openssl/ssl23.h
        HINTS /opt/openssl/include)
if(Openssl_INCLUDE_PATH)
    set(Openssl_INCLUDE_PATH_FOUND true)
else(Openssl_INCLUDE_PATH)
    message(FATAL_ERROR: "Openssl_INCLUDE_PATH not found.")
endif(Openssl_INCLUDE_PATH)


find_library(Openssl_crypto_LIBRARY 
        NAMES libcrypto.a
        HINTS /opt/openssl/lib)
if(Openssl_crypto_LIBRARY)
    set(Openssl_crypto_LIBRARY_FOUND true)
else(Openssl_crypto_LIBRARY)
    message(FATAL_ERROR "Openssl_crypto not found.")
endif(Openssl_crypto_LIBRARY)

find_library(Openssl_ssl_LIBRARY 
        NAMES libssl.a
        HINTS /opt/openssl/lib)
if(Openssl_ssl_LIBRARY)
    set(Openssl_ssl_LIBRARY_FOUND true)
else(Openssl_ssl_LIBRARY)
    message(FATAL_ERROR "Openssl_ssl not found.")
endif(Openssl_ssl_LIBRARY)

if(Openssl_crypto_LIBRARY_FOUND AND Openssl_ssl_LIBRARY_FOUND AND Openssl_INCLUDE_PATH_FOUND)
    set(Openssl_FOUND true)
else(Openssl_crypto_LIBRARY_FOUND AND Openssl_ssl_LIBRARY_FOUND AND Openssl_INCLUDE_PATH_FOUND)
    message(FATAL_ERROR "Openssl_LIBRARY or Openssl_INCLUDE_PATH not found.")
endif(Openssl_crypto_LIBRARY_FOUND AND Openssl_ssl_LIBRARY_FOUND AND Openssl_INCLUDE_PATH_FOUND)


