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

namespace auto je {

	struct GITMc {
    u8     type;
    u8     _pad0[ 7 ];
    u8     equip;
    u8     _pad1[ 3 ];
    if (equip == 1) {
        u8     eqslot;
        u8     _pad2[ 3 ];
    }
    Socket Hea;
		u8     hHai;
		u8     hBea;
		u8     hMus;
		u8     hEye;
		u8     hPon;
		u8     hVan;
		u8     _pad3[ 3 ];
		u8     sentinel0;
		u8     _pad4[ 4 ];
		u8     sentinel1;
		u8     _pad5[ 4 ];
		u8     sentinel2;
		u8     _pad6[ 0 ];
		Socket Eye;
		u8     _pad7[ 3 ];
		u8     sentinel3;
		u8     _pad8[ 4 ];
		u8     sentinel4;
		u8     _pad9[ 0 ];
		Socket Bod;
		Socket Bac;
		Socket Han;
		u8     _pad10[ 4 ];
		Socket Fee;
		u8     _pad11[ 3 ];
		Socket Sho;
		u8     _pad12[ 3 ];
		Socket Van;
		u8     _pad13[ 3 ];
		u8     sentinel5;
		u8     _pad14[ 0 ];
		Socket IHS;
		u8     _pad15[ 3 ];
		u32    reload;
	};

}
