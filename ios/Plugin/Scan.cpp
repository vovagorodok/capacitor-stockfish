#include <iostream>
#include "../../scan/src/bb_comp.hpp"
#include "../../scan/src/bb_index.hpp"
#include "../../scan/src/bit.hpp"
#include "../../scan/src/main.hpp"
#include "../../scan/src/hash.hpp"
#include "../../scan/src/pos.hp"
#include "../../scan/src/thread.hpp"
#include "../../scan/src/var.hpp"
#include "../../lib/threadbuf.h"
#include "Scan.hpp"
#include "ScanSendOutput.h"


namespace CapacitorScan
{
  using namespace Scan;
  static std::string CMD_EXIT = "scan:exit";

  auto readstdout = [](void *bridge) {
    std::streambuf* out = std::cout.rdbuf();

    threadbuf lichbuf(8, 8096);
    std::ostream lichout(&lichbuf);
    std::cout.rdbuf(lichout.rdbuf());
    std::istream lichin(&lichbuf);

    std::string o = "";

    while (o != CMD_EXIT) {
      std::string line;
      std::getline(lichin, line);
      if (line != CMD_EXIT) {
        const char* coutput = line.c_str();
        ScanSendOutput(bridge, coutput);
      } else {
        o = CMD_EXIT;
      }
    };

    // Restore output standard
    std::cout.rdbuf(out);

    lichbuf.close();
  };

  std::thread reader;

  void init(void *bridge) {
    reader = std::thread(readstdout, bridge);

    UCI::init(Options);
    Tune::init();
    PSQT::init();
    Bitboards::init();
    Position::init();
    Bitbases::init();
    Endgames::init();
    Threads.set(size_t(Options["Threads"]));
    Search::clear(); // After threads are up
#ifndef NNUE_EMBEDDING_OFF
    Eval::NNUE::init();
#endif
  }

  void cmd(std::string cmd) {
    UCI::command(cmd);
  }

  void exit() {
    UCI::command("quit");
    sync_cout << CMD_EXIT << sync_endl;
    reader.join();
    Threads.set(0);
  }
}

