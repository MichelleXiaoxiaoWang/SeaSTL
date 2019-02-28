namespace std {

  template <typename T>
    vector<T>::vector() {
      cap = 0;
      count = 0;
  }

  template <typename T>
    vector<T>::vector(unsigned int n) {
      cap = n;
      count = 0;
  }

  template <typename T>
    vector<T>::vector(const vector<T>& v) {
      count = v.count;
      cap = v.cap;
      for (unsigned int i=0; i<buffer_size; i++) {
        buf[i] = v.buf[i];
      }
  }

  template <typename T>
    vector<T>::vector(unsigned int n, const T& val) {
      count = 0;
      cap = n;
      for (unsigned int i=0; i<buffer_size; i++) {
        buf[i] = val;
      }
  }

  template <typename T>
    vector<T>::~vector() {
      cap = 0;
      count = 0;
  }

  template <typename T>
    void vector<T>::push_back(const T& v) {
      puts("PushBack");
      if (count >= buffer_size && count<cap) {
        ++count;
          return;
      }
      if (count == cap) {
          if (cap == 0) {
            cap = buffer_size;
          }
          reserve(cap*2);
      }
      buf[count] = v;
      ++count;
  }

  template <typename T>
    T& vector<T>::operator[](unsigned int index) {
      if (index < buffer_size) return buf[index];
      return non_D();
    }

  template <typename T>
    void vector<T>::resize(unsigned int n) {
      reserve(n);
      count = n;
    }

  template <typename T>
    void vector<T>::reserve(unsigned int n) {
      if (n<buffer_size) return;
      cap = n;
    }

  template <typename T>
      T& vector<T>::non_D() {
      static T value{};
      return value;
    }

  template <typename T>
      const T& vector<T>::non_D_const() const {
      static T value{};
      return value;
    }
}
