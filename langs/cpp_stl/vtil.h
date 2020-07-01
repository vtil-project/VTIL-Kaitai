#ifndef VTIL_H_
#define VTIL_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class vtil_t : public kaitai::kstruct {

public:
    class subroutine_convention_t;
    class operand_t;
    class register_desc_t;
    class routine_convention_t;
    class instruction_t;
    class immediate_desc_t;
    class explored_blocks_t;
    class spec_subroutine_conventions_t;
    class spec_subroutine_convention_t;
    class basic_block_t;
    class entry_point_t;
    class header_t;

    enum architecture_identifier_t {
        ARCHITECTURE_IDENTIFIER_AMD64 = 0,
        ARCHITECTURE_IDENTIFIER_ARM64 = 1,
        ARCHITECTURE_IDENTIFIER_VIRTUAL = 2
    };

    vtil_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, vtil_t* p__root = 0);

private:
    void _read();

public:
    ~vtil_t();

    class subroutine_convention_t : public kaitai::kstruct {

    public:

        subroutine_convention_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, vtil_t* p__root = 0);

    private:
        void _read();

    public:
        ~subroutine_convention_t();

    private:
        uint32_t m_volatile_registers_count;
        std::vector<register_desc_t*>* m_volatile_registers;
        uint32_t m_param_registers_count;
        std::vector<register_desc_t*>* m_param_registers;
        uint32_t m_retval_registers_count;
        std::vector<register_desc_t*>* m_retval_registers;
        register_desc_t* m_frame_register;
        uint64_t m_shadow_space;
        uint8_t m_purge_stack;
        vtil_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t volatile_registers_count() const { return m_volatile_registers_count; }
        std::vector<register_desc_t*>* volatile_registers() const { return m_volatile_registers; }
        uint32_t param_registers_count() const { return m_param_registers_count; }
        std::vector<register_desc_t*>* param_registers() const { return m_param_registers; }
        uint32_t retval_registers_count() const { return m_retval_registers_count; }
        std::vector<register_desc_t*>* retval_registers() const { return m_retval_registers; }
        register_desc_t* frame_register() const { return m_frame_register; }
        uint64_t shadow_space() const { return m_shadow_space; }
        uint8_t purge_stack() const { return m_purge_stack; }
        vtil_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class operand_t : public kaitai::kstruct {

    public:

        operand_t(kaitai::kstream* p__io, vtil_t::instruction_t* p__parent = 0, vtil_t* p__root = 0);

    private:
        void _read();

    public:
        ~operand_t();

    private:
        uint32_t m_sp_index;
        kaitai::kstruct* m_operand;
        bool n_operand;

    public:
        bool _is_null_operand() { operand(); return n_operand; };

    private:
        vtil_t* m__root;
        vtil_t::instruction_t* m__parent;

    public:
        uint32_t sp_index() const { return m_sp_index; }
        kaitai::kstruct* operand() const { return m_operand; }
        vtil_t* _root() const { return m__root; }
        vtil_t::instruction_t* _parent() const { return m__parent; }
    };

    class register_desc_t : public kaitai::kstruct {

    public:

        register_desc_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, vtil_t* p__root = 0);

    private:
        void _read();

    public:
        ~register_desc_t();

    private:
        uint64_t m_flags;
        uint64_t m_combined_id;
        int32_t m_bit_count;
        int32_t m_bit_offset;
        vtil_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint64_t flags() const { return m_flags; }
        uint64_t combined_id() const { return m_combined_id; }
        int32_t bit_count() const { return m_bit_count; }
        int32_t bit_offset() const { return m_bit_offset; }
        vtil_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class routine_convention_t : public kaitai::kstruct {

    public:

        routine_convention_t(kaitai::kstream* p__io, vtil_t* p__parent = 0, vtil_t* p__root = 0);

    private:
        void _read();

    public:
        ~routine_convention_t();

    private:
        uint32_t m_volatile_registers_count;
        std::vector<register_desc_t*>* m_volatile_registers;
        uint32_t m_param_registers_count;
        std::vector<register_desc_t*>* m_param_registers;
        uint32_t m_retval_registers_count;
        std::vector<register_desc_t*>* m_retval_registers;
        register_desc_t* m_frame_register;
        uint64_t m_shadow_space;
        uint8_t m_purge_stack;
        vtil_t* m__root;
        vtil_t* m__parent;

    public:
        uint32_t volatile_registers_count() const { return m_volatile_registers_count; }
        std::vector<register_desc_t*>* volatile_registers() const { return m_volatile_registers; }
        uint32_t param_registers_count() const { return m_param_registers_count; }
        std::vector<register_desc_t*>* param_registers() const { return m_param_registers; }
        uint32_t retval_registers_count() const { return m_retval_registers_count; }
        std::vector<register_desc_t*>* retval_registers() const { return m_retval_registers; }
        register_desc_t* frame_register() const { return m_frame_register; }
        uint64_t shadow_space() const { return m_shadow_space; }
        uint8_t purge_stack() const { return m_purge_stack; }
        vtil_t* _root() const { return m__root; }
        vtil_t* _parent() const { return m__parent; }
    };

    class instruction_t : public kaitai::kstruct {

    public:

        instruction_t(kaitai::kstream* p__io, vtil_t::basic_block_t* p__parent = 0, vtil_t* p__root = 0);

    private:
        void _read();

    public:
        ~instruction_t();

    private:
        uint32_t m_name_len;
        std::string m_name;
        uint32_t m_operands_amount;
        std::vector<operand_t*>* m_operands;
        uint64_t m_vip;
        int64_t m_sp_offset;
        uint32_t m_sp_index;
        uint8_t m_sp_reset;
        vtil_t* m__root;
        vtil_t::basic_block_t* m__parent;

    public:
        uint32_t name_len() const { return m_name_len; }
        std::string name() const { return m_name; }
        uint32_t operands_amount() const { return m_operands_amount; }
        std::vector<operand_t*>* operands() const { return m_operands; }
        uint64_t vip() const { return m_vip; }
        int64_t sp_offset() const { return m_sp_offset; }
        uint32_t sp_index() const { return m_sp_index; }
        uint8_t sp_reset() const { return m_sp_reset; }
        vtil_t* _root() const { return m__root; }
        vtil_t::basic_block_t* _parent() const { return m__parent; }
    };

    class immediate_desc_t : public kaitai::kstruct {

    public:

        immediate_desc_t(kaitai::kstream* p__io, vtil_t::operand_t* p__parent = 0, vtil_t* p__root = 0);

    private:
        void _read();

    public:
        ~immediate_desc_t();

    private:
        uint64_t m_imm;
        uint32_t m_bitcount;
        vtil_t* m__root;
        vtil_t::operand_t* m__parent;

    public:
        uint64_t imm() const { return m_imm; }
        uint32_t bitcount() const { return m_bitcount; }
        vtil_t* _root() const { return m__root; }
        vtil_t::operand_t* _parent() const { return m__parent; }
    };

    class explored_blocks_t : public kaitai::kstruct {

    public:

        explored_blocks_t(kaitai::kstream* p__io, vtil_t* p__parent = 0, vtil_t* p__root = 0);

    private:
        void _read();

    public:
        ~explored_blocks_t();

    private:
        uint32_t m_explored_blocks_amount;
        std::vector<basic_block_t*>* m_explored_block;
        vtil_t* m__root;
        vtil_t* m__parent;

    public:
        uint32_t explored_blocks_amount() const { return m_explored_blocks_amount; }
        std::vector<basic_block_t*>* explored_block() const { return m_explored_block; }
        vtil_t* _root() const { return m__root; }
        vtil_t* _parent() const { return m__parent; }
    };

    class spec_subroutine_conventions_t : public kaitai::kstruct {

    public:

        spec_subroutine_conventions_t(kaitai::kstream* p__io, vtil_t* p__parent = 0, vtil_t* p__root = 0);

    private:
        void _read();

    public:
        ~spec_subroutine_conventions_t();

    private:
        uint32_t m_spec_subroutine_conventions_amount;
        std::vector<subroutine_convention_t*>* m_spec_subroutine_convention;
        vtil_t* m__root;
        vtil_t* m__parent;

    public:
        uint32_t spec_subroutine_conventions_amount() const { return m_spec_subroutine_conventions_amount; }
        std::vector<subroutine_convention_t*>* spec_subroutine_convention() const { return m_spec_subroutine_convention; }
        vtil_t* _root() const { return m__root; }
        vtil_t* _parent() const { return m__parent; }
    };

    class spec_subroutine_convention_t : public kaitai::kstruct {

    public:

        spec_subroutine_convention_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, vtil_t* p__root = 0);

    private:
        void _read();

    public:
        ~spec_subroutine_convention_t();

    private:
        uint64_t m_vip;
        uint32_t m_volatile_registers_count;
        std::vector<register_desc_t*>* m_volatile_registers;
        uint32_t m_param_registers_count;
        std::vector<register_desc_t*>* m_param_registers;
        uint32_t m_retval_registers_count;
        std::vector<register_desc_t*>* m_retval_registers;
        register_desc_t* m_frame_register;
        uint64_t m_shadow_space;
        uint8_t m_purge_stack;
        vtil_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint64_t vip() const { return m_vip; }
        uint32_t volatile_registers_count() const { return m_volatile_registers_count; }
        std::vector<register_desc_t*>* volatile_registers() const { return m_volatile_registers; }
        uint32_t param_registers_count() const { return m_param_registers_count; }
        std::vector<register_desc_t*>* param_registers() const { return m_param_registers; }
        uint32_t retval_registers_count() const { return m_retval_registers_count; }
        std::vector<register_desc_t*>* retval_registers() const { return m_retval_registers; }
        register_desc_t* frame_register() const { return m_frame_register; }
        uint64_t shadow_space() const { return m_shadow_space; }
        uint8_t purge_stack() const { return m_purge_stack; }
        vtil_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class basic_block_t : public kaitai::kstruct {

    public:

        basic_block_t(kaitai::kstream* p__io, vtil_t::explored_blocks_t* p__parent = 0, vtil_t* p__root = 0);

    private:
        void _read();

    public:
        ~basic_block_t();

    private:
        uint64_t m_entry_vip;
        int64_t m_sp_offset;
        uint32_t m_sp_index;
        uint32_t m_last_temporary_index;
        uint32_t m_instruction_amount;
        std::vector<instruction_t*>* m_instructions;
        uint32_t m_prev_vip_amount;
        std::vector<uint64_t>* m_prev_vip;
        uint32_t m_next_vip_amount;
        std::vector<uint64_t>* m_next_vip;
        vtil_t* m__root;
        vtil_t::explored_blocks_t* m__parent;

    public:
        uint64_t entry_vip() const { return m_entry_vip; }
        int64_t sp_offset() const { return m_sp_offset; }
        uint32_t sp_index() const { return m_sp_index; }
        uint32_t last_temporary_index() const { return m_last_temporary_index; }
        uint32_t instruction_amount() const { return m_instruction_amount; }
        std::vector<instruction_t*>* instructions() const { return m_instructions; }
        uint32_t prev_vip_amount() const { return m_prev_vip_amount; }
        std::vector<uint64_t>* prev_vip() const { return m_prev_vip; }
        uint32_t next_vip_amount() const { return m_next_vip_amount; }
        std::vector<uint64_t>* next_vip() const { return m_next_vip; }
        vtil_t* _root() const { return m__root; }
        vtil_t::explored_blocks_t* _parent() const { return m__parent; }
    };

    class entry_point_t : public kaitai::kstruct {

    public:

        entry_point_t(kaitai::kstream* p__io, vtil_t* p__parent = 0, vtil_t* p__root = 0);

    private:
        void _read();

    public:
        ~entry_point_t();

    private:
        uint64_t m_entry_vip;
        vtil_t* m__root;
        vtil_t* m__parent;

    public:
        uint64_t entry_vip() const { return m_entry_vip; }
        vtil_t* _root() const { return m__root; }
        vtil_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, vtil_t* p__parent = 0, vtil_t* p__root = 0);

    private:
        void _read();

    public:
        ~header_t();

    private:
        uint32_t m_magic1;
        architecture_identifier_t m_arch_id;
        uint8_t m_zero_pad;
        uint16_t m_magic2;
        vtil_t* m__root;
        vtil_t* m__parent;

    public:
        uint32_t magic1() const { return m_magic1; }
        architecture_identifier_t arch_id() const { return m_arch_id; }
        uint8_t zero_pad() const { return m_zero_pad; }
        uint16_t magic2() const { return m_magic2; }
        vtil_t* _root() const { return m__root; }
        vtil_t* _parent() const { return m__parent; }
    };

private:
    header_t* m_header;
    entry_point_t* m_entry_point;
    routine_convention_t* m_routine_convention;
    subroutine_convention_t* m_subroutine_convention;
    spec_subroutine_conventions_t* m_spec_subroutine_conventions;
    explored_blocks_t* m_explored_blocks;
    vtil_t* m__root;
    kaitai::kstruct* m__parent;

public:
    header_t* header() const { return m_header; }
    entry_point_t* entry_point() const { return m_entry_point; }
    routine_convention_t* routine_convention() const { return m_routine_convention; }
    subroutine_convention_t* subroutine_convention() const { return m_subroutine_convention; }
    spec_subroutine_conventions_t* spec_subroutine_conventions() const { return m_spec_subroutine_conventions; }
    explored_blocks_t* explored_blocks() const { return m_explored_blocks; }
    vtil_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // VTIL_H_
