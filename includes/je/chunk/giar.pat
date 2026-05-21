// GIARc Pattern — Armor Resistances
#pragma once
import std.mem;

using Bytes4 = std::mem::Bytes<4>;

namespace auto je::chunk {

	struct GIAR : je::comp::Chunk<"GIAR"> {
		s32 BallR;   // ballistic resistance
		s32 BioR;    // biological resistance
		s32 ElecR;   // electrical resistance
		s32 EMPR;    // electromagnetic pulse resistance
		s32 NormR;   // normal/kinetic resistance
		s32 HeatR;   // heat/fire resistance
		Bytes4 unknown_36_39;  // reserved gap at end
	};

}
