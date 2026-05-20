// GIARc Pattern

#pragma once

namespace auto je::chunk {

	struct GIAR : je::comp::Chunk<"GIAR"> {
		u32 BallR;
		u32 BioR;
		u32 ElecR;
		u32 EMPR;
		u32 NormR;
		u32 HeatR;
	};

}
