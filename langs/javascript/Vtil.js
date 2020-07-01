// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Vtil = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var Vtil = (function() {
  Vtil.ArchitectureIdentifier = Object.freeze({
    AMD64: 0,
    ARM64: 1,
    VIRTUAL: 2,

    0: "AMD64",
    1: "ARM64",
    2: "VIRTUAL",
  });

  function Vtil(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Vtil.prototype._read = function() {
    this.header = new Header(this._io, this, this._root);
    this.entrypoint = new Entrypoint(this._io, this, this._root);
    this.routineConvention = new RoutineConvention(this._io, this, this._root);
    this.subroutineConvention = new SubroutineConvention(this._io, this, this._root);
    this.specSubroutineConventions = new SpecSubroutineConventions(this._io, this, this._root);
    this.exploredBlocks = new ExploredBlocks(this._io, this, this._root);
  }

  var SubroutineConvention = Vtil.SubroutineConvention = (function() {
    function SubroutineConvention(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SubroutineConvention.prototype._read = function() {
      this.volatileRegistersCount = this._io.readU4le();
      this.volatileRegisters = new Array(this.volatileRegistersCount);
      for (var i = 0; i < this.volatileRegistersCount; i++) {
        this.volatileRegisters[i] = new RegisterDesc(this._io, this, this._root);
      }
      this.paramRegistersCount = this._io.readU4le();
      this.paramRegisters = new Array(this.paramRegistersCount);
      for (var i = 0; i < this.paramRegistersCount; i++) {
        this.paramRegisters[i] = new RegisterDesc(this._io, this, this._root);
      }
      this.retvalRegistersCount = this._io.readU4le();
      this.retvalRegisters = new Array(this.retvalRegistersCount);
      for (var i = 0; i < this.retvalRegistersCount; i++) {
        this.retvalRegisters[i] = new RegisterDesc(this._io, this, this._root);
      }
      this.frameRegister = new RegisterDesc(this._io, this, this._root);
      this.shadowSpace = this._io.readU8le();
      this.purgeStack = this._io.readU1();
    }

    return SubroutineConvention;
  })();

  var Operand = Vtil.Operand = (function() {
    function Operand(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Operand.prototype._read = function() {
      this.spIndex = this._io.readU4le();
      switch (this.spIndex) {
      case 0:
        this.operand = new ImmediateDesc(this._io, this, this._root);
        break;
      case 1:
        this.operand = new RegisterDesc(this._io, this, this._root);
        break;
      }
    }

    return Operand;
  })();

  var RegisterDesc = Vtil.RegisterDesc = (function() {
    function RegisterDesc(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RegisterDesc.prototype._read = function() {
      this.flags = this._io.readU8le();
      this.combinedId = this._io.readU8le();
      this.bitCount = this._io.readS4le();
      this.bitOffset = this._io.readS4le();
    }

    return RegisterDesc;
  })();

  var RoutineConvention = Vtil.RoutineConvention = (function() {
    function RoutineConvention(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RoutineConvention.prototype._read = function() {
      this.volatileRegistersCount = this._io.readU4le();
      this.volatileRegisters = new Array(this.volatileRegistersCount);
      for (var i = 0; i < this.volatileRegistersCount; i++) {
        this.volatileRegisters[i] = new RegisterDesc(this._io, this, this._root);
      }
      this.paramRegistersCount = this._io.readU4le();
      this.paramRegisters = new Array(this.paramRegistersCount);
      for (var i = 0; i < this.paramRegistersCount; i++) {
        this.paramRegisters[i] = new RegisterDesc(this._io, this, this._root);
      }
      this.retvalRegistersCount = this._io.readU4le();
      this.retvalRegisters = new Array(this.retvalRegistersCount);
      for (var i = 0; i < this.retvalRegistersCount; i++) {
        this.retvalRegisters[i] = new RegisterDesc(this._io, this, this._root);
      }
      this.frameRegister = new RegisterDesc(this._io, this, this._root);
      this.shadowSpace = this._io.readU8le();
      this.purgeStack = this._io.readU1();
    }

    return RoutineConvention;
  })();

  var Instruction = Vtil.Instruction = (function() {
    function Instruction(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Instruction.prototype._read = function() {
      this.nameLen = this._io.readU4le();
      this.name = KaitaiStream.bytesToStr(this._io.readBytes(this.nameLen), "UTF-8");
      this.operandsAmount = this._io.readU4le();
      this.operands = new Array(this.operandsAmount);
      for (var i = 0; i < this.operandsAmount; i++) {
        this.operands[i] = new Operand(this._io, this, this._root);
      }
      this.vip = this._io.readU8le();
      this.spOffset = this._io.readS8le();
      this.spIndex = this._io.readU4le();
      this.spReset = this._io.readU1();
    }

    return Instruction;
  })();

  var ImmediateDesc = Vtil.ImmediateDesc = (function() {
    function ImmediateDesc(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ImmediateDesc.prototype._read = function() {
      this.imm = this._io.readU8le();
      this.bitcount = this._io.readU4le();
    }

    return ImmediateDesc;
  })();

  var ExploredBlocks = Vtil.ExploredBlocks = (function() {
    function ExploredBlocks(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ExploredBlocks.prototype._read = function() {
      this.basicBlocksAmount = this._io.readU4le();
      this.basicBlocks = new Array(this.basicBlocksAmount);
      for (var i = 0; i < this.basicBlocksAmount; i++) {
        this.basicBlocks[i] = new BasicBlock(this._io, this, this._root);
      }
    }

    return ExploredBlocks;
  })();

  var SpecSubroutineConventions = Vtil.SpecSubroutineConventions = (function() {
    function SpecSubroutineConventions(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SpecSubroutineConventions.prototype._read = function() {
      this.specSubroutineConventionsAmount = this._io.readU4le();
      this.specSubroutineConvention = new Array(this.specSubroutineConventionsAmount);
      for (var i = 0; i < this.specSubroutineConventionsAmount; i++) {
        this.specSubroutineConvention[i] = new SubroutineConvention(this._io, this, this._root);
      }
    }

    return SpecSubroutineConventions;
  })();

  var SpecSubroutineConvention = Vtil.SpecSubroutineConvention = (function() {
    function SpecSubroutineConvention(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SpecSubroutineConvention.prototype._read = function() {
      this.vip = this._io.readU8le();
      this.volatileRegistersCount = this._io.readU4le();
      this.volatileRegisters = new Array(this.volatileRegistersCount);
      for (var i = 0; i < this.volatileRegistersCount; i++) {
        this.volatileRegisters[i] = new RegisterDesc(this._io, this, this._root);
      }
      this.paramRegistersCount = this._io.readU4le();
      this.paramRegisters = new Array(this.paramRegistersCount);
      for (var i = 0; i < this.paramRegistersCount; i++) {
        this.paramRegisters[i] = new RegisterDesc(this._io, this, this._root);
      }
      this.retvalRegistersCount = this._io.readU4le();
      this.retvalRegisters = new Array(this.retvalRegistersCount);
      for (var i = 0; i < this.retvalRegistersCount; i++) {
        this.retvalRegisters[i] = new RegisterDesc(this._io, this, this._root);
      }
      this.frameRegister = new RegisterDesc(this._io, this, this._root);
      this.shadowSpace = this._io.readU8le();
      this.purgeStack = this._io.readU1();
    }

    return SpecSubroutineConvention;
  })();

  var Entrypoint = Vtil.Entrypoint = (function() {
    function Entrypoint(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Entrypoint.prototype._read = function() {
      this.entryVip = this._io.readU8le();
    }

    return Entrypoint;
  })();

  var BasicBlock = Vtil.BasicBlock = (function() {
    function BasicBlock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BasicBlock.prototype._read = function() {
      this.entryVip = this._io.readU8le();
      this.spOffset = this._io.readS8le();
      this.spIndex = this._io.readU4le();
      this.lastTemporaryIndex = this._io.readU4le();
      this.instructionAmount = this._io.readU4le();
      this.instructions = new Array(this.instructionAmount);
      for (var i = 0; i < this.instructionAmount; i++) {
        this.instructions[i] = new Instruction(this._io, this, this._root);
      }
      this.prevVipAmount = this._io.readU4le();
      this.prevVip = new Array(this.prevVipAmount);
      for (var i = 0; i < this.prevVipAmount; i++) {
        this.prevVip[i] = this._io.readU8le();
      }
      this.nextVipAmount = this._io.readU4le();
      this.nextVip = new Array(this.nextVipAmount);
      for (var i = 0; i < this.nextVipAmount; i++) {
        this.nextVip[i] = this._io.readU8le();
      }
    }

    return BasicBlock;
  })();

  var Header = Vtil.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic1 = this._io.readU4le();
      this.archId = this._io.readU1();
      this.zeroPad = this._io.readU1();
      this.magic2 = this._io.readU2le();
    }

    return Header;
  })();

  return Vtil;
})();
return Vtil;
}));
