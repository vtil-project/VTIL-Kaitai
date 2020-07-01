// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "vtil.h"



vtil_t::vtil_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void vtil_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    m_entrypoint = new entrypoint_t(m__io, this, m__root);
    m_routine_convention = new routine_convention_t(m__io, this, m__root);
    m_subroutine_convention = new subroutine_convention_t(m__io, this, m__root);
    m_spec_subroutine_conventions = new spec_subroutine_conventions_t(m__io, this, m__root);
    m_explored_blocks = new explored_blocks_t(m__io, this, m__root);
}

vtil_t::~vtil_t() {
    delete m_header;
    delete m_entrypoint;
    delete m_routine_convention;
    delete m_subroutine_convention;
    delete m_spec_subroutine_conventions;
    delete m_explored_blocks;
}

vtil_t::subroutine_convention_t::subroutine_convention_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vtil_t::subroutine_convention_t::_read() {
    m_volatile_registers_count = m__io->read_u4le();
    int l_volatile_registers = volatile_registers_count();
    m_volatile_registers = new std::vector<register_desc_t*>();
    m_volatile_registers->reserve(l_volatile_registers);
    for (int i = 0; i < l_volatile_registers; i++) {
        m_volatile_registers->push_back(new register_desc_t(m__io, this, m__root));
    }
    m_param_registers_count = m__io->read_u4le();
    int l_param_registers = param_registers_count();
    m_param_registers = new std::vector<register_desc_t*>();
    m_param_registers->reserve(l_param_registers);
    for (int i = 0; i < l_param_registers; i++) {
        m_param_registers->push_back(new register_desc_t(m__io, this, m__root));
    }
    m_retval_registers_count = m__io->read_u4le();
    int l_retval_registers = retval_registers_count();
    m_retval_registers = new std::vector<register_desc_t*>();
    m_retval_registers->reserve(l_retval_registers);
    for (int i = 0; i < l_retval_registers; i++) {
        m_retval_registers->push_back(new register_desc_t(m__io, this, m__root));
    }
    m_frame_register = new register_desc_t(m__io, this, m__root);
    m_shadow_space = m__io->read_u8le();
    m_purge_stack = m__io->read_u1();
}

vtil_t::subroutine_convention_t::~subroutine_convention_t() {
    for (std::vector<register_desc_t*>::iterator it = m_volatile_registers->begin(); it != m_volatile_registers->end(); ++it) {
        delete *it;
    }
    delete m_volatile_registers;
    for (std::vector<register_desc_t*>::iterator it = m_param_registers->begin(); it != m_param_registers->end(); ++it) {
        delete *it;
    }
    delete m_param_registers;
    for (std::vector<register_desc_t*>::iterator it = m_retval_registers->begin(); it != m_retval_registers->end(); ++it) {
        delete *it;
    }
    delete m_retval_registers;
    delete m_frame_register;
}

