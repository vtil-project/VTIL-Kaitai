# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Vtil < Kaitai::Struct::Struct

  ARCHITECTURE_IDENTIFIER = {
    0 => :architecture_identifier_amd64,
    1 => :architecture_identifier_arm64,
    2 => :architecture_identifier_virtual,
  }
  I__ARCHITECTURE_IDENTIFIER = ARCHITECTURE_IDENTIFIER.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = Header.new(@_io, self, @_root)
    @entrypoint = Entrypoint.new(@_io, self, @_root)
    @routine_convention = RoutineConvention.new(@_io, self, @_root)
    @subroutine_convention = SubroutineConvention.new(@_io, self, @_root)
    @spec_subroutine_conventions = SpecSubroutineConventions.new(@_io, self, @_root)
    @explored_blocks = ExploredBlocks.new(@_io, self, @_root)
    self
  end
  class SubroutineConvention < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @volatile_registers_count = @_io.read_u4le
      @volatile_registers = Array.new(volatile_registers_count)
      (volatile_registers_count).times { |i|
        @volatile_registers[i] = RegisterDesc.new(@_io, self, @_root)
      }
      @param_registers_count = @_io.read_u4le
      @param_registers = Array.new(param_registers_count)
      (param_registers_count).times { |i|
        @param_registers[i] = RegisterDesc.new(@_io, self, @_root)
      }
      @retval_registers_count = @_io.read_u4le
      @retval_registers = Array.new(retval_registers_count)
      (retval_registers_count).times { |i|
        @retval_registers[i] = RegisterDesc.new(@_io, self, @_root)
      }
      @frame_register = RegisterDesc.new(@_io, self, @_root)
      @shadow_space = @_io.read_u8le
      @purge_stack = @_io.read_u1
      self
    end
    attr_reader :volatile_registers_count
    attr_reader :volatile_registers
    attr_reader :param_registers_count
    attr_reader :param_registers
    attr_reader :retval_registers_count
    attr_reader :retval_registers
    attr_reader :frame_register
    attr_reader :shadow_space
    attr_reader :purge_stack
  end
  class Operand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sp_index = @_io.read_u4le
      case sp_index
      when 0
        @operand = ImmediateDesc.new(@_io, self, @_root)
      when 1
        @operand = RegisterDesc.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :sp_index
    attr_reader :operand
  end
  class RegisterDesc < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @flags = @_io.read_u8le
      @combined_id = @_io.read_u8le
      @bit_count = @_io.read_s4le
      @bit_offset = @_io.read_s4le
      self
    end
    attr_reader :flags
    attr_reader :combined_id
    attr_reader :bit_count
    attr_reader :bit_offset
  end
  class RoutineConvention < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @volatile_registers_count = @_io.read_u4le
      @volatile_registers = Array.new(volatile_registers_count)
      (volatile_registers_count).times { |i|
        @volatile_registers[i] = RegisterDesc.new(@_io, self, @_root)
      }
      @param_registers_count = @_io.read_u4le
      @param_registers = Array.new(param_registers_count)
      (param_registers_count).times { |i|
        @param_registers[i] = RegisterDesc.new(@_io, self, @_root)
      }
      @retval_registers_count = @_io.read_u4le
      @retval_registers = Array.new(retval_registers_count)
      (retval_registers_count).times { |i|
        @retval_registers[i] = RegisterDesc.new(@_io, self, @_root)
      }
      @frame_register = RegisterDesc.new(@_io, self, @_root)
      @shadow_space = @_io.read_u8le
      @purge_stack = @_io.read_u1
      self
    end
    attr_reader :volatile_registers_count
    attr_reader :volatile_registers
    attr_reader :param_registers_count
    attr_reader :param_registers
    attr_reader :retval_registers_count
    attr_reader :retval_registers
    attr_reader :frame_register
    attr_reader :shadow_space
    attr_reader :purge_stack
  end
  class Instruction < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name_len = @_io.read_u4le
      @name = (@_io.read_bytes(name_len)).force_encoding("UTF-8")
      @operands_amount = @_io.read_u4le
      @operands = Array.new(operands_amount)
      (operands_amount).times { |i|
        @operands[i] = Operand.new(@_io, self, @_root)
      }
      @vip = @_io.read_u8le
      @sp_offset = @_io.read_s8le
      @sp_index = @_io.read_u4le
      @sp_reset = @_io.read_u1
      self
    end
    attr_reader :name_len
    attr_reader :name
    attr_reader :operands_amount
    attr_reader :operands
    attr_reader :vip
    attr_reader :sp_offset
    attr_reader :sp_index
    attr_reader :sp_reset
  end
  class ImmediateDesc < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @imm = @_io.read_u8le
      @bitcount = @_io.read_u4le
      self
    end
    attr_reader :imm
    attr_reader :bitcount
  end
  class ExploredBlocks < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @basic_blocks_amount = @_io.read_u4le
      @basic_blocks = Array.new(basic_blocks_amount)
      (basic_blocks_amount).times { |i|
        @basic_blocks[i] = BasicBlock.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :basic_blocks_amount
    attr_reader :basic_blocks
  end
  class SpecSubroutineConventions < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @spec_subroutine_conventions_amount = @_io.read_u4le
      @spec_subroutine_convention = Array.new(spec_subroutine_conventions_amount)
      (spec_subroutine_conventions_amount).times { |i|
        @spec_subroutine_convention[i] = SubroutineConvention.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :spec_subroutine_conventions_amount
    attr_reader :spec_subroutine_convention
  end
  class SpecSubroutineConvention < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @vip = @_io.read_u8le
      @volatile_registers_count = @_io.read_u4le
      @volatile_registers = Array.new(volatile_registers_count)
      (volatile_registers_count).times { |i|
        @volatile_registers[i] = RegisterDesc.new(@_io, self, @_root)
      }
      @param_registers_count = @_io.read_u4le
      @param_registers = Array.new(param_registers_count)
      (param_registers_count).times { |i|
        @param_registers[i] = RegisterDesc.new(@_io, self, @_root)
      }
      @retval_registers_count = @_io.read_u4le
      @retval_registers = Array.new(retval_registers_count)
      (retval_registers_count).times { |i|
        @retval_registers[i] = RegisterDesc.new(@_io, self, @_root)
      }
      @frame_register = RegisterDesc.new(@_io, self, @_root)
      @shadow_space = @_io.read_u8le
      @purge_stack = @_io.read_u1
      self
    end
    attr_reader :vip
    attr_reader :volatile_registers_count
    attr_reader :volatile_registers
    attr_reader :param_registers_count
    attr_reader :param_registers
    attr_reader :retval_registers_count
    attr_reader :retval_registers
    attr_reader :frame_register
    attr_reader :shadow_space
    attr_reader :purge_stack
  end
  class Entrypoint < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entry_vip = @_io.read_u8le
      self
    end
    attr_reader :entry_vip
  end
  class BasicBlock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entry_vip = @_io.read_u8le
      @sp_offset = @_io.read_s8le
      @sp_index = @_io.read_u4le
      @last_temporary_index = @_io.read_u4le
      @instruction_amount = @_io.read_u4le
      @instructions = Array.new(instruction_amount)
      (instruction_amount).times { |i|
        @instructions[i] = Instruction.new(@_io, self, @_root)
      }
      @prev_vip_amount = @_io.read_u4le
      @prev_vip = Array.new(prev_vip_amount)
      (prev_vip_amount).times { |i|
        @prev_vip[i] = @_io.read_u8le
      }
      @next_vip_amount = @_io.read_u4le
      @next_vip = Array.new(next_vip_amount)
      (next_vip_amount).times { |i|
        @next_vip[i] = @_io.read_u8le
      }
      self
    end
    attr_reader :entry_vip
    attr_reader :sp_offset
    attr_reader :sp_index
    attr_reader :last_temporary_index
    attr_reader :instruction_amount
    attr_reader :instructions
    attr_reader :prev_vip_amount
    attr_reader :prev_vip
    attr_reader :next_vip_amount
    attr_reader :next_vip
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic1 = @_io.read_u4le
      @arch_id = Kaitai::Struct::Stream::resolve_enum(ARCHITECTURE_IDENTIFIER, @_io.read_u1)
      @zero_pad = @_io.read_u1
      @magic2 = @_io.read_u2le
      self
    end
    attr_reader :magic1
    attr_reader :arch_id
    attr_reader :zero_pad
    attr_reader :magic2
  end
  attr_reader :header
  attr_reader :entrypoint
  attr_reader :routine_convention
  attr_reader :subroutine_convention
  attr_reader :spec_subroutine_conventions
  attr_reader :explored_blocks
end
