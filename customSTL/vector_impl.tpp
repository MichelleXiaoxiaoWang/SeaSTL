namespace std {

template <typename T> vector<T>::vector() {
  cap = 0;
  count = 0;
}

template <typename T> vector<T>::vector(size_type n) {
  cap = n;
  count = 0;
}

template <typename T> vector<T>::vector(const vector<T> &v) {
  count = v.count;
  cap = v.cap;
  for (size_type i = 0; i < buffer_size; i++) {
    buf[i] = v.buf[i];
  }
}

template <typename T> vector<T>::vector(size_type n, const T &val) {
  count = 0;
  cap = n;
  for (size_type i = 0; i < buffer_size; i++) {
    buf[i] = val;
  }
}

template <typename T> vector<T>::~vector() {
  cap = 0;
  count = 0;
}

template <typename T> void vector<T>::push_back(const T &v) {
  #if SEA_STL_DEBUG == 1
      puts("PushBack");
  #endif
  if (count >= buffer_size && count < cap) {
    ++count;
    return;
  }
  if (count == cap) {
    if (cap == 0) {
      cap = buffer_size;
    }
    reserve(cap * 2);
  }
  buf[count] = v;
  ++count;
}

template <typename T> T &vector<T>::operator[](size_type index) {
  if (index < buffer_size)
    return buf[index];
  return non_D();
}

template <typename T> void vector<T>::resize(size_type n) {
  reserve(n);
  count = n;
}

template <typename T> void vector<T>::reserve(size_type n) {
  if (n < buffer_size)
    return;
  cap = n;
}

template <typename T> T &vector<T>::non_D() {
  static T value{};
  return value;
}

template <typename T> const T &vector<T>::non_D_const() const {
  static T value{};
  return value;
}

}
