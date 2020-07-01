<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Vtil extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \Vtil\Header($this->_io, $this, $this->_root);
        $this->_m_entryPoint = new \Vtil\EntryPoint($this->_io, $this, $this->_root);
        $this->_m_routineConvention = new \Vtil\RoutineConvention($this->_io, $this, $this->_root);
        $this->_m_subroutineConvention = new \Vtil\SubroutineConvention($this->_io, $this, $this->_root);
        $this->_m_specSubroutineConventions = new \Vtil\SpecSubroutineConventions($this->_io, $this, $this->_root);
        $this->_m_exploredBlocks = new \Vtil\ExploredBlocks($this->_io, $this, $this->_root);
    }
    protected $_m_header;
    protected $_m_entryPoint;
    protected $_m_routineConvention;
    protected $_m_subroutineConvention;
    protected $_m_specSubroutineConventions;
    protected $_m_exploredBlocks;
    public function header() { return $this->_m_header; }
    public function entryPoint() { return $this->_m_entryPoint; }
    public function routineConvention() { return $this->_m_routineConvention; }
    public function subroutineConvention() { return $this->_m_subroutineConvention; }
    public function specSubroutineConventions() { return $this->_m_specSubroutineConventions; }
    public function exploredBlocks() { return $this->_m_exploredBlocks; }
}

namespace \Vtil;

class SubroutineConvention extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_volatileRegistersCount = $this->_io->readU4le();
        $this->_m_volatileRegisters = [];
        $n = $this->volatileRegistersCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_volatileRegisters[] = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
        }
        $this->_m_paramRegistersCount = $this->_io->readU4le();
        $this->_m_paramRegisters = [];
        $n = $this->paramRegistersCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_paramRegisters[] = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
        }
        $this->_m_retvalRegistersCount = $this->_io->readU4le();
        $this->_m_retvalRegisters = [];
        $n = $this->retvalRegistersCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_retvalRegisters[] = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
        }
        $this->_m_frameRegister = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
        $this->_m_shadowSpace = $this->_io->readU8le();
        $this->_m_purgeStack = $this->_io->readU1();
    }
    protected $_m_volatileRegistersCount;
    protected $_m_volatileRegisters;
    protected $_m_paramRegistersCount;
    protected $_m_paramRegisters;
    protected $_m_retvalRegistersCount;
    protected $_m_retvalRegisters;
    protected $_m_frameRegister;
    protected $_m_shadowSpace;
    protected $_m_purgeStack;
    public function volatileRegistersCount() { return $this->_m_volatileRegistersCount; }
    public function volatileRegisters() { return $this->_m_volatileRegisters; }
    public function paramRegistersCount() { return $this->_m_paramRegistersCount; }
    public function paramRegisters() { return $this->_m_paramRegisters; }
    public function retvalRegistersCount() { return $this->_m_retvalRegistersCount; }
    public function retvalRegisters() { return $this->_m_retvalRegisters; }
    public function frameRegister() { return $this->_m_frameRegister; }
    public function shadowSpace() { return $this->_m_shadowSpace; }
    public function purgeStack() { return $this->_m_purgeStack; }
}

namespace \Vtil;

class Operand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Vtil\Instruction $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_spIndex = $this->_io->readU4le();
        switch ($this->spIndex()) {
            case 0:
                $this->_m_operand = new \Vtil\ImmediateDesc($this->_io, $this, $this->_root);
                break;
            case 1:
                $this->_m_operand = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_spIndex;
    protected $_m_operand;
    public function spIndex() { return $this->_m_spIndex; }
    public function operand() { return $this->_m_operand; }
}

namespace \Vtil;

class RegisterDesc extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flags = $this->_io->readU8le();
        $this->_m_combinedId = $this->_io->readU8le();
        $this->_m_bitCount = $this->_io->readS4le();
        $this->_m_bitOffset = $this->_io->readS4le();
    }
    protected $_m_flags;
    protected $_m_combinedId;
    protected $_m_bitCount;
    protected $_m_bitOffset;
    public function flags() { return $this->_m_flags; }
    public function combinedId() { return $this->_m_combinedId; }
    public function bitCount() { return $this->_m_bitCount; }
    public function bitOffset() { return $this->_m_bitOffset; }
}

namespace \Vtil;

