// GENTc Pattern — Generic Entity Stats

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine GENT Chunk
#pragma endian little

import type.byte;

using Byte = type::Byte;

namespace auto je::chunk {

	struct GENT : je::comp::Chunk<"GENT"> {
		s32    HoverSR;
		s32    LookSR;
		s32    NameSR;
		s32    UnkwnSR;
		Byte   [ 8 ];  // unknown bytes between UnkwnSR and MaxHealth
		s32    MaxHealth;
		s32    StartHealth;
	};

}
