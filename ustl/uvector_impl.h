#ifndef VECTOR_H
#error 'uvector_impl.h is not supposed to be included, use uvector.h'
#endif

#include "uvector.h"
#include <cstdio>

namespace ustl {  /// Inserts value \p v at the end of the vector.
  template <typename T>
  void vector<T>::push_back (const T& v)
  {
      puts("My PushBack Working");
      construct_at (append_hole(1), v);
  }

template <typename T>
void vector<T>::reserve (size_type n, bool bExact)
{
    _data.reserve (n*sizeof(T), bExact);
}

template <typename T>
 typename vector<T>::iterator vector<T>::append_hole (size_type n)
{
    size_type nsz = _data.size() + n*sizeof(T);
    _data.reserve (nsz);
    iterator hp = end();
    _data.memlink::resize (nsz);
    return hp;
}

template <typename T>
void vector<T>::resize (size_type n)
{
    size_type nb = n*sizeof(T);
    _data.reserve (nb);
    iterator inewend = iterator(_data.begin()+nb);
    if (nb < _data.size())
	destroy (inewend, end());
    else
	uninitialized_default_construct (end(), inewend);
    _data.memlink::resize (nb);
}

/// Resizes the vector to contain \p n elements.
template <typename T>
void vector<T>::resize (size_type n, const_reference v)
{
    size_type nb = n*sizeof(T);
    _data.reserve (nb);
    iterator inewend = iterator(_data.begin()+nb);
    if (nb < _data.size())
	destroy (inewend, end());
    else
	uninitialized_fill (end(), inewend, v);
    _data.memlink::resize (nb);
}

/// Calls element destructors and frees storage.
template <typename T>
 void vector<T>::deallocate (void) noexcept
{
    destroy_all();
    _data.deallocate();
}

/// Initializes empty vector.
template <typename T>
 vector<T>::vector (void)
:_data()
{
}

/// Initializes a vector of size \p n.
template <typename T>
 vector<T>::vector (size_type n)
:_data()
{
    resize (n);
}

/// Copies \p n elements from \p v.
template <typename T>
vector<T>::vector (size_type n, const T& v)
:_data()
{
    uninitialized_fill_n (append_hole (n), n, v);
}

/// Copies \p v.
template <typename T>
vector<T>::vector (const vector<T>& v)
:_data()
{
    uninitialized_copy_n (v.begin(), v.size(), append_hole(v.size()));
}

/// Copies range [\p i1, \p i2]
template <typename T>
vector<T>::vector (const_iterator i1, const_iterator i2)
:_data()
{
    uninitialized_copy (i1, i2, append_hole(distance(i1,i2)));
}

/// Destructor
template <typename T>
 vector<T>::~vector (void) noexcept
{
    destroy_all();
}

/// Copies the range [\p i1, \p i2]
template <typename T>
 void vector<T>::assign (const_iterator i1, const_iterator i2)
{
    assert (i1 <= i2);
    resize (distance (i1, i2));
    ::ustl::copy (i1, i2, begin());
}

/// Copies \p n elements with value \p v.
template <typename T>
 void vector<T>::assign (size_type n, const T& v)
{
    resize (n);
    ::ustl::fill (begin(), end(), v);
}

/// Copies contents of \p v.
template <typename T>
 const vector<T>& vector<T>::operator= (const vector<T>& v)
{
    assign (v.begin(), v.end());
    return *this;
}

/// Inserts \p n uninitialized elements at \p ip.
template <typename T>
 typename vector<T>::iterator vector<T>::insert_hole (const_iterator ip, size_type n)
{
    const uoff_t ipmi = distance (_data.begin(), memblock::const_iterator(ip));
    reserve (size() + n);
    return iterator (_data.insert (_data.iat(ipmi), n * sizeof(T)));
}

/// Inserts \p n uninitialized elements at \p ip.
template <typename T>
 typename vector<T>::iterator vector<T>::insert_space (const_iterator ip, size_type n)
{
    iterator ih = insert_hole (ip, n);
    uninitialized_default_construct_n (ih, n);
    return ih;
}

/// Inserts \p n elements with value \p v at offsets \p ip.
template <typename T>
 typename vector<T>::iterator vector<T>::insert (const_iterator ip, size_type n, const T& v)
{
    iterator d = insert_hole (ip, n);
    uninitialized_fill_n (d, n, v);
    return d;
}

/// Inserts value \p v at offset \p ip.
template <typename T>
 typename vector<T>::iterator vector<T>::insert (const_iterator ip, const T& v)
{
    iterator d = insert_hole (ip, 1);
    construct_at (d, v);
    return d;
}

/// Inserts range [\p i1, \p i2] at offset \p ip.
template <typename T>
 typename vector<T>::iterator vector<T>::insert (const_iterator ip, const_iterator i1, const_iterator i2)
{
    assert (i1 <= i2);
    iterator d = insert_hole (ip, distance (i1, i2));
    uninitialized_copy (i1, i2, d);
    return d;
}

/// Removes \p count elements at offset \p ep.
template <typename T>
 typename vector<T>::iterator vector<T>::erase (const_iterator ep, size_type n)
{
    iterator d = const_cast<iterator>(ep);
    destroy_n (d, n);
    return iterator (_data.erase (memblock::iterator(d), n * sizeof(T)));
}

/// Removes elements from \p ep1 to \p ep2.
template <typename T>
 typename vector<T>::iterator vector<T>::erase (const_iterator ep1, const_iterator ep2)
{
    assert (ep1 <= ep2);
    return erase (ep1, distance(ep1, ep2));
}

#if HAVE_CPP11

/// Constructs value at \p ip
template <typename T>
template <typename... Args>
typename vector<T>::iterator vector<T>::emplace (const_iterator ip, Args&&... args)
{
    return new (insert_hole(ip,1)) T (forward<Args>(args)...);
}

/// Constructs value at the end of the vector.
template <typename T>
template <typename... Args>
void vector<T>::emplace_back (Args&&... args)
{
    new (append_hole(1)) T (forward<Args>(args)...);
    puts("My PushBack Working with C++11 or higher");
}

#endif
}
