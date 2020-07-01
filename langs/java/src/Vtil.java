// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class Vtil extends KaitaiStruct {
    public static Vtil fromFile(String fileName) throws IOException {
        return new Vtil(new ByteBufferKaitaiStream(fileName));
    }

    public enum ArchitectureIdentifier {
        AMD64(0),
        ARM64(1),
        VIRTUAL(2);

        private final long id;
        ArchitectureIdentifier(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ArchitectureIdentifier> byId = new HashMap<Long, ArchitectureIdentifier>(3);
        static {
            for (ArchitectureIdentifier e : ArchitectureIdentifier.values())
                byId.put(e.id(), e);
        }
        public static ArchitectureIdentifier byId(long id) { return byId.get(id); }
    }

    public Vtil(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Vtil(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Vtil(KaitaiStream _io, KaitaiStruct _parent, Vtil _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new Header(this._io, this, _root);
        this.entryPoint = new EntryPoint(this._io, this, _root);
        this.routineConvention = new RoutineConvention(this._io, this, _root);
        this.subroutineConvention = new SubroutineConvention(this._io, this, _root);
        this.specSubroutineConventions = new SpecSubroutineConventions(this._io, this, _root);
        this.exploredBlocks = new ExploredBlocks(this._io, this, _root);
    }
    public static class SubroutineConvention extends KaitaiStruct {
        public static SubroutineConvention fromFile(String fileName) throws IOException {
            return new SubroutineConvention(new ByteBufferKaitaiStream(fileName));
        }

        public SubroutineConvention(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SubroutineConvention(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public SubroutineConvention(KaitaiStream _io, KaitaiStruct _parent, Vtil _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.volatileRegistersCount = this._io.readU4le();
            volatileRegisters = new ArrayList<RegisterDesc>((int) (volatileRegistersCount()));
            for (int i = 0; i < volatileRegistersCount(); i++) {
                this.volatileRegisters.add(new RegisterDesc(this._io, this, _root));
            }
            this.paramRegistersCount = this._io.readU4le();
            paramRegisters = new ArrayList<RegisterDesc>((int) (paramRegistersCount()));
            for (int i = 0; i < paramRegistersCount(); i++) {
                this.paramRegisters.add(new RegisterDesc(this._io, this, _root));
            }
            this.retvalRegistersCount = this._io.readU4le();
            retvalRegisters = new ArrayList<RegisterDesc>((int) (retvalRegistersCount()));
            for (int i = 0; i < retvalRegistersCount(); i++) {
                this.retvalRegisters.add(new RegisterDesc(this._io, this, _root));
            }
            this.frameRegister = new RegisterDesc(this._io, this, _root);
            this.shadowSpace = this._io.readU8le();
            this.purgeStack = this._io.readU1();
        }
        private long volatileRegistersCount;
        private ArrayList<RegisterDesc> volatileRegisters;
        private long paramRegistersCount;
        private ArrayList<RegisterDesc> paramRegisters;
        private long retvalRegistersCount;
        private ArrayList<RegisterDesc> retvalRegisters;
        private RegisterDesc frameRegister;
        private long shadowSpace;
        private int purgeStack;
        private Vtil _root;
        private KaitaiStruct _parent;
        public long volatileRegistersCount() { return volatileRegistersCount; }
        public ArrayList<RegisterDesc> volatileRegisters() { return volatileRegisters; }
        public long paramRegistersCount() { return paramRegistersCount; }
        public ArrayList<RegisterDesc> paramRegisters() { return paramRegisters; }
        public long retvalRegistersCount() { return retvalRegistersCount; }
        public ArrayList<RegisterDesc> retvalRegisters() { return retvalRegisters; }
        public RegisterDesc frameRegister() { return frameRegister; }
        public long shadowSpace() { return shadowSpace; }
        public int purgeStack() { return purgeStack; }
        public Vtil _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Operand extends KaitaiStruct {
        public static Operand fromFile(String fileName) throws IOException {
            return new Operand(new ByteBufferKaitaiStream(fileName));
        }

        public Operand(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Operand(KaitaiStream _io, Vtil.Instruction _parent) {
            this(_io, _parent, null);
        }

        public Operand(KaitaiStream _io, Vtil.Instruction _parent, Vtil _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.spIndex = this._io.readU4le();
            switch (spIndex()) {
            case 0: {
                this.operand = new ImmediateDesc(this._io, this, _root);
                break;
            }
            case 1: {
                this.operand = new RegisterDesc(this._io, this, _root);
                break;
            }
            }
        }
        private long spIndex;
        private KaitaiStruct operand;
        private Vtil _root;
        private Vtil.Instruction _parent;
        public long spIndex() { return spIndex; }
        public KaitaiStruct operand() { return operand; }
        public Vtil _root() { return _root; }
        public Vtil.Instruction _parent() { return _parent; }
    }
    public static class RegisterDesc extends KaitaiStruct {
        public static RegisterDesc fromFile(String fileName) throws IOException {
            return new RegisterDesc(new ByteBufferKaitaiStream(fileName));
        }

        public RegisterDesc(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RegisterDesc(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public RegisterDesc(KaitaiStream _io, KaitaiStruct _parent, Vtil _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.flags = this._io.readU8le();
            this.combinedId = this._io.readU8le();
            this.bitCount = this._io.readS4le();
            this.bitOffset = this._io.readS4le();
        }
        private long flags;
        private long combinedId;
        private int bitCount;
        private int bitOffset;
        private Vtil _root;
        private KaitaiStruct _parent;
        public long flags() { return flags; }
        public long combinedId() { return combinedId; }
        public int bitCount() { return bitCount; }
        public int bitOffset() { return bitOffset; }
        public Vtil _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class RoutineConvention extends KaitaiStruct {
        public static RoutineConvention fromFile(String fileName) throws IOException {
            return new RoutineConvention(new ByteBufferKaitaiStream(fileName));
        }

        public RoutineConvention(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RoutineConvention(KaitaiStream _io, Vtil _parent) {
            this(_io, _parent, null);
        }

        public RoutineConvention(KaitaiStream _io, Vtil _parent, Vtil _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.volatileRegistersCount = this._io.readU4le();
            volatileRegisters = new ArrayList<RegisterDesc>((int) (volatileRegistersCount()));
            for (int i = 0; i < volatileRegistersCount(); i++) {
                this.volatileRegisters.add(new RegisterDesc(this._io, this, _root));
            }
            this.paramRegistersCount = this._io.readU4le();
            paramRegisters = new ArrayList<RegisterDesc>((int) (paramRegistersCount()));
            for (int i = 0; i < paramRegistersCount(); i++) {
                this.paramRegisters.add(new RegisterDesc(this._io, this, _root));
            }
            this.retvalRegistersCount = this._io.readU4le();
            retvalRegisters = new ArrayList<RegisterDesc>((int) (retvalRegistersCount()));
            for (int i = 0; i < retvalRegistersCount(); i++) {
                this.retvalRegisters.add(new RegisterDesc(this._io, this, _root));
            }
            this.frameRegister = new RegisterDesc(this._io, this, _root);
            this.shadowSpace = this._io.readU8le();
            this.purgeStack = this._io.readU1();
        }
        private long volatileRegistersCount;
        private ArrayList<RegisterDesc> volatileRegisters;
        private long paramRegistersCount;
        private ArrayList<RegisterDesc> paramRegisters;
        private long retvalRegistersCount;
        private ArrayList<RegisterDesc> retvalRegisters;
        private RegisterDesc frameRegister;
        private long shadowSpace;
        private int purgeStack;
        private Vtil _root;
        private Vtil _parent;
        public long volatileRegistersCount() { return volatileRegistersCount; }
        public ArrayList<RegisterDesc> volatileRegisters() { return volatileRegisters; }
        public long paramRegistersCount() { return paramRegistersCount; }
        public ArrayList<RegisterDesc> paramRegisters() { return paramRegisters; }
        public long retvalRegistersCount() { return retvalRegistersCount; }
        public ArrayList<RegisterDesc> retvalRegisters() { return retvalRegisters; }
        public RegisterDesc frameRegister() { return frameRegister; }
        public long shadowSpace() { return shadowSpace; }
        public int purgeStack() { return purgeStack; }
        public Vtil _root() { return _root; }
        public Vtil _parent() { return _parent; }
    }
    public static class Instruction extends KaitaiStruct {
        public static Instruction fromFile(String fileName) throws IOException {
            return new Instruction(new ByteBufferKaitaiStream(fileName));
        }

        public Instruction(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Instruction(KaitaiStream _io, Vtil.BasicBlock _parent) {
            this(_io, _parent, null);
        }

        public Instruction(KaitaiStream _io, Vtil.BasicBlock _parent, Vtil _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.nameLen = this._io.readU4le();
            this.name = new String(this._io.readBytes(nameLen()), Charset.forName("UTF-8"));
            this.operandsAmount = this._io.readU4le();
            operands = new ArrayList<Operand>((int) (operandsAmount()));
            for (int i = 0; i < operandsAmount(); i++) {
                this.operands.add(new Operand(this._io, this, _root));
            }
            this.vip = this._io.readU8le();
            this.spOffset = this._io.readS8le();
            this.spIndex = this._io.readU4le();
            this.spReset = this._io.readU1();
        }
        private long nameLen;
        private String name;
        private long operandsAmount;
        private ArrayList<Operand> operands;
        private long vip;
        private long spOffset;
        private long spIndex;
        private int spReset;
        private Vtil _root;
        private Vtil.BasicBlock _parent;
        public long nameLen() { return nameLen; }
        public String name() { return name; }
        public long operandsAmount() { return operandsAmount; }
        public ArrayList<Operand> operands() { return operands; }
        public long vip() { return vip; }
        public long spOffset() { return spOffset; }
        public long spIndex() { return spIndex; }
        public int spReset() { return spReset; }
        public Vtil _root() { return _root; }
        public Vtil.BasicBlock _parent() { return _parent; }
    }
    public static class ImmediateDesc extends KaitaiStruct {
        public static ImmediateDesc fromFile(String fileName) throws IOException {
            return new ImmediateDesc(new ByteBufferKaitaiStream(fileName));
        }

        public ImmediateDesc(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ImmediateDesc(KaitaiStream _io, Vtil.Operand _parent) {
            this(_io, _parent, null);
        }

        public ImmediateDesc(KaitaiStream _io, Vtil.Operand _parent, Vtil _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.imm = this._io.readU8le();
            this.bitcount = this._io.readU4le();
        }
        private long imm;
        private long bitcount;
        private Vtil _root;
        private Vtil.Operand _parent;
        public long imm() { return imm; }
        public long bitcount() { return bitcount; }
        public Vtil _root() { return _root; }
        public Vtil.Operand _parent() { return _parent; }
    }
    public static class ExploredBlocks extends KaitaiStruct {
        public static ExploredBlocks fromFile(String fileName) throws IOException {
            return new ExploredBlocks(new ByteBufferKaitaiStream(fileName));
        }

        public ExploredBlocks(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExploredBlocks(KaitaiStream _io, Vtil _parent) {
            this(_io, _parent, null);
        }

        public ExploredBlocks(KaitaiStream _io, Vtil _parent, Vtil _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.exploredBlocksAmount = this._io.readU4le();
            exploredBlock = new ArrayList<BasicBlock>((int) (exploredBlocksAmount()));
            for (int i = 0; i < exploredBlocksAmount(); i++) {
                this.exploredBlock.add(new BasicBlock(this._io, this, _root));
            }
        }
        private long exploredBlocksAmount;
        private ArrayList<BasicBlock> exploredBlock;
        private Vtil _root;
        private Vtil _parent;
        public long exploredBlocksAmount() { return exploredBlocksAmount; }
        public ArrayList<BasicBlock> exploredBlock() { return exploredBlock; }
        public Vtil _root() { return _root; }
        public Vtil _parent() { return _parent; }
    }
    public static class SpecSubroutineConventions extends KaitaiStruct {
        public static SpecSubroutineConventions fromFile(String fileName) throws IOException {
            return new SpecSubroutineConventions(new ByteBufferKaitaiStream(fileName));
        }

        public SpecSubroutineConventions(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SpecSubroutineConventions(KaitaiStream _io, Vtil _parent) {
            this(_io, _parent, null);
        }

        public SpecSubroutineConventions(KaitaiStream _io, Vtil _parent, Vtil _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.specSubroutineConventionsAmount = this._io.readU4le();
            specSubroutineConvention = new ArrayList<SubroutineConvention>((int) (specSubroutineConventionsAmount()));
            for (int i = 0; i < specSubroutineConventionsAmount(); i++) {
                this.specSubroutineConvention.add(new SubroutineConvention(this._io, this, _root));
            }
        }
        private long specSubroutineConventionsAmount;
        private ArrayList<SubroutineConvention> specSubroutineConvention;
        private Vtil _root;
        private Vtil _parent;
        public long specSubroutineConventionsAmount() { return specSubroutineConventionsAmount; }
        public ArrayList<SubroutineConvention> specSubroutineConvention() { return specSubroutineConvention; }
        public Vtil _root() { return _root; }
        public Vtil _parent() { return _parent; }
    }
    public static class SpecSubroutineConvention extends KaitaiStruct {
        public static SpecSubroutineConvention fromFile(String fileName) throws IOException {
            return new SpecSubroutineConvention(new ByteBufferKaitaiStream(fileName));
        }

        public SpecSubroutineConvention(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SpecSubroutineConvention(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public SpecSubroutineConvention(KaitaiStream _io, KaitaiStruct _parent, Vtil _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.vip = this._io.readU8le();
            this.volatileRegistersCount = this._io.readU4le();
            volatileRegisters = new ArrayList<RegisterDesc>((int) (volatileRegistersCount()));
            for (int i = 0; i < volatileRegistersCount(); i++) {
                this.volatileRegisters.add(new RegisterDesc(this._io, this, _root));
            }
            this.paramRegistersCount = this._io.readU4le();
            paramRegisters = new ArrayList<RegisterDesc>((int) (paramRegistersCount()));
            for (int i = 0; i < paramRegistersCount(); i++) {
                this.paramRegisters.add(new RegisterDesc(this._io, this, _root));
            }
            this.retvalRegistersCount = this._io.readU4le();
            retvalRegisters = new ArrayList<RegisterDesc>((int) (retvalRegistersCount()));
            for (int i = 0; i < retvalRegistersCount(); i++) {
                this.retvalRegisters.add(new RegisterDesc(this._io, this, _root));
            }
            this.frameRegister = new RegisterDesc(this._io, this, _root);
            this.shadowSpace = this._io.readU8le();
            this.purgeStack = this._io.readU1();
        }
        private long vip;
        private long volatileRegistersCount;
        private ArrayList<RegisterDesc> volatileRegisters;
        private long paramRegistersCount;
        private ArrayList<RegisterDesc> paramRegisters;
        private long retvalRegistersCount;
        private ArrayList<RegisterDesc> retvalRegisters;
        private RegisterDesc frameRegister;
        private long shadowSpace;
        private int purgeStack;
        private Vtil _root;
        private KaitaiStruct _parent;
        public long vip() { return vip; }
        public long volatileRegistersCount() { return volatileRegistersCount; }
        public ArrayList<RegisterDesc> volatileRegisters() { return volatileRegisters; }
        public long paramRegistersCount() { return paramRegistersCount; }
        public ArrayList<RegisterDesc> paramRegisters() { return paramRegisters; }
        public long retvalRegistersCount() { return retvalRegistersCount; }
        public ArrayList<RegisterDesc> retvalRegisters() { return retvalRegisters; }
        public RegisterDesc frameRegister() { return frameRegister; }
        public long shadowSpace() { return shadowSpace; }
        public int purgeStack() { return purgeStack; }
        public Vtil _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class BasicBlock extends KaitaiStruct {
        public static BasicBlock fromFile(String fileName) throws IOException {
            return new BasicBlock(new ByteBufferKaitaiStream(fileName));
        }

        public BasicBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BasicBlock(KaitaiStream _io, Vtil.ExploredBlocks _parent) {
            this(_io, _parent, null);
        }

        public BasicBlock(KaitaiStream _io, Vtil.ExploredBlocks _parent, Vtil _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entryVip = this._io.readU8le();
            this.spOffset = this._io.readS8le();
            this.spIndex = this._io.readU4le();
            this.lastTemporaryIndex = this._io.readU4le();
            this.instructionAmount = this._io.readU4le();
            instructions = new ArrayList<Instruction>((int) (instructionAmount()));
            for (int i = 0; i < instructionAmount(); i++) {
                this.instructions.add(new Instruction(this._io, this, _root));
            }
            this.prevVipAmount = this._io.readU4le();
            prevVip = new ArrayList<Long>((int) (prevVipAmount()));
            for (int i = 0; i < prevVipAmount(); i++) {
                this.prevVip.add(this._io.readU8le());
            }
            this.nextVipAmount = this._io.readU4le();
            nextVip = new ArrayList<Long>((int) (nextVipAmount()));
            for (int i = 0; i < nextVipAmount(); i++) {
                this.nextVip.add(this._io.readU8le());
            }
        }
        private long entryVip;
        private long spOffset;
        private long spIndex;
        private long lastTemporaryIndex;
        private long instructionAmount;
        private ArrayList<Instruction> instructions;
        private long prevVipAmount;
        private ArrayList<Long> prevVip;
        private long nextVipAmount;
        private ArrayList<Long> nextVip;
        private Vtil _root;
        private Vtil.ExploredBlocks _parent;
        public long entryVip() { return entryVip; }
        public long spOffset() { return spOffset; }
        public long spIndex() { return spIndex; }
        public long lastTemporaryIndex() { return lastTemporaryIndex; }
        public long instructionAmount() { return instructionAmount; }
        public ArrayList<Instruction> instructions() { return instructions; }
        public long prevVipAmount() { return prevVipAmount; }
        public ArrayList<Long> prevVip() { return prevVip; }
        public long nextVipAmount() { return nextVipAmount; }
        public ArrayList<Long> nextVip() { return nextVip; }
        public Vtil _root() { return _root; }
        public Vtil.ExploredBlocks _parent() { return _parent; }
    }
    public static class EntryPoint extends KaitaiStruct {
        public static EntryPoint fromFile(String fileName) throws IOException {
            return new EntryPoint(new ByteBufferKaitaiStream(fileName));
        }

        public EntryPoint(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EntryPoint(KaitaiStream _io, Vtil _parent) {
            this(_io, _parent, null);
        }

        public EntryPoint(KaitaiStream _io, Vtil _parent, Vtil _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entryVip = this._io.readU8le();
        }
        private long entryVip;
        private Vtil _root;
        private Vtil _parent;
        public long entryVip() { return entryVip; }
        public Vtil _root() { return _root; }
        public Vtil _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Vtil _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Vtil _parent, Vtil _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic1 = this._io.readU4le();
            this.archId = Vtil.ArchitectureIdentifier.byId(this._io.readU1());
            this.zeroPad = this._io.readU1();
            this.magic2 = this._io.readU2le();
        }
        private long magic1;
        private ArchitectureIdentifier archId;
        private int zeroPad;
        private int magic2;
        private Vtil _root;
        private Vtil _parent;
        public long magic1() { return magic1; }
        public ArchitectureIdentifier archId() { return archId; }
        public int zeroPad() { return zeroPad; }
        public int magic2() { return magic2; }
        public Vtil _root() { return _root; }
        public Vtil _parent() { return _parent; }
    }
    private Header header;
    private EntryPoint entryPoint;
    private RoutineConvention routineConvention;
    private SubroutineConvention subroutineConvention;
    private SpecSubroutineConventions specSubroutineConventions;
    private ExploredBlocks exploredBlocks;
    private Vtil _root;
    private KaitaiStruct _parent;
    public Header header() { return header; }
    public EntryPoint entryPoint() { return entryPoint; }
    public RoutineConvention routineConvention() { return routineConvention; }
    public SubroutineConvention subroutineConvention() { return subroutineConvention; }
    public SpecSubroutineConventions specSubroutineConventions() { return specSubroutineConventions; }
    public ExploredBlocks exploredBlocks() { return exploredBlocks; }
    public Vtil _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
