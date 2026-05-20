// GITMc — Item Equip/Sockets/Flags
//
// Writer layout (common case equip==1):

#pragma once
//   offset 20: equip byte (if 1, sockets start at 28; if 0, at 24)
//   offset 24: eqslot
//   offset 28: Hea socket
//   offset 32+HeaLen: hHai, hBea, hMus, hEye, hPon, hVan flags
//   offset 41+HeaLen: sentinel 1
//   offset 46+HeaLen: sentinel 1
//   offset 51+HeaLen: sentinel 1
//   offset 52+HeaLen: Eye socket
//   offset 56+HeaLen+EyeLen: sentinel 1
//   offset 61+HeaLen+EyeLen: sentinel 1
//   offset 62+HeaLen+EyeLen: Bod socket
//   offset 66+...+BodLen: Bac socket
//   offset 70+...+BacLen: Han socket
//   offset 75+...+HanLen: Fee socket
//   offset 79+...+FeeLen: Sho socket
//   offset 83+...+ShoLen: Van socket
//   offset 87+...+VanLen: sentinel 1
//   offset 88+...+VanLen: IHS socket
//   offset 92+...+VanLen+IHSLen: reload

import je.socket;

namespace auto je::chunk {

	struct GITM : je::comp::Chunk<"GITM"> {
		u8     type;
		padding[ 7 ];
		u8     equip;
		padding[ 3 ];
		if (equip == 1) {
			u8     eqslot;
			padding[ 3 ];
		}
		Socket Hea;
		u8     hHai;
		u8     hBea;
		u8     hMus;
		u8     hEye;
		u8     hPon;
		u8     hVan;
		padding[ 3 ];
		u8     sentinel0;
		padding[ 4 ];
		u8     sentinel1;
		padding[ 4 ];
		u8     sentinel2;
		Socket Eye;
		padding[ 3 ];
		u8     sentinel3;
		padding[ 4 ];
		u8     sentinel4;
		Socket Bod;
		Socket Bac;
		Socket Han;
		padding[ 4 ];
		Socket Fee;
		padding[ 3 ];
		Socket Sho;
		padding[ 3 ];
		Socket Van;
		padding[ 3 ];
		u8     sentinel5;
		Socket IHS;
		padding[ 3 ];
		u32    reload;
	};

}
