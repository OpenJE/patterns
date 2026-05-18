// EEOVc Pattern

#pragma once

import std.array;

using Array<T, auto Size> = std::Array<T, Size>;

namespace auto je {

	struct EEOVc<auto N> {
		Array<char, N> inv[];
		s32  ps4;
		char s1[];
		char s2[];
		char s3[];
		char s4[];
		char s5[];
	};

}
