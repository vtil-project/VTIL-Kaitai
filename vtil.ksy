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
        type: b1