vtil_t::operand_t::operand_t(kaitai::kstream* p__io, vtil_t::instruction_t* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vtil_t::operand_t::_read() {
    m_sp_index = m__io->read_u4le();
    n_operand = true;
    switch (sp_index()) {
    case 0: {
        n_operand = false;
        m_operand = new immediate_desc_t(m__io, this, m__root);
        break;
    }
    case 1: {
        n_operand = false;
        m_operand = new register_desc_t(m__io, this, m__root);
        break;
    }
    }
}

vtil_t::operand_t::~operand_t() {
    if (!n_operand) {
        delete m_operand;
    }
}

vtil_t::register_desc_t::register_desc_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vtil_t::register_desc_t::_read() {
    m_flags = m__io->read_u8le();
    m_combined_id = m__io->read_u8le();
    m_bit_count = m__io->read_s4le();
    m_bit_offset = m__io->read_s4le();
}

vtil_t::register_desc_t::~register_desc_t() {
}

vtil_t::routine_convention_t::routine_convention_t(kaitai::kstream* p__io, vtil_t* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vtil_t::routine_convention_t::_read() {
    m_volatile_registers_count = m__io->read_u4le();
    int l_volatile_registers = volatile_registers_count();
    m_volatile_registers = new std::vector<register_desc_t*>();
    m_volatile_registers->reserve(l_volatile_registers);
    for (int i = 0; i < l_volatile_registers; i++) {
        m_volatile_registers->push_back(new register_desc_t(m__io, this, m__root));
    }
    m_param_registers_count = m__io->read_u4le();
    int l_param_registers = param_registers_count();
    m_param_registers = new std::vector<register_desc_t*>();
    m_param_registers->reserve(l_param_registers);
    for (int i = 0; i < l_param_registers; i++) {
        m_param_registers->push_back(new register_desc_t(m__io, this, m__root));
    }
    m_retval_registers_count = m__io->read_u4le();
    int l_retval_registers = retval_registers_count();
    m_retval_registers = new std::vector<register_desc_t*>();
    m_retval_registers->reserve(l_retval_registers);
    for (int i = 0; i < l_retval_registers; i++) {
        m_retval_registers->push_back(new register_desc_t(m__io, this, m__root));
    }
    m_frame_register = new register_desc_t(m__io, this, m__root);
    m_shadow_space = m__io->read_u8le();
    m_purge_stack = m__io->read_u1();
}

vtil_t::routine_convention_t::~routine_convention_t() {
    for (std::vector<register_desc_t*>::iterator it = m_volatile_registers->begin(); it != m_volatile_registers->end(); ++it) {
        delete *it;
    }
    delete m_volatile_registers;
    for (std::vector<register_desc_t*>::iterator it = m_param_registers->begin(); it != m_param_registers->end(); ++it) {
        delete *it;
    }
    delete m_param_registers;
    for (std::vector<register_desc_t*>::iterator it = m_retval_registers->begin(); it != m_retval_registers->end(); ++it) {
        delete *it;
    }
    delete m_retval_registers;
    delete m_frame_register;
}

vtil_t::instruction_t::instruction_t(kaitai::kstream* p__io, vtil_t::basic_block_t* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vtil_t::instruction_t::_read() {
    m_name_len = m__io->read_u4le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(name_len()), std::string("UTF-8"));
    m_operands_amount = m__io->read_u4le();
    int l_operands = operands_amount();
    m_operands = new std::vector<operand_t*>();
    m_operands->reserve(l_operands);
    for (int i = 0; i < l_operands; i++) {
        m_operands->push_back(new operand_t(m__io, this, m__root));
    }
    m_vip = m__io->read_u8le();
    m_sp_offset = m__io->read_s8le();
    m_sp_index = m__io->read_u4le();
    m_sp_reset = m__io->read_u1();
}

vtil_t::instruction_t::~instruction_t() {
    for (std::vector<operand_t*>::iterator it = m_operands->begin(); it != m_operands->end(); ++it) {
        delete *it;
    }
    delete m_operands;
}

vtil_t::immediate_desc_t::immediate_desc_t(kaitai::kstream* p__io, vtil_t::operand_t* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vtil_t::immediate_desc_t::_read() {
    m_imm = m__io->read_u8le();
    m_bitcount = m__io->read_u4le();
}

vtil_t::immediate_desc_t::~immediate_desc_t() {
}

vtil_t::explored_blocks_t::explored_blocks_t(kaitai::kstream* p__io, vtil_t* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vtil_t::explored_blocks_t::_read() {
    m_basic_blocks_amount = m__io->read_u4le();
    int l_basic_blocks = basic_blocks_amount();
    m_basic_blocks = new std::vector<basic_block_t*>();
    m_basic_blocks->reserve(l_basic_blocks);
    for (int i = 0; i < l_basic_blocks; i++) {
        m_basic_blocks->push_back(new basic_block_t(m__io, this, m__root));
    }
}

vtil_t::explored_blocks_t::~explored_blocks_t() {
    for (std::vector<basic_block_t*>::iterator it = m_basic_blocks->begin(); it != m_basic_blocks->end(); ++it) {
        delete *it;
    }
    delete m_basic_blocks;
}

vtil_t::spec_subroutine_conventions_t::spec_subroutine_conventions_t(kaitai::kstream* p__io, vtil_t* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vtil_t::spec_subroutine_conventions_t::_read() {
    m_spec_subroutine_conventions_amount = m__io->read_u4le();
    int l_spec_subroutine_convention = spec_subroutine_conventions_amount();
    m_spec_subroutine_convention = new std::vector<subroutine_convention_t*>();
    m_spec_subroutine_convention->reserve(l_spec_subroutine_convention);
    for (int i = 0; i < l_spec_subroutine_convention; i++) {
        m_spec_subroutine_convention->push_back(new subroutine_convention_t(m__io, this, m__root));
    }
}

vtil_t::spec_subroutine_conventions_t::~spec_subroutine_conventions_t() {
    for (std::vector<subroutine_convention_t*>::iterator it = m_spec_subroutine_convention->begin(); it != m_spec_subroutine_convention->end(); ++it) {
        delete *it;
    }
    delete m_spec_subroutine_convention;
}

vtil_t::spec_subroutine_convention_t::spec_subroutine_convention_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vtil_t::spec_subroutine_convention_t::_read() {
    m_vip = m__io->read_u8le();
    m_volatile_registers_count = m__io->read_u4le();
    int l_volatile_registers = volatile_registers_count();
    m_volatile_registers = new std::vector<register_desc_t*>();
    m_volatile_registers->reserve(l_volatile_registers);
    for (int i = 0; i < l_volatile_registers; i++) {
        m_volatile_registers->push_back(new register_desc_t(m__io, this, m__root));
    }
    m_param_registers_count = m__io->read_u4le();
    int l_param_registers = param_registers_count();
    m_param_registers = new std::vector<register_desc_t*>();
    m_param_registers->reserve(l_param_registers);
    for (int i = 0; i < l_param_registers; i++) {
        m_param_registers->push_back(new register_desc_t(m__io, this, m__root));
    }
    m_retval_registers_count = m__io->read_u4le();
    int l_retval_registers = retval_registers_count();
    m_retval_registers = new std::vector<register_desc_t*>();
    m_retval_registers->reserve(l_retval_registers);
    for (int i = 0; i < l_retval_registers; i++) {
        m_retval_registers->push_back(new register_desc_t(m__io, this, m__root));
    }
    m_frame_register = new register_desc_t(m__io, this, m__root);
    m_shadow_space = m__io->read_u8le();
    m_purge_stack = m__io->read_u1();
}

vtil_t::spec_subroutine_convention_t::~spec_subroutine_convention_t() {
    for (std::vector<register_desc_t*>::iterator it = m_volatile_registers->begin(); it != m_volatile_registers->end(); ++it) {
        delete *it;
    }
    delete m_volatile_registers;
    for (std::vector<register_desc_t*>::iterator it = m_param_registers->begin(); it != m_param_registers->end(); ++it) {
        delete *it;
    }
    delete m_param_registers;
    for (std::vector<register_desc_t*>::iterator it = m_retval_registers->begin(); it != m_retval_registers->end(); ++it) {
        delete *it;
    }
    delete m_retval_registers;
    delete m_frame_register;
}

vtil_t::entrypoint_t::entrypoint_t(kaitai::kstream* p__io, vtil_t* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vtil_t::entrypoint_t::_read() {
    m_entry_vip = m__io->read_u8le();
}

vtil_t::entrypoint_t::~entrypoint_t() {
}

vtil_t::basic_block_t::basic_block_t(kaitai::kstream* p__io, vtil_t::explored_blocks_t* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vtil_t::basic_block_t::_read() {
    m_entry_vip = m__io->read_u8le();
    m_sp_offset = m__io->read_s8le();
    m_sp_index = m__io->read_u4le();
    m_last_temporary_index = m__io->read_u4le();
    m_instruction_amount = m__io->read_u4le();
    int l_instructions = instruction_amount();
    m_instructions = new std::vector<instruction_t*>();
    m_instructions->reserve(l_instructions);
    for (int i = 0; i < l_instructions; i++) {
        m_instructions->push_back(new instruction_t(m__io, this, m__root));
    }
    m_prev_vip_amount = m__io->read_u4le();
    int l_prev_vip = prev_vip_amount();
    m_prev_vip = new std::vector<uint64_t>();
    m_prev_vip->reserve(l_prev_vip);
    for (int i = 0; i < l_prev_vip; i++) {
        m_prev_vip->push_back(m__io->read_u8le());
    }
    m_next_vip_amount = m__io->read_u4le();
    int l_next_vip = next_vip_amount();
    m_next_vip = new std::vector<uint64_t>();
    m_next_vip->reserve(l_next_vip);
    for (int i = 0; i < l_next_vip; i++) {
        m_next_vip->push_back(m__io->read_u8le());
    }
}

vtil_t::basic_block_t::~basic_block_t() {
    for (std::vector<instruction_t*>::iterator it = m_instructions->begin(); it != m_instructions->end(); ++it) {
        delete *it;
    }
    delete m_instructions;
    delete m_prev_vip;
    delete m_next_vip;
}

vtil_t::header_t::header_t(kaitai::kstream* p__io, vtil_t* p__parent, vtil_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void vtil_t::header_t::_read() {
    m_magic1 = m__io->read_u4le();
    m_arch_id = static_cast<vtil_t::architecture_identifier_t>(m__io->read_u1());
    m_zero_pad = m__io->read_u1();
    m_magic2 = m__io->read_u2le();
}

vtil_t::header_t::~header_t() {
}
