-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")

Vtil = class.class(KaitaiStruct)

Vtil.ArchitectureIdentifier = enum.Enum {
  amd64 = 0,
  arm64 = 1,
  virtual = 2,
}

function Vtil:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil:_read()
  self.header = Vtil.Header(self._io, self, self._root)
  self.entrypoint = Vtil.Entrypoint(self._io, self, self._root)
  self.routine_convention = Vtil.RoutineConvention(self._io, self, self._root)
  self.subroutine_convention = Vtil.SubroutineConvention(self._io, self, self._root)
  self.spec_subroutine_conventions = Vtil.SpecSubroutineConventions(self._io, self, self._root)
  self.explored_blocks = Vtil.ExploredBlocks(self._io, self, self._root)
end


Vtil.SubroutineConvention = class.class(KaitaiStruct)

function Vtil.SubroutineConvention:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil.SubroutineConvention:_read()
  self.volatile_registers_count = self._io:read_u4le()
  self.volatile_registers = {}
  for i = 1, self.volatile_registers_count do
    self.volatile_registers[i] = Vtil.RegisterDesc(self._io, self, self._root)
  end
  self.param_registers_count = self._io:read_u4le()
  self.param_registers = {}
  for i = 1, self.param_registers_count do
    self.param_registers[i] = Vtil.RegisterDesc(self._io, self, self._root)
  end
  self.retval_registers_count = self._io:read_u4le()
  self.retval_registers = {}
  for i = 1, self.retval_registers_count do
    self.retval_registers[i] = Vtil.RegisterDesc(self._io, self, self._root)
  end
  self.frame_register = Vtil.RegisterDesc(self._io, self, self._root)
  self.shadow_space = self._io:read_u8le()
  self.purge_stack = self._io:read_u1()
end


Vtil.Operand = class.class(KaitaiStruct)

function Vtil.Operand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil.Operand:_read()
  self.sp_index = self._io:read_u4le()
  local _on = self.sp_index
  if _on == 0 then
    self.operand = Vtil.ImmediateDesc(self._io, self, self._root)
  elseif _on == 1 then
    self.operand = Vtil.RegisterDesc(self._io, self, self._root)
  end
end


Vtil.RegisterDesc = class.class(KaitaiStruct)

function Vtil.RegisterDesc:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil.RegisterDesc:_read()
  self.flags = self._io:read_u8le()
  self.combined_id = self._io:read_u8le()
  self.bit_count = self._io:read_s4le()
  self.bit_offset = self._io:read_s4le()
end


Vtil.RoutineConvention = class.class(KaitaiStruct)

function Vtil.RoutineConvention:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil.RoutineConvention:_read()
  self.volatile_registers_count = self._io:read_u4le()
  self.volatile_registers = {}
  for i = 1, self.volatile_registers_count do
    self.volatile_registers[i] = Vtil.RegisterDesc(self._io, self, self._root)
  end
  self.param_registers_count = self._io:read_u4le()
  self.param_registers = {}
  for i = 1, self.param_registers_count do
    self.param_registers[i] = Vtil.RegisterDesc(self._io, self, self._root)
  end
  self.retval_registers_count = self._io:read_u4le()
  self.retval_registers = {}
  for i = 1, self.retval_registers_count do
    self.retval_registers[i] = Vtil.RegisterDesc(self._io, self, self._root)
  end
  self.frame_register = Vtil.RegisterDesc(self._io, self, self._root)
  self.shadow_space = self._io:read_u8le()
  self.purge_stack = self._io:read_u1()
end


Vtil.Instruction = class.class(KaitaiStruct)

function Vtil.Instruction:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil.Instruction:_read()
  self.name_len = self._io:read_u4le()
  self.name = str_decode.decode(self._io:read_bytes(self.name_len), "UTF-8")
  self.operands_amount = self._io:read_u4le()
  self.operands = {}
  for i = 1, self.operands_amount do
    self.operands[i] = Vtil.Operand(self._io, self, self._root)
  end
  self.vip = self._io:read_u8le()
  self.sp_offset = self._io:read_s8le()
  self.sp_index = self._io:read_u4le()
  self.sp_reset = self._io:read_u1()
