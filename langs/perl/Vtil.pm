# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package Vtil;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $ARCHITECTURE_IDENTIFIER_AMD64 = 0;
our $ARCHITECTURE_IDENTIFIER_ARM64 = 1;
our $ARCHITECTURE_IDENTIFIER_VIRTUAL = 2;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header} = Vtil::Header->new($self->{_io}, $self, $self->{_root});
    $self->{entrypoint} = Vtil::Entrypoint->new($self->{_io}, $self, $self->{_root});
    $self->{routine_convention} = Vtil::RoutineConvention->new($self->{_io}, $self, $self->{_root});
    $self->{subroutine_convention} = Vtil::SubroutineConvention->new($self->{_io}, $self, $self->{_root});
    $self->{spec_subroutine_conventions} = Vtil::SpecSubroutineConventions->new($self->{_io}, $self, $self->{_root});
    $self->{explored_blocks} = Vtil::ExploredBlocks->new($self->{_io}, $self, $self->{_root});
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub entrypoint {
    my ($self) = @_;
    return $self->{entrypoint};
}

sub routine_convention {
    my ($self) = @_;
    return $self->{routine_convention};
}

sub subroutine_convention {
    my ($self) = @_;
    return $self->{subroutine_convention};
}

sub spec_subroutine_conventions {
    my ($self) = @_;
    return $self->{spec_subroutine_conventions};
}

sub explored_blocks {
    my ($self) = @_;
    return $self->{explored_blocks};
}

########################################################################
package Vtil::SubroutineConvention;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{volatile_registers_count} = $self->{_io}->read_u4le();
    $self->{volatile_registers} = ();
    my $n_volatile_registers = $self->volatile_registers_count();
    for (my $i = 0; $i < $n_volatile_registers; $i++) {
        $self->{volatile_registers}[$i] = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    }
    $self->{param_registers_count} = $self->{_io}->read_u4le();
    $self->{param_registers} = ();
    my $n_param_registers = $self->param_registers_count();
    for (my $i = 0; $i < $n_param_registers; $i++) {
        $self->{param_registers}[$i] = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    }
    $self->{retval_registers_count} = $self->{_io}->read_u4le();
    $self->{retval_registers} = ();
    my $n_retval_registers = $self->retval_registers_count();
    for (my $i = 0; $i < $n_retval_registers; $i++) {
        $self->{retval_registers}[$i] = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    }
    $self->{frame_register} = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    $self->{shadow_space} = $self->{_io}->read_u8le();
    $self->{purge_stack} = $self->{_io}->read_u1();
}

sub volatile_registers_count {
    my ($self) = @_;
    return $self->{volatile_registers_count};
}

sub volatile_registers {
    my ($self) = @_;
    return $self->{volatile_registers};
}

sub param_registers_count {
    my ($self) = @_;
    return $self->{param_registers_count};
}

sub param_registers {
    my ($self) = @_;
    return $self->{param_registers};
}

sub retval_registers_count {
    my ($self) = @_;
    return $self->{retval_registers_count};
}

sub retval_registers {
    my ($self) = @_;
    return $self->{retval_registers};
}

sub frame_register {
    my ($self) = @_;
    return $self->{frame_register};
}

sub shadow_space {
    my ($self) = @_;
    return $self->{shadow_space};
}

sub purge_stack {
    my ($self) = @_;
    return $self->{purge_stack};
}

########################################################################
package Vtil::Operand;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{sp_index} = $self->{_io}->read_u4le();
    my $_on = $self->sp_index();
    if ($_on == 0) {
        $self->{operand} = Vtil::ImmediateDesc->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 1) {
        $self->{operand} = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    }
}

sub sp_index {
    my ($self) = @_;
    return $self->{sp_index};
}

sub operand {
    my ($self) = @_;
    return $self->{operand};
}

########################################################################
package Vtil::RegisterDesc;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flags} = $self->{_io}->read_u8le();
    $self->{combined_id} = $self->{_io}->read_u8le();
    $self->{bit_count} = $self->{_io}->read_s4le();
    $self->{bit_offset} = $self->{_io}->read_s4le();
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub combined_id {
    my ($self) = @_;
    return $self->{combined_id};
}

sub bit_count {
    my ($self) = @_;
    return $self->{bit_count};
}

sub bit_offset {
    my ($self) = @_;
    return $self->{bit_offset};
}

