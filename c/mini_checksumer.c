// Needs libssl-dev/openssl-devel
// gcc -o mini_checksumer mini_checksumer.c -lssl -lcrypto

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <openssl/evp.h>

#define MB 1048576  // 1 MB in bytes
#define BUFFER_SIZE 8192

void print_usage(const char* program_name) {
    fprintf(stderr, "Usage: %s <file_path>\n", program_name);
}

char* calculate_sha256(FILE* file, long read_size, long offset) {
    EVP_MD_CTX *mdctx;
    const EVP_MD *md;
    unsigned char hash[EVP_MAX_MD_SIZE];
    unsigned int hash_len;

    md = EVP_sha256();
    mdctx = EVP_MD_CTX_new();
    EVP_DigestInit_ex(mdctx, md, NULL);

    char buffer[BUFFER_SIZE];
    size_t bytes_read;
    long total_read = 0;

    fseek(file, offset, SEEK_SET);

    while (total_read < read_size && (bytes_read = fread(buffer, 1, BUFFER_SIZE, file)) > 0) {
        EVP_DigestUpdate(mdctx, buffer, bytes_read);
        total_read += bytes_read;
    }

    EVP_DigestFinal_ex(mdctx, hash, &hash_len);
    EVP_MD_CTX_free(mdctx);

    char* output = malloc(65);
    for(int i = 0; i < hash_len; i++) {
        sprintf(output + (i * 2), "%02x", hash[i]);
    }
    output[64] = 0;

    return output;
}

char* calculate_sha256_full(FILE* file) {
    EVP_MD_CTX *mdctx;
    const EVP_MD *md;
    unsigned char hash[EVP_MAX_MD_SIZE];
    unsigned int hash_len;

    md = EVP_sha256();
    mdctx = EVP_MD_CTX_new();
    EVP_DigestInit_ex(mdctx, md, NULL);

    char buffer[BUFFER_SIZE];
    size_t bytes_read;

    while ((bytes_read = fread(buffer, 1, BUFFER_SIZE, file)) > 0) {
        EVP_DigestUpdate(mdctx, buffer, bytes_read);
    }

    EVP_DigestFinal_ex(mdctx, hash, &hash_len);
    EVP_MD_CTX_free(mdctx);

    char* output = malloc(65);
    for(int i = 0; i < hash_len; i++) {
        sprintf(output + (i * 2), "%02x", hash[i]);
    }
    output[64] = 0;

    return output;
}

char* combine_and_hash(const char* hash1, const char* hash2) {
    EVP_MD_CTX *mdctx;
    const EVP_MD *md;
    unsigned char hash[EVP_MAX_MD_SIZE];
    unsigned int hash_len;

    md = EVP_sha256();
    mdctx = EVP_MD_CTX_new();
    EVP_DigestInit_ex(mdctx, md, NULL);

    EVP_DigestUpdate(mdctx, hash1, strlen(hash1));
    EVP_DigestUpdate(mdctx, hash2, strlen(hash2));

    EVP_DigestFinal_ex(mdctx, hash, &hash_len);
    EVP_MD_CTX_free(mdctx);

    char* output = malloc(65);
    for(int i = 0; i < hash_len; i++) {
        sprintf(output + (i * 2), "%02x", hash[i]);
    }
    output[64] = 0;

    return output;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        print_usage(argv[0]);
        return 1;
    }

    const char* file_path = argv[1];
    FILE* file = fopen(file_path, "rb");
    if (!file) {
        fprintf(stderr, "Error: Unable to open file %s\n", file_path);
        return 1;
    }

    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    rewind(file);

    char* checksum;
    if (file_size > 21 * MB) {
        char* checksum_first = calculate_sha256(file, 10 * MB, 0);
        char* checksum_last = calculate_sha256(file, 10 * MB, file_size - 10 * MB);

        checksum = combine_and_hash(checksum_first, checksum_last);

        free(checksum_first);
        free(checksum_last);
    } else {
        checksum = calculate_sha256_full(file);
    }

    printf("%s %s\n", file_path, checksum);

    fclose(file);
    free(checksum);
    return 0;
}