end


Vtil.ImmediateDesc = class.class(KaitaiStruct)

function Vtil.ImmediateDesc:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil.ImmediateDesc:_read()
  self.imm = self._io:read_u8le()
  self.bitcount = self._io:read_u4le()
end


Vtil.ExploredBlocks = class.class(KaitaiStruct)

function Vtil.ExploredBlocks:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil.ExploredBlocks:_read()
  self.basic_blocks_amount = self._io:read_u4le()
  self.basic_blocks = {}
  for i = 1, self.basic_blocks_amount do
    self.basic_blocks[i] = Vtil.BasicBlock(self._io, self, self._root)
  end
end


Vtil.SpecSubroutineConventions = class.class(KaitaiStruct)

function Vtil.SpecSubroutineConventions:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil.SpecSubroutineConventions:_read()
  self.spec_subroutine_conventions_amount = self._io:read_u4le()
  self.spec_subroutine_convention = {}
  for i = 1, self.spec_subroutine_conventions_amount do
    self.spec_subroutine_convention[i] = Vtil.SubroutineConvention(self._io, self, self._root)
  end
end


Vtil.SpecSubroutineConvention = class.class(KaitaiStruct)

function Vtil.SpecSubroutineConvention:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil.SpecSubroutineConvention:_read()
  self.vip = self._io:read_u8le()
  self.volatile_registers_count = self._io:read_u4le()
  self.volatile_registers = {}
  for i = 1, self.volatile_registers_count do
    self.volatile_registers[i] = Vtil.RegisterDesc(self._io, self, self._root)
  end
  self.param_registers_count = self._io:read_u4le()
  self.param_registers = {}
  for i = 1, self.param_registers_count do
    self.param_registers[i] = Vtil.RegisterDesc(self._io, self, self._root)
  end
  self.retval_registers_count = self._io:read_u4le()
  self.retval_registers = {}
  for i = 1, self.retval_registers_count do
    self.retval_registers[i] = Vtil.RegisterDesc(self._io, self, self._root)
  end
  self.frame_register = Vtil.RegisterDesc(self._io, self, self._root)
  self.shadow_space = self._io:read_u8le()
  self.purge_stack = self._io:read_u1()
end


Vtil.Entrypoint = class.class(KaitaiStruct)

function Vtil.Entrypoint:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil.Entrypoint:_read()
  self.entry_vip = self._io:read_u8le()
end


Vtil.BasicBlock = class.class(KaitaiStruct)

function Vtil.BasicBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil.BasicBlock:_read()
  self.entry_vip = self._io:read_u8le()
  self.sp_offset = self._io:read_s8le()
  self.sp_index = self._io:read_u4le()
  self.last_temporary_index = self._io:read_u4le()
  self.instruction_amount = self._io:read_u4le()
  self.instructions = {}
  for i = 1, self.instruction_amount do
    self.instructions[i] = Vtil.Instruction(self._io, self, self._root)
  end
  self.prev_vip_amount = self._io:read_u4le()
  self.prev_vip = {}
  for i = 1, self.prev_vip_amount do
    self.prev_vip[i] = self._io:read_u8le()
  end
  self.next_vip_amount = self._io:read_u4le()
  self.next_vip = {}
  for i = 1, self.next_vip_amount do
    self.next_vip[i] = self._io:read_u8le()
  end
end


Vtil.Header = class.class(KaitaiStruct)

function Vtil.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vtil.Header:_read()
  self.magic1 = self._io:read_u4le()
  self.arch_id = Vtil.ArchitectureIdentifier(self._io:read_u1())
  self.zero_pad = self._io:read_u1()
  self.magic2 = self._io:read_u2le()
end


