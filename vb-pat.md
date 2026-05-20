// Van Buren Filetype Classes - ImHex Pattern Language
// Generated from the supplied memory table / map diagrams.
//
// This version intentionally uses fully qualified ImHex standard library names
// directly. No convenience aliases are used.

#pragma endian little
#pragma array_limit 0x100000
#pragma pattern_limit 0x100000

import std.mem;
import std.string;
import type.color;

namespace vb {

// -----------------------------------------------------------------------------
// Common helpers
// -----------------------------------------------------------------------------

using Tag4 = char[4];

struct VBHeader {
    Tag4 tag;
    u32 version;
    u32 size;
};

struct VBHeaderSignedVersion {
    Tag4 tag;
    s32 version;
    u32 size;
};

struct Vector2f {
    float x;
    float y;
};

struct Vector3f {
    float x;
    float y;
    float z;
};

struct Vector4f {
    float x;
    float y;
    float z;
    float w;
};

struct Vector4Area24 {
    float x;
    float y;
    float z;
    float w;
    std::mem::Bytes<8> unknown_tail;
};

// System.Drawing.Color.ToArgb() is logically AARRGGBB. This custom type follows
// the same style as ImHex's stdlib color types: a generic sealed, formatted
// color bitfield. Because the file is little-endian, a 32-bit ARGB integer is
// stored bytewise as B, G, R, A, so the bitfield declares channels in file order.
bitfield ARGB<auto A, auto R, auto G, auto B> {
    b : B;
    g : G;
    r : R;
    a : A;
} [[sealed, format, color]];


// EMAP uses an 8-byte project-specific Color.ToByte() payload, so it remains
// std::mem::Bytes<8> until that helper's exact channel format is known.
// EMFG and VEG color fields use type.color where the byte layout is known.

// -----------------------------------------------------------------------------
// Shared mini-records
// -----------------------------------------------------------------------------

[[static]] struct Skill {
    s32 index;
    s32 value;
};

struct Socket {
    std::string::SizedString<u16> model;
    std::string::SizedString<u16> tex;
};

struct TwoMWTChunk {
    Vector3f loc;
    std::string::SizedString<u16> tex;
    Vector2f texloc;
};

[[static]] struct EMNPChunk {
    u8 enabled;
    Vector3f l;
    std::mem::Bytes<12> unknown_13_24;
    u8 b1;
    u8 b2;
    u8 b3;
    u8 b4;
    u8 b5;
};

// -----------------------------------------------------------------------------
// Map chunks
// -----------------------------------------------------------------------------

struct EMAPc {
    VBHeader header; // tag "EMAP"; version is 0 if il, else 5
    std::mem::Bytes<4> unknown_12_15;
    std::string::SizedString<u16> s1;
    std::string::SizedString<u16> s2;
    std::string::SizedString<u16> s3;
    u16 le;
    ARGB<8, 8, 8, 8> col;
    std::mem::Bytes<4> col_gap;
    u32 constant_1;
    std::mem::Bytes<13> trailing_reserved;
};

struct EEOVc {
    VBHeader header; // tag "EEOV"; version is inventory flag
    std::string::SizedString<u16> s1;
    std::mem::Bytes<11> unknown_gap_a;
    std::string::SizedString<u16> s2;
    std::string::SizedString<u16> s3;
    std::mem::Bytes<9> unknown_gap_b;
    std::string::SizedString<u16> s4;
    u8 ps4;
    if (ps4 == 2) {
        std::mem::Bytes<2> optional_ps4_gap;
    }
    std::string::SizedString<u16> s5;
    s32 inventory_count;
    std::string::SizedString<u16> inventory[inventory_count];
};

struct EME2c {
    VBHeader header; // tag "EME2"
    std::string::SizedString<u16> name;
    Vector4Area24 l;
    u8 constant_1;
    EEOVc eeov;
};

[[static]] struct EMEPc {
    VBHeader header; // tag "EMEP"
    s32 index;
    std::mem::Bytes<57> unknown_16_72;
    Vector3f p;
    std::mem::Bytes<20> unknown_85_104;
    float r;
};

[[static]] struct ECAMc {
    VBHeader header; // tag "ECAM"
    Vector4f p;
};

struct EMEFc {
    VBHeader header; // tag "EMEF"
    std::string::SizedString<u16> s1;
    Vector4Area24 l;
    u8 constant_1;
    std::string::SizedString<u16> s2;
    u8 b;
};

struct EMSDc {
    VBHeader header; // tag "EMSD"
    std::string::SizedString<u16> s1;
    Vector3f l;
    std::string::SizedString<u16> s2;
    u8 constant_1a;
    u8 constant_1b;
};

struct EPTHc {
    VBHeader header; // tag "EPTH"
    std::string::SizedString<u16> name;
    s32 point_count;
    Vector4Area24 points[point_count];
};

struct EMTRc {
    VBHeader header; // tag "EMTR"
    s32 n;
    s32 r_count;
    Vector3f r[r_count];
};

[[static]] struct EBTRc {
    VBHeader header; // tag "EBTR"
    char s[3];
    u8 unknown_15;
    char constant_fff[3];
};

struct ESTRc {
    VBHeader header; // tag "ESTR"
    std::string::SizedString<u16> s;
    std::mem::Bytes<4> trailing_reserved; // table says 18 + sLen
};

struct ETTRc {
    VBHeader header; // tag "ETTR"
    std::string::SizedString<u16> s;
    u8 constant_1a;
    u8 constant_1b;
};

struct ExTRc {
    Tag4 tag;
    match (tag) {
        ("EBTR"): {
            u32 version;
            u32 size;
            char s[3];
            u8 unknown_15;
            char constant_fff[3];
        }
        ("ESTR"): {
            u32 version;
            u32 size;
            std::string::SizedString<u16> s;
            std::mem::Bytes<4> trailing_reserved;
        }
        ("ETTR"): {
            u32 version;
            u32 size;
            std::string::SizedString<u16> s;
            u8 constant_1a;
            u8 constant_1b;
        }
        (_): {}
    }
};

struct TriggerRecord {
    EMTRc emtr;
    ExTRc payload;
};

struct TwoMWTc {
    VBHeader header; // tag "2MWT"
    std::string::SizedString<u16> mpf;
    std::mem::Bytes<13> unknown_14_26;
    u8 not_dark;
    u8 unknown_28;
    u8 not_frozen;
    std::mem::Bytes<124> unknown_30_153;
    s32 chunk_count;
    TwoMWTChunk chunks[chunk_count];
};

[[static]] struct EMFGc {
    VBHeader header; // tag "EMFG"
    u8 enabled;
    type::RGB8 colour;
    float base_height;
    float anim1_speed;
    float anim1_height;
    float total_height;
    float anim2_speed;
    float anim2_height;
    float vertical_offset;
    float max_fog_density;
    std::mem::Bytes<24> unknown_48_71;
};

struct EMNOc {
    VBHeader header; // tag "EMNO"
    float l_x;
    std::mem::Bytes<4> unknown_16_19;
    float l_y;
    std::string::SizedString<u16> tex;
    s32 sr;
};

struct EMNPc {
    VBHeader header; // tag "EMNP"
    s32 chunk_count;
    EMNPChunk chunks[chunk_count];
};

// -----------------------------------------------------------------------------
// Entity / object chunks
// -----------------------------------------------------------------------------

struct EEN2c {
    VBHeader header; // tag "EEN2"
    std::string::SizedString<u16> skl;
    std::string::SizedString<u16> invtex;
    std::string::SizedString<u16> acttex;
    u8 sel;
    std::mem::Bytes<3> post_sel_gap;
    EEOVc eeov;
};

[[static]] struct GENTc {
    VBHeader header; // tag "GENT"
    s32 hover_sr;
    s32 look_sr;
    s32 name_sr;
    s32 unknown_sr;
    std::mem::Bytes<8> gap_28_35;
    s32 max_health;
    s32 start_health;
};

struct GWAMc {
    VBHeaderSignedVersion header; // tag "GWAM"
    s32 anim;
    s32 dmg_type;
    s32 shots_fired;
    s32 f3;
    s32 f4;
    s32 f5;
    s32 range;
    s32 f7;
    s32 f8;
    s32 min_dmg;
    s32 max_dmg;
    u8 bool0;

