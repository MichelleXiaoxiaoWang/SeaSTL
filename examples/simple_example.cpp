// your_file.h

namespace std {

void foo();
void bar(int) {}

template <typename T>
class vector {
  void push_back(const T&) {
     std::bar(1);
  }
};
}