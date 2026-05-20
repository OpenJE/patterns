// EMFGc Pattern

#pragma once

namespace auto je::chunk {

	struct EMFG : je::comp::Chunk<"EMFG"> {
		u8    enabled;
		u8    colour[ 3 ];
		float base_height;
		float anim1Speed;
		float anim1Height;
		float total_height;
		float anim2Speed;
		float anim2Height;
		float verticalOffset;
		float max_fog_density;
	};

}