    if (header.version != 0) {
        s32 f12;
        u8 bool1;
        s32 ap;
        u8 consumed;
        u8 thrown;
    }
    if (header.version >= 2) {
        s32 pose_override;
    }
    if (header.version >= 3) {
        s32 name_sr;
    }
    if (header.version >= 4) {
        std::string::SizedString<u16> veg_name;
    }
    if (header.version >= 5) {
        u8 byte31;
        u8 byte32;
    }
};

struct GCREc {
    VBHeader header; // tag "GCRE"
    s32 special[7];
    std::mem::Bytes<16> unknown_40_55;
    s32 age;
    std::mem::Bytes<12> unknown_60_71;
    s32 skills_count;
    Skill skills[skills_count];
    s32 traits_count;
    s32 traits[traits_count];
    s32 tag_skills_count;
    s32 tag_skills[tag_skills_count];
    std::string::SizedString<u16> port_str;
    std::mem::Bytes<35> unknown_before_sockets;
    Socket hea;
    Socket hai;
    Socket pon;
    Socket mus;
    Socket bea;
    Socket eye;
    Socket bod;
    Socket han;
    Socket fee;
    Socket bac;
    Socket sho;
    Socket van;
    s32 gwam_count;
    std::mem::Bytes<80> unknown_reserved_193_272;
    s32 inventory_count;
    std::string::SizedString<u16> inventory[inventory_count];
    GWAMc gwam[gwam_count];
};

struct GCHRc {
    VBHeader header; // tag "GCHR"
    std::string::SizedString<u16> name;
};

struct GITMc {
    VBHeader header; // tag "GITM"
    s32 type;
    std::mem::Bytes<4> unknown_16_19;
    u8 equip;
    std::mem::Bytes<3> unknown_21_23;
    s32 eqslot;
    Socket hea;
    u8 h_hai;
    u8 h_bea;
    u8 h_mus;
    u8 h_eye;
    u8 h_pon;
    u8 h_van;
    std::mem::Bytes<3> unknown_after_h_flags_a;
    u8 constant_41;
    std::mem::Bytes<4> unknown_after_h_flags_b;
    u8 constant_46;
    std::mem::Bytes<4> unknown_after_h_flags_c;
    u8 constant_51;
    Socket eye;
    u8 constant_after_eye_a;
    std::mem::Bytes<4> unknown_after_eye;
    u8 constant_after_eye_b;
    Socket bod;
    Socket bac;
    Socket han;
    Socket fee;
    Socket sho;
    Socket van;
    u8 constant_before_ihs;
    Socket ihs;
    s32 reload;
};

[[static]] struct GIARc {
    VBHeader header; // tag "GIAR"
    s32 ball_r;
    s32 bio_r;
    s32 elec_r;
    s32 emp_r;
    s32 norm_r;
    s32 heat_r;
    std::mem::Bytes<4> unknown_36_39;
};

[[static]] struct GOBJc {
    VBHeader header; // tag "GOBJ"
    s32 type;
    std::mem::Bytes<24> unknown_16_39;
};

[[static]] struct GDORStatic {
    VBHeader header; // tag "GDOR"
    std::mem::Bytes<12> static_zeros;
};

[[static]] struct GCONStatic {
    VBHeader header; // tag "GCON"; size field says 26, literal is 27 bytes
    std::mem::Bytes<15> static_zeros;
};

struct GIAMc {
    VBHeaderSignedVersion header; // tag "GIAM"
    s32 caliber;
    s32 ammo_extra_238;
    s32 damage_bonus;
    s32 dr_penalty;
    s32 skill_bonus;
    if (header.version >= 1) {
        s32 damage_type;
        s32 ammo_category;
    }
    if (header.version >= 2) {
        s32 ammo_modifier;
        s32 range_bonus;
    }
};

struct GIWPc {
    VBHeaderSignedVersion header; // tag "GIWP"
    s32 weapon_class;
    s32 primary_caliber;
    s32 primary_reload_duration;
    s32 secondary_caliber;
    s32 secondary_reload_duration;
    std::string::SizedString<u16> resource_name;
    s32 unknown_250;
    s32 primary_ammo_loaded;
    s32 primary_ammo_capacity;
    s32 secondary_ammo_loaded;
    s32 secondary_ammo_capacity;
    s32 unknown_255;
    s32 unknown_256;
    s32 attack_modes_count;
    if (header.version != 0) {
        s32 primary_modifier;
        s32 secondary_modifier;
    }
    GWAMc attack_modes[attack_modes_count];
};

// Entity composition helpers

struct CRTEntity {
    EEN2c een2;
    GENTc gent;
    GCREc gcre;
};

struct ITMEntity {
    EEN2c een2;
    GENTc gent;
    GITMc gitm;
};

struct ARMEntity {
    EEN2c een2;
    GENTc gent;
    GITMc gitm;
    GIARc giar;
};

struct AMOEntity {
    EEN2c een2;
    GENTc gent;
    GITMc gitm;
    GIAMc giam;
};

struct WEAEntity {
    EEN2c een2;
    GENTc gent;
    GITMc gitm;
    GIWPc giwp;
};

struct USEEntity {
    EEN2c een2;
    GENTc gent;
    GOBJc gobj;
    match (gobj.type) {
        (1): GDORStatic gdor;
        (2): GCONStatic gcon;
    }
};

// -----------------------------------------------------------------------------
// Generic chunk dispatcher for standalone inspection
// -----------------------------------------------------------------------------

struct VBChunk {
    Tag4 tag;
    match (tag) {
        ("EMAP"): {
            u32 version; u32 size; std::mem::Bytes<4> unknown_12_15;
            std::string::SizedString<u16> s1; std::string::SizedString<u16> s2; std::string::SizedString<u16> s3;
            u16 le; ARGB<8, 8, 8, 8> col;
    std::mem::Bytes<4> col_gap; u32 constant_1; std::mem::Bytes<13> trailing_reserved;
        }
        ("EME2"): { u32 version; u32 size; std::string::SizedString<u16> name; Vector4Area24 l; u8 constant_1; EEOVc eeov; }
        ("EEOV"): {
            u32 version; u32 size; std::string::SizedString<u16> s1; std::mem::Bytes<11> unknown_gap_a;
            std::string::SizedString<u16> s2; std::string::SizedString<u16> s3; std::mem::Bytes<9> unknown_gap_b;
            std::string::SizedString<u16> s4; u8 ps4; if (ps4 == 2) { std::mem::Bytes<2> optional_ps4_gap; }
            std::string::SizedString<u16> s5; s32 inventory_count; std::string::SizedString<u16> inventory[inventory_count];
        }
        ("EMEP"): { u32 version; u32 size; s32 index; std::mem::Bytes<57> unknown_16_72; Vector3f p; std::mem::Bytes<20> unknown_85_104; float r; }
        ("ECAM"): { u32 version; u32 size; Vector4f p; }
        ("EMEF"): { u32 version; u32 size; std::string::SizedString<u16> s1; Vector4Area24 l; u8 constant_1; std::string::SizedString<u16> s2; u8 b; }
        ("EMSD"): { u32 version; u32 size; std::string::SizedString<u16> s1; Vector3f l; std::string::SizedString<u16> s2; u8 constant_1a; u8 constant_1b; }
        ("EPTH"): { u32 version; u32 size; std::string::SizedString<u16> name; s32 point_count; Vector4Area24 points[point_count]; }
        ("EMTR"): { u32 version; u32 size; s32 n; s32 r_count; Vector3f r[r_count]; }
        ("EBTR"): { u32 version; u32 size; char s[3]; u8 unknown_15; char constant_fff[3]; }
        ("ESTR"): { u32 version; u32 size; std::string::SizedString<u16> s; std::mem::Bytes<4> trailing_reserved; }
        ("ETTR"): { u32 version; u32 size; std::string::SizedString<u16> s; u8 constant_1a; u8 constant_1b; }
        ("2MWT"): { u32 version; u32 size; std::string::SizedString<u16> mpf; std::mem::Bytes<13> unknown_14_26; u8 not_dark; u8 unknown_28; u8 not_frozen; std::mem::Bytes<124> unknown_30_153; s32 chunk_count; TwoMWTChunk chunks[chunk_count]; }
        ("EMFG"): { u32 version; u32 size; u8 enabled; type::RGB8 colour; float base_height; float anim1_speed; float anim1_height; float total_height; float anim2_speed; float anim2_height; float vertical_offset; float max_fog_density; std::mem::Bytes<24> unknown_48_71; }
        ("EMNO"): { u32 version; u32 size; float l_x; std::mem::Bytes<4> unknown_16_19; float l_y; std::string::SizedString<u16> tex; s32 sr; }
        ("EMNP"): { u32 version; u32 size; s32 chunk_count; EMNPChunk chunks[chunk_count]; }
        ("EEN2"): { u32 version; u32 size; std::string::SizedString<u16> skl; std::string::SizedString<u16> invtex; std::string::SizedString<u16> acttex; u8 sel; std::mem::Bytes<3> post_sel_gap; EEOVc eeov; }
        ("GENT"): { u32 version; u32 size; s32 hover_sr; s32 look_sr; s32 name_sr; s32 unknown_sr; std::mem::Bytes<8> gap_28_35; s32 max_health; s32 start_health; }
        ("GCRE"): { u32 version; u32 size; s32 special[7]; std::mem::Bytes<16> unknown_40_55; s32 age; std::mem::Bytes<12> unknown_60_71; s32 skills_count; Skill skills[skills_count]; s32 traits_count; s32 traits[traits_count]; s32 tag_skills_count; s32 tag_skills[tag_skills_count]; std::string::SizedString<u16> port_str; std::mem::Bytes<35> unknown_before_sockets; Socket hea; Socket hai; Socket pon; Socket mus; Socket bea; Socket eye; Socket bod; Socket han; Socket fee; Socket bac; Socket sho; Socket van; s32 gwam_count; std::mem::Bytes<80> unknown_reserved_193_272; s32 inventory_count; std::string::SizedString<u16> inventory[inventory_count]; GWAMc gwam[gwam_count]; }
        ("GWAM"): { s32 version; u32 size; s32 anim; s32 dmg_type; s32 shots_fired; s32 f3; s32 f4; s32 f5; s32 range; s32 f7; s32 f8; s32 min_dmg; s32 max_dmg; u8 bool0; if (version != 0) { s32 f12; u8 bool1; s32 ap; u8 consumed; u8 thrown; } if (version >= 2) { s32 pose_override; } if (version >= 3) { s32 name_sr; } if (version >= 4) { std::string::SizedString<u16> veg_name; } if (version >= 5) { u8 byte31; u8 byte32; } }
        ("GCHR"): { u32 version; u32 size; std::string::SizedString<u16> name; }
        ("GITM"): { u32 version; u32 size; s32 type; std::mem::Bytes<4> unknown_16_19; u8 equip; std::mem::Bytes<3> unknown_21_23; s32 eqslot; Socket hea; u8 h_hai; u8 h_bea; u8 h_mus; u8 h_eye; u8 h_pon; u8 h_van; std::mem::Bytes<3> unknown_after_h_flags_a; u8 constant_41; std::mem::Bytes<4> unknown_after_h_flags_b; u8 constant_46; std::mem::Bytes<4> unknown_after_h_flags_c; u8 constant_51; Socket eye; u8 constant_after_eye_a; std::mem::Bytes<4> unknown_after_eye; u8 constant_after_eye_b; Socket bod; Socket bac; Socket han; Socket fee; Socket sho; Socket van; u8 constant_before_ihs; Socket ihs; s32 reload; }
        ("GIAR"): { u32 version; u32 size; s32 ball_r; s32 bio_r; s32 elec_r; s32 emp_r; s32 norm_r; s32 heat_r; std::mem::Bytes<4> unknown_36_39; }
        ("GOBJ"): { u32 version; u32 size; s32 type; std::mem::Bytes<24> unknown_16_39; }
        ("GDOR"): { u32 version; u32 size; std::mem::Bytes<12> static_zeros; }
        ("GCON"): { u32 version; u32 size; std::mem::Bytes<15> static_zeros; }
        ("GIAM"): { s32 version; u32 size; s32 caliber; s32 ammo_extra_238; s32 damage_bonus; s32 dr_penalty; s32 skill_bonus; if (version >= 1) { s32 damage_type; s32 ammo_category; } if (version >= 2) { s32 ammo_modifier; s32 range_bonus; } }
        ("GIWP"): { s32 version; u32 size; s32 weapon_class; s32 primary_caliber; s32 primary_reload_duration; s32 secondary_caliber; s32 secondary_reload_duration; std::string::SizedString<u16> resource_name; s32 unknown_250; s32 primary_ammo_loaded; s32 primary_ammo_capacity; s32 secondary_ammo_loaded; s32 secondary_ammo_capacity; s32 unknown_255; s32 unknown_256; s32 attack_modes_count; if (version != 0) { s32 primary_modifier; s32 secondary_modifier; } GWAMc attack_modes[attack_modes_count]; }
        (_): {}
    }
};

// -----------------------------------------------------------------------------
// VEG binary layout
// -----------------------------------------------------------------------------

struct VEGResourcePayload {
    std::string::SizedString<s16> res_type;
    std::string::SizedString<s16> filename;
};

struct VEGEnumOrStringPayload {
    std::string::SizedString<s16> value;
};

struct VEGVectorPayload { float x; float y; float z; };
struct VEGVector2Payload { float x; float y; };
struct VEGTextureUVsPayload { float x1; float y1; float x2; float y2; };

struct VEGProperty {
    std::string::SizedString<s16> name;
    std::string::SizedString<s16> full_type;
    u32 sentinel; // 0xFFFFFFFF
    s32 payload_byte_length;
    std::mem::Bytes<payload_byte_length> payload_raw;
};

struct VEGPropertyPayload_Int { s32 value; };
struct VEGPropertyPayload_Float { float value; };
struct VEGPropertyPayload_Bool { u8 value; };
struct VEGPropertyPayload_Byte { u8 value; };
struct VEGPropertyPayload_Vector { VEGVectorPayload value; };
struct VEGPropertyPayload_Rotation { VEGVectorPayload value; };
struct VEGPropertyPayload_Vector2 { VEGVector2Payload value; };
struct VEGPropertyPayload_TextureUVs { VEGTextureUVsPayload value; };
struct VEGPropertyPayload_Color { type::RGB8 value; };
struct VEGPropertyPayload_Resource { VEGResourcePayload value; };
struct VEGPropertyPayload_EnumOrString { VEGEnumOrStringPayload value; };

struct VFXBlock {
    char header[8]; // "VFX V1.0"
    std::mem::Bytes<8> unknown_8_15;
    s32 property_count;
    VEGProperty properties[property_count];
};

struct VEGFile {
    char header[8]; // "VEG V1.1"
    s32 vfx_count;
    std::mem::Bytes<12> unknown_12_23;
    VFXBlock vfx_blocks[vfx_count];
    s32 root_val_count;
    VEGProperty root_properties[root_val_count];
};

// -----------------------------------------------------------------------------
// INT / GUI binary layout
// -----------------------------------------------------------------------------

[[static]] struct INTRect {
    s32 x1;
    s32 y1;
    s32 x2;
    s32 y2;
};

struct INTFragment {
    s32 tile_mode;
    s32 i_32;
    s32 i_36;
    s32 i_40;
    s32 i_44;
    s32 i_48;
    std::string::SizedString<s32> texture;
    u32 vtx_tint;
    u32 tint;
    INTRect rect;
};

struct INTStringEntry {
    s32 key;
    if (key == -1) {
        break;
    }
    std::string::SizedString<s32> value;
};

struct INTLabelBlock {
    s32 string_ref;
    std::string::SizedString<s32> font;
    s32 pad_int;
    s32 font_size;
    s32 flag;
    u32 color;
    u8 byte3432;
    u8 byte3433;
    s32 justify_int;
    s32 int3612;
    s32 int3616;
    s32 int3620;
    s32 int3624;
    s32 version_extra;
};

struct INTObj<auto engine_version> {
    s32 magic;
    button_magic = 0xFFFFFFFF;

