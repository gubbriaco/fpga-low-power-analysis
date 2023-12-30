import random
import os
from properties import nBitsAdder


def RCAunsignedRandInGenerator():
    # Set the number of lines you want in the file
    num_lines = 25
    file_path = os.path.abspath('../../vivado/gate_level_control/sim/')
    filename = 'RCAunsignedRandomInputsGenerator.txt'
    rca_random_inputs_file_path = os.path.join(file_path, filename)

    # Generating and writing random values to the file
    with open(rca_random_inputs_file_path, 'w') as file:
        for _ in range(num_lines):
            input1 = generate_binary_32bit()
            input2 = generate_binary_32bit()
            write_to_file(
                file=file,
                input1=input1,
                input2=input2
            )


def generate_binary_32bit():
    rand_int_32 = random.randint(0, 2**nBitsAdder - 1)
    return format(rand_int_32, '04b')


def write_to_file(
        file,
        input1,
        input2
):
    file.write(f'input1TB <= "{input1}";\n')
    file.write(f'input2TB <= "{input2}";\n')
    file.write('wait for T_CLK/2;\n')
    file.write(f'TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));\n')
    file.write(f'Error <= TrueResult - conv_integer(unsigned(outputTB));\n')


if __name__ == "__main__":
    RCAunsignedRandInGenerator()
