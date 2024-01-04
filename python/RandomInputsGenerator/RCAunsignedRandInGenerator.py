import random
import os
from properties import nBitsAdder


def RCAunsignedRandInGenerator():
    # Set the number of lines you want in the file
    num_lines = 25
    file_path = os.path.abspath('../../vivado/gate_level_control/non_ordered/sim/')
    filename = 'RCAunsignedRandomInputsGenerator.txt'
    rca_random_inputs_file_path = os.path.join(file_path, filename)

    # Generating and writing random values to the file
    with open(rca_random_inputs_file_path, 'w') as file:
        for _ in range(num_lines):
            input1_bin = generate_binary_32bit()
            input2_bin = generate_binary_32bit()
            write_to_file(
                file=file,
                input1_bin=input1_bin,
                input2_bin=input2_bin
            )


def generate_binary_32bit():
    rand_int_32 = random.randint(0, 2 ** nBitsAdder - 1)
    return format(rand_int_32, '032b')


def write_to_file(
        file,
        input1_bin,
        input2_bin
):
    file.write(f'input1TB <= "{input1_bin}";\n')
    file.write(f'input2TB <= "{input2_bin}";\n')
    file.write('wait for T_CLK;\n')


if __name__ == "__main__":
    RCAunsignedRandInGenerator()
