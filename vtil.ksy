meta:
  id: vtil
  file-extension: vtil
  endian: le
enums:
  architecture_identifier:
    0: amd64
    1: arm64
    2: virtual
seq:
  - id: header
    type: header
  - id: entry_point
    type: entry_point
  - id: routine_convention
    type: routine_convention
  - id: subroutine_convention
    type: subroutine_convention
  - id: spec_subroutine_conventions
    type: spec_subroutine_conventions
  - id: explored_blocks
    type: explored_blocks
types:
  register_desc:
    seq:
      - id: flags
        type: u8
      - id: combined_id
        type: u8
      - id: bit_count
        type: s4
      - id: bit_offset
        type: s4
  operand:
    seq:
      - id: sp_index
        type: u4
      - id: operand
        type:
          switch-on: sp_index
          cases:
            0: u8 # imm
            1: register_desc # reg
  instruction:
    seq:
      - id: name
        type: str
        terminator: 0
        encoding: UTF-8
      - id: operands_amount
        type: u4
      - id: operands
        type: operand
        repeat: expr
        repeat-expr: operands_amount
      - id: vip
        type: u8
      - id: sp_offset
        type: s8
      - id: sp_index
        type: u8
      - id: sp_reset
        type: u1
  basic_block:
    seq:
      - id: entry_vip
        type: u8
      - id: sp_offset
        type: s8
      - id: sp_index
        type: u8
      - id: last_temporary_index
        type: u8
      - id: instruction_amount
        type: u4
      - id: instructions
        type: instruction
        repeat: expr
        repeat-expr: instruction_amount
  spec_subroutine_convention:
    seq:
      - id: vip
        type: u8
      - id: volatile_registers_count
        type: u4
      - id: volatile_registers
        type: register_desc
        repeat: expr
        repeat-expr: volatile_registers_count
      - id: param_registers_count
        type: u4
      - id: param_registers
        type: register_desc
        repeat: expr
        repeat-expr: param_registers_count
      - id: retval_registers_count
        type: u4
      - id: retval_registers
        type: register_desc
        repeat: expr
        repeat-expr: retval_registers_count
      - id: frame_register
        type: register_desc
      - id: shadow_space
        type: u8
      - id: purge_stack
        type: u1 # or use b1 but needs b7 pad
  header:
    seq:
      - id: magic1
        type: u4
      - id: arch_id
        type: u1
        enum: architecture_identifier
      - id: zero_pad
        type: u1
      - id: magic2
        type: u2
  entry_point:
    seq:
      - id: entry_vip
        type: u8
  routine_convention:
    seq:
      - id: volatile_registers_count
        type: u4
      - id: volatile_registers
        type: register_desc
        repeat: expr
        repeat-expr: volatile_registers_count
      - id: param_registers_count
        type: u4
      - id: param_registers
        type: register_desc
        repeat: expr
        repeat-expr: param_registers_count
      - id: retval_registers_count
        type: u4
      - id: retval_registers
        type: register_desc
        repeat: expr
        repeat-expr: retval_registers_count
      - id: frame_register
        type: register_desc
      - id: shadow_space
        type: u8
      - id: purge_stack
        type: u1 # or use b1 but needs b7 pad
  subroutine_convention:
    seq:
      - id: volatile_registers_count
        type: u4
      - id: volatile_registers
        type: register_desc
        repeat: expr
        repeat-expr: volatile_registers_count
      - id: param_registers_count
        type: u4
      - id: param_registers
        type: register_desc
        repeat: expr
        repeat-expr: param_registers_count
      - id: retval_registers_count
        type: u4
      - id: retval_registers
        type: register_desc
        repeat: expr
        repeat-expr: retval_registers_count
      - id: frame_register
        type: register_desc
      - id: shadow_space
        type: u8
      - id: purge_stack
        type: u1 # or use b1 but needs b7 pad
  spec_subroutine_conventions:
    seq:
      - id: spec_subroutine_conventions_amount
        type: u4
      - id: spec_subroutine_convention
        type: subroutine_convention
        repeat: expr
        repeat-expr: spec_subroutine_conventions_amount
  explored_blocks:
    seq:
      - id: explored_blocks_amount
        type: u4
      - id: explored_block
        type: basic_block
        repeat: expr
        repeat-expr: explored_blocks_amount