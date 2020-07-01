# from: https://github.com/vtil-project/VTIL-Core/blob/master/VTIL-Architecture/arch/register_desc.hpp#L40
register_virtual        = 0
register_physical       = 1 << 0
register_local          = 1 << 1
register_flags          = 1 << 2
register_stack_pointer  = 1 << 3
register_image_base     = 1 << 4
register_volatile       = 1 << 5
register_readonly       = 1 << 6
register_undefined      = 1 << 7
register_internal       = register_virtual | (1 << 8)
register_special        = register_flags | register_stack_pointer | register_image_base | register_undefined

# from: https://github.com/vtil-project/VTIL-Core/blob/master/VTIL-Architecture/arch/register_desc.hpp#L223
def is_internal(flags):
    return flags & register_internal == register_internal

# from: https://github.com/vtil-project/VTIL-Core/blob/master/VTIL-Architecture/arch/register_desc.hpp#L244
def to_string(flags, bit_offset, bit_count, local_id):
    prefix = ""
    suffix = ""

    if flags & register_volatile: prefix = "?"
    if flags & register_readonly: prefix += "&&"

    if bit_offset != 0: suffix = f"@{bit_offset}"
    if bit_count != 64: suffix += f":{bit_count}"

    if is_internal(flags):             return f"{prefix}sr{local_id}{suffix}"
    if flags & register_undefined:     return f"{prefix}UD{suffix}"
    if flags & register_flags:         return f"{prefix}$flags{suffix}"
    if flags & register_stack_pointer: return f"{prefix}$sp{suffix}"
    if flags & register_image_base:    return f"{prefix}base{suffix}"
    if flags & register_local:         return f"{prefix}t{local_id}{suffix}"

    if flags & register_physical:
        if local_id == 35:
            return f"{prefix}rax{suffix}" # the example only uses the AL physical register

    return f"{prefix}vr{local_id}{suffix}"