// your_file.h

namespace std {

void foo();
void bar(int) {}

void test_function1(const T&) {
     std::bar(1);
  }


template <typename T>
class vector {
  void push_back(const T&) {
     std::bar(1);
  }
  void push_front(const T&) {
     std::bar(1);
  }
  void test_function2(const T&) {
     std::bar(1);
  }
};
}
