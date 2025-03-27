// A list of common handcrafted C types and C++ class layouts.
// !! This file is erased by JEB after an update. Create your own additional header files to define custom types.
//
// Note that there are multiple ways to to create type definitions that can be imported by JEB, such as:
// - Create a typelib binary file: more complicated at first, less flexibility if the types need to be modified regularly,
//   but better for performance and reuse. Refer to the custom sub-directory for details.
// - Craft types via the ITypeManager object in the API: handy when scripting and creating types dynamically, not 
//   practical for types to be used and reused throughout projects
// - Define and import types from C definitions (such as the ones below), using the TypeStringParser parser object or one of
//   its wrappers (e.g. in the GUI client, via the 'Native, Type Editor, Import...' menu entry).
//   The easiest option to quickly define and use custom types; they are not compiled into typelib files, which also make them
//   easy to tweak.
//

// common std::string<<char>> implementation (clang's debug/release on common arch)
#pragma pack(push,1)
typedef struct char_str {
    union {
        // small string (<11 or <23 chars) is in place, does not require alloc
        struct small_string {
            unsigned char len_mangled;  // length*2 (therefore, the LSB is cleared, indicating a small string)
            char data[1];  // 32-bit bit arch: 11 bytes; 64-bit arch: 23 bytes
        } ss;
        // any string requires an alloc
        struct any_string {
            size_t len_mangled;  // set to the allocated length +1 (therefore, the LSB is set, indicating a regular string)
            size_t len;  // allocated length is ((n+0x10)&~0xF)
            char* ptr;
        } s;
    } u;
} char_str;
#pragma pack(pop)
