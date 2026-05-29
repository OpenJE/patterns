// GIARc Pattern — Armor Resistances

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine GIAR Chunk
#pragma endian little

import type.byte;

using Byte = type::Byte;

namespace auto je::chunk {

	struct GIAR : je::comp::Chunk<"GIAR"> {
		s32  BallR;   // ballistic resistance
		s32  BioR;    // biological resistance
		s32  ElecR;   // electrical resistance
		s32  EMPR;    // electromagnetic pulse resistance
		s32  NormR;   // normal/kinetic resistance
		s32  HeatR;   // heat/fire resistance
		Byte [ 4 ];  // reserved gap at end
	};

}
