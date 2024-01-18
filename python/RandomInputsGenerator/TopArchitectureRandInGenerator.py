import random
import os
from properties import nInputsTop, nSelsTop


def TopArchitectureRandInGenerator():
    # Set the number of lines you want in the file
    num_lines = 100
    file_path = os.path.abspath('../../vivado/registering/sim/')
    filename = 'TopArchitectureRandomInputsGenerator.txt'
    top_architecture_random_inputs_file_path = os.path.join(file_path, filename)

    # Generating and writing random values to the file
    with open(top_architecture_random_inputs_file_path, 'w') as file:
        for _ in range(num_lines):
            a_bin = generate_binary_32bit()
            b_bin = generate_binary_32bit()
            c_bin = generate_binary_32bit()
            d_bin = generate_binary_32bit()
            sel1_bin = generate_binary_8bit()
            sel2_bin = generate_binary_8bit()
            write_to_file(
                file=file,
                a_bin=a_bin,
                b_bin=b_bin,
                c_bin=c_bin,
                d_bin=d_bin,
                sel1_bin=sel1_bin,
                sel2_bin=sel2_bin
            )


def generate_binary_32bit():
    rand_int_32 = random.randint(0, 2 ** nInputsTop - 1)
    return format(rand_int_32, '032b')


def generate_binary_8bit():
    rand_int_8 = random.randint(0, 2 ** nSelsTop - 1)
    return format(rand_int_8, '08b')


def write_to_file(
        file,
        a_bin,
        b_bin,
        c_bin,
        d_bin,
        sel1_bin,
        sel2_bin
):
    file.write(f'aTB <= "{a_bin}";\n')
    file.write(f'bTB <= "{b_bin}";\n')
    file.write(f'cTB <= "{c_bin}";\n')
    file.write(f'dTB <= "{d_bin}";\n')
    file.write(f'sel1TB <= "{sel1_bin}";\n')
    file.write(f'sel2TB <= "{sel2_bin}";\n')
    file.write('wait for T_CLK;\n')


if __name__ == "__main__":
    TopArchitectureRandInGenerator()
