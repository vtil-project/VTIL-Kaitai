// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Vtil : KaitaiStruct
    {
        public static Vtil FromFile(string fileName)
        {
            return new Vtil(new KaitaiStream(fileName));
        }


        public enum ArchitectureIdentifier
        {
            Amd64 = 0,
            Arm64 = 1,
            Virtual = 2,
        }
        public Vtil(KaitaiStream p__io, KaitaiStruct p__parent = null, Vtil p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new Header(m_io, this, m_root);
            _entrypoint = new Entrypoint(m_io, this, m_root);
            _routineConvention = new RoutineConvention(m_io, this, m_root);
            _subroutineConvention = new SubroutineConvention(m_io, this, m_root);
            _specSubroutineConventions = new SpecSubroutineConventions(m_io, this, m_root);
            _exploredBlocks = new ExploredBlocks(m_io, this, m_root);
        }
        public partial class SubroutineConvention : KaitaiStruct
        {
            public static SubroutineConvention FromFile(string fileName)
            {
                return new SubroutineConvention(new KaitaiStream(fileName));
            }

            public SubroutineConvention(KaitaiStream p__io, KaitaiStruct p__parent = null, Vtil p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _volatileRegistersCount = m_io.ReadU4le();
                _volatileRegisters = new List<RegisterDesc>((int) (VolatileRegistersCount));
                for (var i = 0; i < VolatileRegistersCount; i++)
                {
                    _volatileRegisters.Add(new RegisterDesc(m_io, this, m_root));
                }
                _paramRegistersCount = m_io.ReadU4le();
                _paramRegisters = new List<RegisterDesc>((int) (ParamRegistersCount));
                for (var i = 0; i < ParamRegistersCount; i++)
                {
                    _paramRegisters.Add(new RegisterDesc(m_io, this, m_root));
                }
                _retvalRegistersCount = m_io.ReadU4le();
                _retvalRegisters = new List<RegisterDesc>((int) (RetvalRegistersCount));
                for (var i = 0; i < RetvalRegistersCount; i++)
                {
                    _retvalRegisters.Add(new RegisterDesc(m_io, this, m_root));
                }
                _frameRegister = new RegisterDesc(m_io, this, m_root);
                _shadowSpace = m_io.ReadU8le();
                _purgeStack = m_io.ReadU1();
            }
            private uint _volatileRegistersCount;
            private List<RegisterDesc> _volatileRegisters;
            private uint _paramRegistersCount;
            private List<RegisterDesc> _paramRegisters;
            private uint _retvalRegistersCount;
            private List<RegisterDesc> _retvalRegisters;
            private RegisterDesc _frameRegister;
            private ulong _shadowSpace;
            private byte _purgeStack;
            private Vtil m_root;
            private KaitaiStruct m_parent;
            public uint VolatileRegistersCount { get { return _volatileRegistersCount; } }
            public List<RegisterDesc> VolatileRegisters { get { return _volatileRegisters; } }
            public uint ParamRegistersCount { get { return _paramRegistersCount; } }
            public List<RegisterDesc> ParamRegisters { get { return _paramRegisters; } }
            public uint RetvalRegistersCount { get { return _retvalRegistersCount; } }
            public List<RegisterDesc> RetvalRegisters { get { return _retvalRegisters; } }
            public RegisterDesc FrameRegister { get { return _frameRegister; } }
            public ulong ShadowSpace { get { return _shadowSpace; } }
            public byte PurgeStack { get { return _purgeStack; } }
            public Vtil M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Operand : KaitaiStruct
        {
            public static Operand FromFile(string fileName)
            {
                return new Operand(new KaitaiStream(fileName));
            }

            public Operand(KaitaiStream p__io, Vtil.Instruction p__parent = null, Vtil p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _spIndex = m_io.ReadU4le();
                switch (SpIndex) {
                case 0: {
                    _operand = new ImmediateDesc(m_io, this, m_root);
                    break;
                }
                case 1: {
                    _operand = new RegisterDesc(m_io, this, m_root);
                    break;
                }
                }
            }
            private uint _spIndex;
            private KaitaiStruct _operand;
            private Vtil m_root;
            private Vtil.Instruction m_parent;
            public uint SpIndex { get { return _spIndex; } }
            public KaitaiStruct Operand { get { return _operand; } }
            public Vtil M_Root { get { return m_root; } }
            public Vtil.Instruction M_Parent { get { return m_parent; } }
        }
        public partial class RegisterDesc : KaitaiStruct
        {
            public static RegisterDesc FromFile(string fileName)
            {
                return new RegisterDesc(new KaitaiStream(fileName));
            }

            public RegisterDesc(KaitaiStream p__io, KaitaiStruct p__parent = null, Vtil p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _flags = m_io.ReadU8le();
                _combinedId = m_io.ReadU8le();
                _bitCount = m_io.ReadS4le();
                _bitOffset = m_io.ReadS4le();
            }
            private ulong _flags;
            private ulong _combinedId;
            private int _bitCount;
            private int _bitOffset;
            private Vtil m_root;
            private KaitaiStruct m_parent;
            public ulong Flags { get { return _flags; } }
            public ulong CombinedId { get { return _combinedId; } }
            public int BitCount { get { return _bitCount; } }
            public int BitOffset { get { return _bitOffset; } }
            public Vtil M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class RoutineConvention : KaitaiStruct
        {
            public static RoutineConvention FromFile(string fileName)
            {
                return new RoutineConvention(new KaitaiStream(fileName));
            }

            public RoutineConvention(KaitaiStream p__io, Vtil p__parent = null, Vtil p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _volatileRegistersCount = m_io.ReadU4le();
                _volatileRegisters = new List<RegisterDesc>((int) (VolatileRegistersCount));
                for (var i = 0; i < VolatileRegistersCount; i++)
                {
                    _volatileRegisters.Add(new RegisterDesc(m_io, this, m_root));
                }
                _paramRegistersCount = m_io.ReadU4le();
                _paramRegisters = new List<RegisterDesc>((int) (ParamRegistersCount));
                for (var i = 0; i < ParamRegistersCount; i++)
                {
                    _paramRegisters.Add(new RegisterDesc(m_io, this, m_root));
                }
                _retvalRegistersCount = m_io.ReadU4le();
                _retvalRegisters = new List<RegisterDesc>((int) (RetvalRegistersCount));
                for (var i = 0; i < RetvalRegistersCount; i++)
                {
                    _retvalRegisters.Add(new RegisterDesc(m_io, this, m_root));
                }
                _frameRegister = new RegisterDesc(m_io, this, m_root);
                _shadowSpace = m_io.ReadU8le();
                _purgeStack = m_io.ReadU1();
            }
            private uint _volatileRegistersCount;
            private List<RegisterDesc> _volatileRegisters;
            private uint _paramRegistersCount;
            private List<RegisterDesc> _paramRegisters;
            private uint _retvalRegistersCount;
            private List<RegisterDesc> _retvalRegisters;
            private RegisterDesc _frameRegister;
            private ulong _shadowSpace;
            private byte _purgeStack;
            private Vtil m_root;
            private Vtil m_parent;
            public uint VolatileRegistersCount { get { return _volatileRegistersCount; } }
            public List<RegisterDesc> VolatileRegisters { get { return _volatileRegisters; } }
            public uint ParamRegistersCount { get { return _paramRegistersCount; } }
            public List<RegisterDesc> ParamRegisters { get { return _paramRegisters; } }
            public uint RetvalRegistersCount { get { return _retvalRegistersCount; } }
            public List<RegisterDesc> RetvalRegisters { get { return _retvalRegisters; } }
            public RegisterDesc FrameRegister { get { return _frameRegister; } }
            public ulong ShadowSpace { get { return _shadowSpace; } }
            public byte PurgeStack { get { return _purgeStack; } }
            public Vtil M_Root { get { return m_root; } }
            public Vtil M_Parent { get { return m_parent; } }
        }
        public partial class Instruction : KaitaiStruct
        {
            public static Instruction FromFile(string fileName)
            {
                return new Instruction(new KaitaiStream(fileName));
            }

            public Instruction(KaitaiStream p__io, Vtil.BasicBlock p__parent = null, Vtil p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _nameLen = m_io.ReadU4le();
                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(NameLen));
                _operandsAmount = m_io.ReadU4le();
                _operands = new List<Operand>((int) (OperandsAmount));
                for (var i = 0; i < OperandsAmount; i++)
                {
                    _operands.Add(new Operand(m_io, this, m_root));
                }
                _vip = m_io.ReadU8le();
                _spOffset = m_io.ReadS8le();
                _spIndex = m_io.ReadU4le();
                _spReset = m_io.ReadU1();
            }
            private uint _nameLen;
            private string _name;
            private uint _operandsAmount;
            private List<Operand> _operands;
            private ulong _vip;
            private long _spOffset;
            private uint _spIndex;
            private byte _spReset;
            private Vtil m_root;
            private Vtil.BasicBlock m_parent;
            public uint NameLen { get { return _nameLen; } }
            public string Name { get { return _name; } }
            public uint OperandsAmount { get { return _operandsAmount; } }
            public List<Operand> Operands { get { return _operands; } }
            public ulong Vip { get { return _vip; } }
            public long SpOffset { get { return _spOffset; } }
            public uint SpIndex { get { return _spIndex; } }
            public byte SpReset { get { return _spReset; } }
            public Vtil M_Root { get { return m_root; } }
            public Vtil.BasicBlock M_Parent { get { return m_parent; } }
        }
        public partial class ImmediateDesc : KaitaiStruct
        {
            public static ImmediateDesc FromFile(string fileName)
            {
                return new ImmediateDesc(new KaitaiStream(fileName));
            }

            public ImmediateDesc(KaitaiStream p__io, Vtil.Operand p__parent = null, Vtil p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _imm = m_io.ReadU8le();
                _bitcount = m_io.ReadU4le();
            }
            private ulong _imm;
            private uint _bitcount;
            private Vtil m_root;
            private Vtil.Operand m_parent;
            public ulong Imm { get { return _imm; } }
            public uint Bitcount { get { return _bitcount; } }
            public Vtil M_Root { get { return m_root; } }
            public Vtil.Operand M_Parent { get { return m_parent; } }
        }
        public partial class ExploredBlocks : KaitaiStruct
        {
            public static ExploredBlocks FromFile(string fileName)
            {
                return new ExploredBlocks(new KaitaiStream(fileName));
            }

            public ExploredBlocks(KaitaiStream p__io, Vtil p__parent = null, Vtil p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _basicBlocksAmount = m_io.ReadU4le();
                _basicBlocks = new List<BasicBlock>((int) (BasicBlocksAmount));
                for (var i = 0; i < BasicBlocksAmount; i++)
                {
                    _basicBlocks.Add(new BasicBlock(m_io, this, m_root));
                }
            }
            private uint _basicBlocksAmount;
            private List<BasicBlock> _basicBlocks;
            private Vtil m_root;
            private Vtil m_parent;
            public uint BasicBlocksAmount { get { return _basicBlocksAmount; } }
            public List<BasicBlock> BasicBlocks { get { return _basicBlocks; } }
            public Vtil M_Root { get { return m_root; } }
            public Vtil M_Parent { get { return m_parent; } }
        }
        public partial class SpecSubroutineConventions : KaitaiStruct
        {
            public static SpecSubroutineConventions FromFile(string fileName)
            {
                return new SpecSubroutineConventions(new KaitaiStream(fileName));
            }

            public SpecSubroutineConventions(KaitaiStream p__io, Vtil p__parent = null, Vtil p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _specSubroutineConventionsAmount = m_io.ReadU4le();
                _specSubroutineConvention = new List<SubroutineConvention>((int) (SpecSubroutineConventionsAmount));
                for (var i = 0; i < SpecSubroutineConventionsAmount; i++)
                {
                    _specSubroutineConvention.Add(new SubroutineConvention(m_io, this, m_root));
                }
            }
            private uint _specSubroutineConventionsAmount;
            private List<SubroutineConvention> _specSubroutineConvention;
            private Vtil m_root;
            private Vtil m_parent;
            public uint SpecSubroutineConventionsAmount { get { return _specSubroutineConventionsAmount; } }
            public List<SubroutineConvention> SpecSubroutineConvention { get { return _specSubroutineConvention; } }
            public Vtil M_Root { get { return m_root; } }
            public Vtil M_Parent { get { return m_parent; } }
        }
        public partial class SpecSubroutineConvention : KaitaiStruct
        {
            public static SpecSubroutineConvention FromFile(string fileName)
            {
                return new SpecSubroutineConvention(new KaitaiStream(fileName));
            }

            public SpecSubroutineConvention(KaitaiStream p__io, KaitaiStruct p__parent = null, Vtil p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _vip = m_io.ReadU8le();
                _volatileRegistersCount = m_io.ReadU4le();
                _volatileRegisters = new List<RegisterDesc>((int) (VolatileRegistersCount));
                for (var i = 0; i < VolatileRegistersCount; i++)
                {
                    _volatileRegisters.Add(new RegisterDesc(m_io, this, m_root));
                }
                _paramRegistersCount = m_io.ReadU4le();
                _paramRegisters = new List<RegisterDesc>((int) (ParamRegistersCount));
                for (var i = 0; i < ParamRegistersCount; i++)
                {
                    _paramRegisters.Add(new RegisterDesc(m_io, this, m_root));
                }
                _retvalRegistersCount = m_io.ReadU4le();
                _retvalRegisters = new List<RegisterDesc>((int) (RetvalRegistersCount));
                for (var i = 0; i < RetvalRegistersCount; i++)
                {
                    _retvalRegisters.Add(new RegisterDesc(m_io, this, m_root));
                }
                _frameRegister = new RegisterDesc(m_io, this, m_root);
                _shadowSpace = m_io.ReadU8le();
                _purgeStack = m_io.ReadU1();
            }
            private ulong _vip;
            private uint _volatileRegistersCount;
            private List<RegisterDesc> _volatileRegisters;
            private uint _paramRegistersCount;
            private List<RegisterDesc> _paramRegisters;
            private uint _retvalRegistersCount;
            private List<RegisterDesc> _retvalRegisters;
            private RegisterDesc _frameRegister;
            private ulong _shadowSpace;
            private byte _purgeStack;
            private Vtil m_root;
            private KaitaiStruct m_parent;
            public ulong Vip { get { return _vip; } }
            public uint VolatileRegistersCount { get { return _volatileRegistersCount; } }
            public List<RegisterDesc> VolatileRegisters { get { return _volatileRegisters; } }
            public uint ParamRegistersCount { get { return _paramRegistersCount; } }
            public List<RegisterDesc> ParamRegisters { get { return _paramRegisters; } }
            public uint RetvalRegistersCount { get { return _retvalRegistersCount; } }
            public List<RegisterDesc> RetvalRegisters { get { return _retvalRegisters; } }
            public RegisterDesc FrameRegister { get { return _frameRegister; } }
            public ulong ShadowSpace { get { return _shadowSpace; } }
            public byte PurgeStack { get { return _purgeStack; } }
            public Vtil M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Entrypoint : KaitaiStruct
        {
            public static Entrypoint FromFile(string fileName)
            {
                return new Entrypoint(new KaitaiStream(fileName));
            }

            public Entrypoint(KaitaiStream p__io, Vtil p__parent = null, Vtil p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entryVip = m_io.ReadU8le();
            }
            private ulong _entryVip;
            private Vtil m_root;
            private Vtil m_parent;
            public ulong EntryVip { get { return _entryVip; } }
            public Vtil M_Root { get { return m_root; } }
            public Vtil M_Parent { get { return m_parent; } }
        }
        public partial class BasicBlock : KaitaiStruct
        {
            public static BasicBlock FromFile(string fileName)
            {
                return new BasicBlock(new KaitaiStream(fileName));
            }

            public BasicBlock(KaitaiStream p__io, Vtil.ExploredBlocks p__parent = null, Vtil p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entryVip = m_io.ReadU8le();
                _spOffset = m_io.ReadS8le();
                _spIndex = m_io.ReadU4le();
                _lastTemporaryIndex = m_io.ReadU4le();
                _instructionAmount = m_io.ReadU4le();
                _instructions = new List<Instruction>((int) (InstructionAmount));
                for (var i = 0; i < InstructionAmount; i++)
                {
                    _instructions.Add(new Instruction(m_io, this, m_root));
                }
                _prevVipAmount = m_io.ReadU4le();
                _prevVip = new List<ulong>((int) (PrevVipAmount));
                for (var i = 0; i < PrevVipAmount; i++)
                {
                    _prevVip.Add(m_io.ReadU8le());
                }
                _nextVipAmount = m_io.ReadU4le();
                _nextVip = new List<ulong>((int) (NextVipAmount));
                for (var i = 0; i < NextVipAmount; i++)
                {
                    _nextVip.Add(m_io.ReadU8le());
                }
            }
            private ulong _entryVip;
            private long _spOffset;
            private uint _spIndex;
            private uint _lastTemporaryIndex;
            private uint _instructionAmount;
            private List<Instruction> _instructions;
            private uint _prevVipAmount;
            private List<ulong> _prevVip;
            private uint _nextVipAmount;
            private List<ulong> _nextVip;
            private Vtil m_root;
            private Vtil.ExploredBlocks m_parent;
            public ulong EntryVip { get { return _entryVip; } }
            public long SpOffset { get { return _spOffset; } }
            public uint SpIndex { get { return _spIndex; } }
            public uint LastTemporaryIndex { get { return _lastTemporaryIndex; } }
            public uint InstructionAmount { get { return _instructionAmount; } }
            public List<Instruction> Instructions { get { return _instructions; } }
            public uint PrevVipAmount { get { return _prevVipAmount; } }
            public List<ulong> PrevVip { get { return _prevVip; } }
            public uint NextVipAmount { get { return _nextVipAmount; } }
            public List<ulong> NextVip { get { return _nextVip; } }
            public Vtil M_Root { get { return m_root; } }
            public Vtil.ExploredBlocks M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Vtil p__parent = null, Vtil p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic1 = m_io.ReadU4le();
                _archId = ((Vtil.ArchitectureIdentifier) m_io.ReadU1());
                _zeroPad = m_io.ReadU1();
                _magic2 = m_io.ReadU2le();
            }
            private uint _magic1;
            private ArchitectureIdentifier _archId;
            private byte _zeroPad;
            private ushort _magic2;
            private Vtil m_root;
            private Vtil m_parent;
            public uint Magic1 { get { return _magic1; } }
            public ArchitectureIdentifier ArchId { get { return _archId; } }
            public byte ZeroPad { get { return _zeroPad; } }
            public ushort Magic2 { get { return _magic2; } }
            public Vtil M_Root { get { return m_root; } }
            public Vtil M_Parent { get { return m_parent; } }
        }
        private Header _header;
        private Entrypoint _entrypoint;
        private RoutineConvention _routineConvention;
        private SubroutineConvention _subroutineConvention;
        private SpecSubroutineConventions _specSubroutineConventions;
        private ExploredBlocks _exploredBlocks;
        private Vtil m_root;
        private KaitaiStruct m_parent;
        public Header Header { get { return _header; } }
        public Entrypoint Entrypoint { get { return _entrypoint; } }
        public RoutineConvention RoutineConvention { get { return _routineConvention; } }
        public SubroutineConvention SubroutineConvention { get { return _subroutineConvention; } }
        public SpecSubroutineConventions SpecSubroutineConventions { get { return _specSubroutineConventions; } }
        public ExploredBlocks ExploredBlocks { get { return _exploredBlocks; } }
        public Vtil M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