########################################################################
package Vtil::RoutineConvention;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{volatile_registers_count} = $self->{_io}->read_u4le();
    $self->{volatile_registers} = ();
    my $n_volatile_registers = $self->volatile_registers_count();
    for (my $i = 0; $i < $n_volatile_registers; $i++) {
        $self->{volatile_registers}[$i] = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    }
    $self->{param_registers_count} = $self->{_io}->read_u4le();
    $self->{param_registers} = ();
    my $n_param_registers = $self->param_registers_count();
    for (my $i = 0; $i < $n_param_registers; $i++) {
        $self->{param_registers}[$i] = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    }
    $self->{retval_registers_count} = $self->{_io}->read_u4le();
    $self->{retval_registers} = ();
    my $n_retval_registers = $self->retval_registers_count();
    for (my $i = 0; $i < $n_retval_registers; $i++) {
        $self->{retval_registers}[$i] = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    }
    $self->{frame_register} = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    $self->{shadow_space} = $self->{_io}->read_u8le();
    $self->{purge_stack} = $self->{_io}->read_u1();
}

sub volatile_registers_count {
    my ($self) = @_;
    return $self->{volatile_registers_count};
}

sub volatile_registers {
    my ($self) = @_;
    return $self->{volatile_registers};
}

sub param_registers_count {
    my ($self) = @_;
    return $self->{param_registers_count};
}

sub param_registers {
    my ($self) = @_;
    return $self->{param_registers};
}

sub retval_registers_count {
    my ($self) = @_;
    return $self->{retval_registers_count};
}

sub retval_registers {
    my ($self) = @_;
    return $self->{retval_registers};
}

sub frame_register {
    my ($self) = @_;
    return $self->{frame_register};
}

sub shadow_space {
    my ($self) = @_;
    return $self->{shadow_space};
}

sub purge_stack {
    my ($self) = @_;
    return $self->{purge_stack};
}

########################################################################
package Vtil::Instruction;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{name_len} = $self->{_io}->read_u4le();
    $self->{name} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->name_len()));
    $self->{operands_amount} = $self->{_io}->read_u4le();
    $self->{operands} = ();
    my $n_operands = $self->operands_amount();
    for (my $i = 0; $i < $n_operands; $i++) {
        $self->{operands}[$i] = Vtil::Operand->new($self->{_io}, $self, $self->{_root});
    }
    $self->{vip} = $self->{_io}->read_u8le();
    $self->{sp_offset} = $self->{_io}->read_s8le();
    $self->{sp_index} = $self->{_io}->read_u4le();
    $self->{sp_reset} = $self->{_io}->read_u1();
}

sub name_len {
    my ($self) = @_;
    return $self->{name_len};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub operands_amount {
    my ($self) = @_;
    return $self->{operands_amount};
}

sub operands {
    my ($self) = @_;
    return $self->{operands};
}

sub vip {
    my ($self) = @_;
    return $self->{vip};
}

sub sp_offset {
    my ($self) = @_;
    return $self->{sp_offset};
}

sub sp_index {
    my ($self) = @_;
    return $self->{sp_index};
}

sub sp_reset {
    my ($self) = @_;
    return $self->{sp_reset};
}

########################################################################
package Vtil::ImmediateDesc;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{imm} = $self->{_io}->read_u8le();
    $self->{bitcount} = $self->{_io}->read_u4le();
}

sub imm {
    my ($self) = @_;
    return $self->{imm};
}

sub bitcount {
    my ($self) = @_;
    return $self->{bitcount};
}

########################################################################
package Vtil::ExploredBlocks;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{basic_blocks_amount} = $self->{_io}->read_u4le();
    $self->{basic_blocks} = ();
    my $n_basic_blocks = $self->basic_blocks_amount();
    for (my $i = 0; $i < $n_basic_blocks; $i++) {
        $self->{basic_blocks}[$i] = Vtil::BasicBlock->new($self->{_io}, $self, $self->{_root});
    }
}

sub basic_blocks_amount {
    my ($self) = @_;
    return $self->{basic_blocks_amount};
}

sub basic_blocks {
    my ($self) = @_;
    return $self->{basic_blocks};
}

########################################################################
package Vtil::SpecSubroutineConventions;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{spec_subroutine_conventions_amount} = $self->{_io}->read_u4le();
    $self->{spec_subroutine_convention} = ();
    my $n_spec_subroutine_convention = $self->spec_subroutine_conventions_amount();
    for (my $i = 0; $i < $n_spec_subroutine_convention; $i++) {
        $self->{spec_subroutine_convention}[$i] = Vtil::SubroutineConvention->new($self->{_io}, $self, $self->{_root});
    }
}

sub spec_subroutine_conventions_amount {
    my ($self) = @_;
    return $self->{spec_subroutine_conventions_amount};
}

sub spec_subroutine_convention {
    my ($self) = @_;
    return $self->{spec_subroutine_convention};
}

