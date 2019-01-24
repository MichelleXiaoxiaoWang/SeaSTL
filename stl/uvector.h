// This file is part of the uSTL library, an STL implementation.
//
// Copyright (c) 2005 by Mike Sharov <msharov@users.sourceforge.net>
// This file is free software, distributed under the MIT License.
#ifndef VECTOR_H
#define VECTOR_H

#pragma once
#include "memblock.h"
#include "umemory.h"
#include "upredalgo.h"

namespace ustl {

/// \class vector uvector.h ustl.h
/// \ingroup Sequences
///
/// \brief STL vector equivalent.
///
/// Provides a typed array-like interface to a managed memory block, including
/// element access, iteration, modification, resizing, and serialization. In
/// this design elements frequently undergo bitwise move, so don't put it in
/// here if it doesn't support it. This mostly means having no self-pointers.
///
template <typename T>
class vector {
public:
    typedef T				value_type;
    typedef value_type*			pointer;
    typedef const value_type*		const_pointer;
    typedef value_type&			reference;
    typedef const value_type&		const_reference;
    typedef pointer			iterator;
    typedef const_pointer		const_iterator;
    typedef memblock::size_type		size_type;
    typedef memblock::written_size_type	written_size_type;
    typedef memblock::difference_type	difference_type;
    typedef ::ustl::reverse_iterator<iterator>	reverse_iterator;
    typedef ::ustl::reverse_iterator<const_iterator>	const_reverse_iterator;
public:
    inline			vector (void);
    explicit		vector (size_type n);
				vector (size_type n, const T& v);
				vector (const vector& v);
				vector (const_iterator i1, const_iterator i2);
    			~vector (void) noexcept;
    const vector&	operator= (const vector& v);
    inline bool			operator== (const vector& v) const	{ return _data == v._data; }
    inline			operator cmemlink (void) const	{ return cmemlink (_data); }
    inline			operator cmemlink (void)	{ return cmemlink (_data); }
    inline			operator memlink (void)		{ return memlink (_data); }
    inline void			reserve (size_type n, bool bExact = false);
    void			resize (size_type n);
    void			resize (size_type n, const_reference v);
    inline size_type		capacity (void) const		{ return _data.capacity() / sizeof(T);	}
    inline size_type		size (void) const		{ return _data.size() / sizeof(T);		}
    inline size_type		max_size (void) const		{ return _data.max_size() / sizeof(T);	}
    inline bool			empty (void) const		{ return _data.empty();			}
    inline iterator		begin (void)			{ return iterator (_data.begin());		}
    inline const_iterator	begin (void) const		{ return const_iterator (_data.begin());	}
    inline iterator		end (void)			{ return iterator (_data.end());		}
    inline const_iterator	end (void) const		{ return const_iterator (_data.end());	}
    inline const_iterator	cbegin (void) const		{ return begin(); }
    inline const_iterator	cend (void) const		{ return end(); }
    inline reverse_iterator	rbegin (void)			{ return reverse_iterator (end());		}
  inline const_reverse_iterator	rbegin (void) const		{ return const_reverse_iterator (end());	}
    inline reverse_iterator	rend (void)			{ return reverse_iterator (begin());		}
  inline const_reverse_iterator	rend (void) const		{ return const_reverse_iterator (begin());	}
  inline const_reverse_iterator	crbegin (void) const		{ return rbegin(); }
  inline const_reverse_iterator	crend (void) const		{ return rend(); }
    inline pointer		data (void)			{ return pointer (_data.data()); }
    inline const_pointer	data (void) const		{ return const_pointer (_data.data()); }
    inline const_pointer	cdata (void) const		{ return const_pointer (_data.cdata()); }
    inline iterator		iat (size_type i)		{ assert (i <= size()); return begin() + i; }
    inline const_iterator	iat (size_type i) const		{ assert (i <= size()); return begin() + i; }
    inline reference		at (size_type i)		{ assert (i < size()); return begin()[i]; }
    inline const_reference	at (size_type i) const		{ assert (i < size()); return begin()[i]; }
    inline reference		operator[] (size_type i)	{ return at (i); }
    inline const_reference	operator[] (size_type i) const	{ return at (i); }
    inline reference		front (void)			{ return at(0); }
    inline const_reference	front (void) const		{ return at(0); }
    inline reference		back (void)			{ assert (!empty()); return end()[-1]; }
    inline const_reference	back (void) const		{ assert (!empty()); return end()[-1]; }
    void			push_back (const T& v = T());
    inline void			pop_back (void)			{ size_type nsz = _data.size()-sizeof(T); destroy (iterator(_data.begin()+nsz)); _data.memlink::resize (nsz); }
    inline void			clear (void)			{ destroy_all(); _data.clear(); }
    inline void			shrink_to_fit (void)		{ _data.shrink_to_fit(); }
    void			deallocate (void) noexcept;
    void			assign (const_iterator i1, const_iterator i2);
    void			assign (size_type n, const T& v);
    inline void			swap (vector& v)		{ _data.swap (v._data); }
    inline iterator		insert (const_iterator ip, const T& v);
    inline iterator		insert (const_iterator ip, size_type n, const T& v);
    inline iterator		insert (const_iterator ip, const_iterator i1, const_iterator i2);
    iterator		erase (const_iterator ep, size_type n = 1);
    iterator		erase (const_iterator ep1, const_iterator ep2);
    inline void			manage (pointer p, size_type n)		{ _data.manage (p, n * sizeof(T)); }
    inline bool			is_linked (void) const			{ return _data.is_linked(); }
    inline void			unlink (void)				{ _data.unlink(); }
    inline void			copy_link (void)			{ _data.copy_link(); }
    inline void			link (const_pointer p, size_type n)	{ _data.link (p, n * sizeof(T)); }
    inline void			link (pointer p, size_type n)		{ _data.link (p, n * sizeof(T)); }
    inline void			link (const vector& v)		{ _data.link (v); }
    inline void			link (vector& v)			{ _data.link (v); }
    inline void			link (const_pointer first, const_pointer last)	{ _data.link (first, last); }
    inline void			link (pointer first, pointer last)		{ _data.link (first, last); }
    inline void			read (istream& is)			{ container_read (is, *this); }
    inline void			write (ostream& os) const		{ container_write (os, *this); }
    inline void			text_write (ostringstream& os) const	{ container_text_write (os, *this); }
    inline size_t		stream_size (void) const		{ return container_stream_size (*this); }
#if HAVE_CPP11
    inline			vector (vector&& v)			: _data(move(v._data)) {}
    inline			vector (std::initializer_list<T> v)	: _data() { uninitialized_copy_n (v.begin(), v.size(), append_hole(v.size())); }
     vector&		operator= (vector&& v)			{ swap (v); return *this; }
    template <typename... Args>
    iterator		emplace (const_iterator ip, Args&&... args);
    template <typename... Args>
    void			emplace_back (Args&&... args);
    void			push_back (T&& v)			{ emplace_back (move(v)); }
    iterator		insert (const_iterator ip, T&& v)	{ return emplace (ip, move(v)); }
    iterator		insert (const_iterator ip, std::initializer_list<T> v)	{ return insert (ip, v.begin(), v.end()); }
#endif
protected:
    iterator		insert_space (const_iterator ip, size_type n);
private:
    iterator		insert_hole (const_iterator ip, size_type n);
    iterator		append_hole (size_type n);
    void			destroy_all (void)
				    { if (!is_linked()) destroy (begin(), end()); }
private:
    memblock			_data;	///< Raw element data, consecutively stored.
};



/// Use with vector classes to allocate and link to stack space. \p n is in elements.
#define typed_alloca_link(m,T,n)	(m).link ((T*) alloca ((n) * sizeof(T)), (n))

} // namespace ustl
#include "uvector_impl.h"
#endif
