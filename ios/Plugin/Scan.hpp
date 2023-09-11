#ifndef Scan_hpp
#define Scan_hpp

#include <string>

namespace CapacitorScan {
void init(void *scan, std::string variant, std::string resourcePath);
void cmd(std::string cmd);
void exit();
}

#endif /* Scan_hpp */
