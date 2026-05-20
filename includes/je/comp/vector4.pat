// Vector4

#pragma once

import std.mem;

namespace auto je::comp {

	struct Vector4<T> {
		T x, y, z, w;
	};

	using Vector4u8   = Vector4<u8>;
	using Vector4u16  = Vector4<u16>;
	using Vector4u32  = Vector4<u32>;
	using Vector4u64  = Vector4<u64>;
	using Vector4u128 = Vector4<u128>;
	using Vector4i8   = Vector4<i8>;
	using Vector4i16  = Vector4<i16>;
	using Vector4i32  = Vector4<i32>;
	using Vector4i64  = Vector4<i64>;
	using Vector4i128 = Vector4<i128>;
	using Vector4f32  = Vector4<float>;
	using Vector4f64	= Vector4<double>;

	struct Vector4Area24 {
		float x;
		float y;
		float z;
		float w;
		std::mem::Bytes<8> unknown_tail;
	};

}