class RoutineConvention extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Vtil $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_volatileRegistersCount = $this->_io->readU4le();
        $this->_m_volatileRegisters = [];
        $n = $this->volatileRegistersCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_volatileRegisters[] = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
        }
        $this->_m_paramRegistersCount = $this->_io->readU4le();
        $this->_m_paramRegisters = [];
        $n = $this->paramRegistersCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_paramRegisters[] = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
        }
        $this->_m_retvalRegistersCount = $this->_io->readU4le();
        $this->_m_retvalRegisters = [];
        $n = $this->retvalRegistersCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_retvalRegisters[] = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
        }
        $this->_m_frameRegister = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
        $this->_m_shadowSpace = $this->_io->readU8le();
        $this->_m_purgeStack = $this->_io->readU1();
    }
    protected $_m_volatileRegistersCount;
    protected $_m_volatileRegisters;
    protected $_m_paramRegistersCount;
    protected $_m_paramRegisters;
    protected $_m_retvalRegistersCount;
    protected $_m_retvalRegisters;
    protected $_m_frameRegister;
    protected $_m_shadowSpace;
    protected $_m_purgeStack;
    public function volatileRegistersCount() { return $this->_m_volatileRegistersCount; }
    public function volatileRegisters() { return $this->_m_volatileRegisters; }
    public function paramRegistersCount() { return $this->_m_paramRegistersCount; }
    public function paramRegisters() { return $this->_m_paramRegisters; }
    public function retvalRegistersCount() { return $this->_m_retvalRegistersCount; }
    public function retvalRegisters() { return $this->_m_retvalRegisters; }
    public function frameRegister() { return $this->_m_frameRegister; }
    public function shadowSpace() { return $this->_m_shadowSpace; }
    public function purgeStack() { return $this->_m_purgeStack; }
}

namespace \Vtil;

class Instruction extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Vtil\BasicBlock $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_nameLen = $this->_io->readU4le();
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->nameLen()), "UTF-8");
        $this->_m_operandsAmount = $this->_io->readU4le();
        $this->_m_operands = [];
        $n = $this->operandsAmount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_operands[] = new \Vtil\Operand($this->_io, $this, $this->_root);
        }
        $this->_m_vip = $this->_io->readU8le();
        $this->_m_spOffset = $this->_io->readS8le();
        $this->_m_spIndex = $this->_io->readU4le();
        $this->_m_spReset = $this->_io->readU1();
    }
    protected $_m_nameLen;
    protected $_m_name;
    protected $_m_operandsAmount;
    protected $_m_operands;
    protected $_m_vip;
    protected $_m_spOffset;
    protected $_m_spIndex;
    protected $_m_spReset;
    public function nameLen() { return $this->_m_nameLen; }
    public function name() { return $this->_m_name; }
    public function operandsAmount() { return $this->_m_operandsAmount; }
    public function operands() { return $this->_m_operands; }
    public function vip() { return $this->_m_vip; }
    public function spOffset() { return $this->_m_spOffset; }
    public function spIndex() { return $this->_m_spIndex; }
    public function spReset() { return $this->_m_spReset; }
}

namespace \Vtil;

class ImmediateDesc extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Vtil\Operand $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_imm = $this->_io->readU8le();
        $this->_m_bitcount = $this->_io->readU4le();
    }
    protected $_m_imm;
    protected $_m_bitcount;
    public function imm() { return $this->_m_imm; }
    public function bitcount() { return $this->_m_bitcount; }
}

namespace \Vtil;

class ExploredBlocks extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Vtil $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_exploredBlocksAmount = $this->_io->readU4le();
        $this->_m_exploredBlock = [];
        $n = $this->exploredBlocksAmount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_exploredBlock[] = new \Vtil\BasicBlock($this->_io, $this, $this->_root);
        }
    }
    protected $_m_exploredBlocksAmount;
    protected $_m_exploredBlock;
    public function exploredBlocksAmount() { return $this->_m_exploredBlocksAmount; }
    public function exploredBlock() { return $this->_m_exploredBlock; }
}

namespace \Vtil;

class SpecSubroutineConventions extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Vtil $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_specSubroutineConventionsAmount = $this->_io->readU4le();
        $this->_m_specSubroutineConvention = [];
        $n = $this->specSubroutineConventionsAmount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_specSubroutineConvention[] = new \Vtil\SubroutineConvention($this->_io, $this, $this->_root);
        }
    }
    protected $_m_specSubroutineConventionsAmount;
    protected $_m_specSubroutineConvention;
    public function specSubroutineConventionsAmount() { return $this->_m_specSubroutineConventionsAmount; }
    public function specSubroutineConvention() { return $this->_m_specSubroutineConvention; }
}

namespace \Vtil;

