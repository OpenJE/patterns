// GENTc Pattern

#pragma once

namespace auto je::chunk {

	struct GENT : je::comp::Chunk<"GENT"> {
		u32 HoverSR;
		u32 LookSR;
		u32 NameSR;
		u32 UnkwnSR;
		u32 MaxHealth;
		u32 StartHealth;
	};

}
