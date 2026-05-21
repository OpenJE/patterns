// GITMc — Item Equip/Sockets/Flags
//
// Writer layout (common case equip==1):
//   offset 20: type (s32) + unknown_16_19 (4 bytes gap)
//   offset 28: equip byte
//   offset 29: unknown_21_23 (3 bytes gap)
//   offset 30: eqslot (s32)
//   offset 34: Hea socket
//   offset 34+HeaLen: hHai, hBea, hMus, hEye, hPon, hVan flags
//   offset 41+HeaLen: sentinel 0x41
//   offset 46+HeaLen: sentinel 0x41
//   offset 51+HeaLen: sentinel 0x41
//   offset 52+HeaLen: Eye socket
//   offset 56+HeaLen+EyeLen: sentinel 0x41
//   offset 61+HeaLen+EyeLen: sentinel 0x41
//   offset 62+HeaLen+EyeLen: Bod socket
//   offset 66+...+BodLen: Bac socket
//   offset 70+...+BacLen: Han socket
//   offset 75+...+HanLen: Fee socket
//   offset 79+...+FeeLen: Sho socket
//   offset 83+...+ShoLen: Van socket
//   offset 87+...+VanLen: sentinel 0x41 (constant_before_ihs)
//   offset 88+...+VanLen: IHS socket
//   offset 92+...+VanLen+IHSLen: reload

import je.comp.socket;

using Bytes4 = std::mem::Bytes<4>;
using Bytes3 = std::mem::Bytes<3>;

namespace auto je::chunk {

	struct GITM : je::comp::Chunk<"GITM"> {
		s32     type;
		Bytes4 unknown_16_19;  // gap after type (4 bytes)
		u8      equip;
		Bytes3 unknown_21_23;  // gap after equip (3 bytes)
		s32     eqslot;
		Socket  Hea;
		u8      hHai;
		u8      hBea;
		u8      hMus;
		u8      hEye;
		u8      hPon;
		u8      hVan;
		Bytes3 unknown_after_h_flags_a;  // gap after h flags (3 bytes)
		u8      constant_41;  // sentinel at offset 41 + HeaLen: 0x41
		Bytes4 unknown_after_h_flags_b;  // gap (4 bytes)
		u8      constant_46;  // sentinel at offset 46 + HeaLen: 0x41
		Bytes4 unknown_after_h_flags_c;  // gap (4 bytes)
		u8      constant_51;  // sentinel at offset 51 + HeaLen: 0x41
		Socket  Eye;
		u8      constant_after_eye_a;  // sentinel after Eye: 0x41
		Bytes4 unknown_after_eye;  // gap (4 bytes)
		u8      constant_after_eye_b;  // sentinel after gap: 0x41
		Socket  Bod;
		Socket  Bac;
		Socket  Han;
		Socket  Fee;
		Socket  Sho;
		Socket  Van;
		u8      constant_before_ihs;  // sentinel before IHS: 0x41
		Socket  IHS;
		s32     reload;
	};

}