########################################################################
package Vtil::SpecSubroutineConvention;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{vip} = $self->{_io}->read_u8le();
    $self->{volatile_registers_count} = $self->{_io}->read_u4le();
    $self->{volatile_registers} = ();
    my $n_volatile_registers = $self->volatile_registers_count();
    for (my $i = 0; $i < $n_volatile_registers; $i++) {
        $self->{volatile_registers}[$i] = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    }
    $self->{param_registers_count} = $self->{_io}->read_u4le();
    $self->{param_registers} = ();
    my $n_param_registers = $self->param_registers_count();
    for (my $i = 0; $i < $n_param_registers; $i++) {
        $self->{param_registers}[$i] = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    }
    $self->{retval_registers_count} = $self->{_io}->read_u4le();
    $self->{retval_registers} = ();
    my $n_retval_registers = $self->retval_registers_count();
    for (my $i = 0; $i < $n_retval_registers; $i++) {
        $self->{retval_registers}[$i] = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    }
    $self->{frame_register} = Vtil::RegisterDesc->new($self->{_io}, $self, $self->{_root});
    $self->{shadow_space} = $self->{_io}->read_u8le();
    $self->{purge_stack} = $self->{_io}->read_u1();
}

sub vip {
    my ($self) = @_;
    return $self->{vip};
}

sub volatile_registers_count {
    my ($self) = @_;
    return $self->{volatile_registers_count};
}

sub volatile_registers {
    my ($self) = @_;
    return $self->{volatile_registers};
}

sub param_registers_count {
    my ($self) = @_;
    return $self->{param_registers_count};
}

sub param_registers {
    my ($self) = @_;
    return $self->{param_registers};
}

sub retval_registers_count {
    my ($self) = @_;
    return $self->{retval_registers_count};
}

sub retval_registers {
    my ($self) = @_;
    return $self->{retval_registers};
}

sub frame_register {
    my ($self) = @_;
    return $self->{frame_register};
}

sub shadow_space {
    my ($self) = @_;
    return $self->{shadow_space};
}

sub purge_stack {
    my ($self) = @_;
    return $self->{purge_stack};
}

########################################################################
package Vtil::Entrypoint;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entry_vip} = $self->{_io}->read_u8le();
}

sub entry_vip {
    my ($self) = @_;
    return $self->{entry_vip};
}

########################################################################
package Vtil::BasicBlock;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entry_vip} = $self->{_io}->read_u8le();
    $self->{sp_offset} = $self->{_io}->read_s8le();
    $self->{sp_index} = $self->{_io}->read_u4le();
    $self->{last_temporary_index} = $self->{_io}->read_u4le();
    $self->{instruction_amount} = $self->{_io}->read_u4le();
    $self->{instructions} = ();
    my $n_instructions = $self->instruction_amount();
    for (my $i = 0; $i < $n_instructions; $i++) {
        $self->{instructions}[$i] = Vtil::Instruction->new($self->{_io}, $self, $self->{_root});
    }
    $self->{prev_vip_amount} = $self->{_io}->read_u4le();
    $self->{prev_vip} = ();
    my $n_prev_vip = $self->prev_vip_amount();
    for (my $i = 0; $i < $n_prev_vip; $i++) {
        $self->{prev_vip}[$i] = $self->{_io}->read_u8le();
    }
    $self->{next_vip_amount} = $self->{_io}->read_u4le();
    $self->{next_vip} = ();
    my $n_next_vip = $self->next_vip_amount();
    for (my $i = 0; $i < $n_next_vip; $i++) {
        $self->{next_vip}[$i] = $self->{_io}->read_u8le();
    }
}

sub entry_vip {
    my ($self) = @_;
    return $self->{entry_vip};
}

sub sp_offset {
    my ($self) = @_;
    return $self->{sp_offset};
}

sub sp_index {
    my ($self) = @_;
    return $self->{sp_index};
}

sub last_temporary_index {
    my ($self) = @_;
    return $self->{last_temporary_index};
}

sub instruction_amount {
    my ($self) = @_;
    return $self->{instruction_amount};
}

sub instructions {
    my ($self) = @_;
    return $self->{instructions};
}

sub prev_vip_amount {
    my ($self) = @_;
    return $self->{prev_vip_amount};
}

sub prev_vip {
    my ($self) = @_;
    return $self->{prev_vip};
}

sub next_vip_amount {
    my ($self) = @_;
    return $self->{next_vip_amount};
}

sub next_vip {
    my ($self) = @_;
    return $self->{next_vip};
}

########################################################################
package Vtil::Header;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic1} = $self->{_io}->read_u4le();
    $self->{arch_id} = $self->{_io}->read_u1();
    $self->{zero_pad} = $self->{_io}->read_u1();
    $self->{magic2} = $self->{_io}->read_u2le();
}

sub magic1 {
    my ($self) = @_;
    return $self->{magic1};
}

sub arch_id {
    my ($self) = @_;
    return $self->{arch_id};
}

sub zero_pad {
    my ($self) = @_;
    return $self->{zero_pad};
}

sub magic2 {
    my ($self) = @_;
    return $self->{magic2};
}

1;
