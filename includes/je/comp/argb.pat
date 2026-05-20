// ARGB

#pragma once

namespace auto je::comp {

	bitfield ARGB<auto A, auto R, auto G, auto B> {
		b : B;
		g : G;
		r : R;
		a : A;
	} [[sealed, format, color]];

	using ARBG8 = ARGB;

}