class SpecSubroutineConvention extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_vip = $this->_io->readU8le();
        $this->_m_volatileRegistersCount = $this->_io->readU4le();
        $this->_m_volatileRegisters = [];
        $n = $this->volatileRegistersCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_volatileRegisters[] = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
        }
        $this->_m_paramRegistersCount = $this->_io->readU4le();
        $this->_m_paramRegisters = [];
        $n = $this->paramRegistersCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_paramRegisters[] = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
        }
        $this->_m_retvalRegistersCount = $this->_io->readU4le();
        $this->_m_retvalRegisters = [];
        $n = $this->retvalRegistersCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_retvalRegisters[] = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
        }
        $this->_m_frameRegister = new \Vtil\RegisterDesc($this->_io, $this, $this->_root);
        $this->_m_shadowSpace = $this->_io->readU8le();
        $this->_m_purgeStack = $this->_io->readU1();
    }
    protected $_m_vip;
    protected $_m_volatileRegistersCount;
    protected $_m_volatileRegisters;
    protected $_m_paramRegistersCount;
    protected $_m_paramRegisters;
    protected $_m_retvalRegistersCount;
    protected $_m_retvalRegisters;
    protected $_m_frameRegister;
    protected $_m_shadowSpace;
    protected $_m_purgeStack;
    public function vip() { return $this->_m_vip; }
    public function volatileRegistersCount() { return $this->_m_volatileRegistersCount; }
    public function volatileRegisters() { return $this->_m_volatileRegisters; }
    public function paramRegistersCount() { return $this->_m_paramRegistersCount; }
    public function paramRegisters() { return $this->_m_paramRegisters; }
    public function retvalRegistersCount() { return $this->_m_retvalRegistersCount; }
    public function retvalRegisters() { return $this->_m_retvalRegisters; }
    public function frameRegister() { return $this->_m_frameRegister; }
    public function shadowSpace() { return $this->_m_shadowSpace; }
    public function purgeStack() { return $this->_m_purgeStack; }
}

namespace \Vtil;

class BasicBlock extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Vtil\ExploredBlocks $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entryVip = $this->_io->readU8le();
        $this->_m_spOffset = $this->_io->readS8le();
        $this->_m_spIndex = $this->_io->readU4le();
        $this->_m_lastTemporaryIndex = $this->_io->readU4le();
        $this->_m_instructionAmount = $this->_io->readU4le();
        $this->_m_instructions = [];
        $n = $this->instructionAmount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_instructions[] = new \Vtil\Instruction($this->_io, $this, $this->_root);
        }
        $this->_m_prevVipAmount = $this->_io->readU4le();
        $this->_m_prevVip = [];
        $n = $this->prevVipAmount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_prevVip[] = $this->_io->readU8le();
        }
        $this->_m_nextVipAmount = $this->_io->readU4le();
        $this->_m_nextVip = [];
        $n = $this->nextVipAmount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_nextVip[] = $this->_io->readU8le();
        }
    }
    protected $_m_entryVip;
    protected $_m_spOffset;
    protected $_m_spIndex;
    protected $_m_lastTemporaryIndex;
    protected $_m_instructionAmount;
    protected $_m_instructions;
    protected $_m_prevVipAmount;
    protected $_m_prevVip;
    protected $_m_nextVipAmount;
    protected $_m_nextVip;
    public function entryVip() { return $this->_m_entryVip; }
    public function spOffset() { return $this->_m_spOffset; }
    public function spIndex() { return $this->_m_spIndex; }
    public function lastTemporaryIndex() { return $this->_m_lastTemporaryIndex; }
    public function instructionAmount() { return $this->_m_instructionAmount; }
    public function instructions() { return $this->_m_instructions; }
    public function prevVipAmount() { return $this->_m_prevVipAmount; }
    public function prevVip() { return $this->_m_prevVip; }
    public function nextVipAmount() { return $this->_m_nextVipAmount; }
    public function nextVip() { return $this->_m_nextVip; }
}

namespace \Vtil;

class EntryPoint extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Vtil $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entryVip = $this->_io->readU8le();
    }
    protected $_m_entryVip;
    public function entryVip() { return $this->_m_entryVip; }
}

namespace \Vtil;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Vtil $_parent = null, \Vtil $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic1 = $this->_io->readU4le();
        $this->_m_archId = $this->_io->readU1();
        $this->_m_zeroPad = $this->_io->readU1();
        $this->_m_magic2 = $this->_io->readU2le();
    }
    protected $_m_magic1;
    protected $_m_archId;
    protected $_m_zeroPad;
    protected $_m_magic2;
    public function magic1() { return $this->_m_magic1; }
    public function archId() { return $this->_m_archId; }
    public function zeroPad() { return $this->_m_zeroPad; }
    public function magic2() { return $this->_m_magic2; }
}

namespace \Vtil;

class ArchitectureIdentifier {
    const AMD64 = 0;
    const ARM64 = 1;
    const VIRTUAL = 2;
}
