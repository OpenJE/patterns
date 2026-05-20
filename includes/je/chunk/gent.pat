// GENTc Pattern — Generic Entity Stats
#pragma once
import std.mem;

namespace auto je::chunk {

	struct GENT : je::comp::Chunk<"GENT"> {
		s32 HoverSR;
		s32 LookSR;
		s32 NameSR;
		s32 UnkwnSR;
		std::mem::Bytes<8> gap_28_35;  // unknown bytes between UnkwnSR and MaxHealth
		s32 MaxHealth;
		s32 StartHealth;
	};

}
