import sys
from vtil import Vtil
from utils import to_string

def main():
    vtil = Vtil.from_file(sys.argv[1])
    entrypoint = vtil.entrypoint.entry_vip
    print(f"===> Entrypoint: {entrypoint}")

    for basic_block in vtil.explored_blocks.basic_blocks:
        vip = basic_block.entry_vip
        instructions = basic_block.instructions

        print(f"\n===> Block VIP: {vip}")

        for instruction in instructions:
            code = ""
            code += instruction.name + " "

            for operand in instruction.operands:
                operand = operand.operand

                if isinstance(operand, Vtil.RegisterDesc):
                    code += to_string(operand.flags, operand.bit_offset, operand.bit_count, operand.combined_id)
                    code += " "
                else:
                    code += hex(operand.imm) + " "
            
            print(code)

if __name__ == "__main__":
    main()