    if (magic == button_magic && engine_version == 4) {
        std::mem::Bytes<5> button_sounds_head5;
        std::string::SizedString<s32> sound_down;
        std::string::SizedString<s32> sound_up;
        std::string::SizedString<s32> sound_hover;
    }

    if (magic == button_magic && engine_version < 4) {
        s32 button_rev12_int;
    }

    INTRect rect1;
    std::string::SizedString<s32> name;
    std::mem::Bytes<3> post_name3;
    std::string::SizedString<s32> ini;
    u32 color_tint;
    INTRect rect2;

    if (engine_version >= 2) {
        u8 v2_byte;
        s32 v2_int;
    }

    if (engine_version >= 3) {
        std::string::SizedString<s32> v3_str1;
        s32 v3_int1;
        std::string::SizedString<s32> v3_str2;
        s32 v3_int2;
        std::string::SizedString<s32> v3_str3;
    }

    INTFragment fragments[9];
    INTStringEntry strings[1024];
    s32 child_count;
    INTObj<engine_version> children[child_count];
};

struct INTFile {
    char signature_prefix[7]; // "GUI V1."
    char revision_digit[1];
    engine_version = (revision_digit[0] - '0') + 1;
    std::string::SizedString<s32> name;
    u8 header_pad;
    s32 header_int;
    INTObj<engine_version> objects[header_int];
};

// -----------------------------------------------------------------------------
// Entry points. Uncomment one.
// -----------------------------------------------------------------------------

// VBChunk chunk @ 0x0;
// EMAPc emap @ 0x0;
// EME2c eme2 @ 0x0;
// EEOVc eeov @ 0x0;
// EEN2c een2 @ 0x0;
// GCREc gcre @ 0x0;
// GITMc gitm @ 0x0;
// GIWPc giwp @ 0x0;
// VEGFile veg @ 0x0;
// INTFile int_file @ 0x0;

} // namespace vb
