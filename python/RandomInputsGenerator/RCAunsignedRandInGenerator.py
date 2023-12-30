import random
import os
from properties import nBitsAdder

input1 = []
input2 = []
output_python = []


def RCAunsignedRandInGenerator():
    # Set the number of lines you want in the file
    num_lines = 25
    file_path = os.path.abspath('../../vivado/gate_level_control/sim/')
    filename = 'RCAunsignedRandomInputsGenerator.txt'
    rca_random_inputs_file_path = os.path.join(file_path, filename)

    # Generating and writing random values to the file
    with open(rca_random_inputs_file_path, 'w') as file:
        for _ in range(num_lines):
            input1_int, input1_bin = generate_binary_32bit()
            input1.append(binary_to_uint32(input1_bin))
            input2_int, input2_bin = generate_binary_32bit()
            input2.append(binary_to_uint32(input2_bin))
            output_python.append(binary_to_uint32(input1_bin) + binary_to_uint32(input2_bin))
            write_to_file(
                file=file,
                input1_bin=input1_bin,
                input2_bin=input2_bin
            )


def generate_binary_32bit():
    rand_int_32 = random.randint(0, 2 ** nBitsAdder - 1)
    return rand_int_32, format(rand_int_32, '032b')


def write_to_file(
        file,
        input1_bin,
        input2_bin
):
    file.write(f'input1TB <= "{input1_bin}";\n')
    file.write(f'input2TB <= "{input2_bin}";\n')
    file.write('wait for T_CLK;\n')


def binary_to_uint32(binary_str):
    return int(binary_str, 2)


output_vivado = []


def getRCAunsignedOutput():
    file_path = os.path.abspath('../../vivado/gate_level_control/sim/')
    filename = 'RCAunsignedOutput.txt'
    rca_output_file_path = os.path.join(file_path, filename)
    try:
        with open(rca_output_file_path, 'r') as file:
            for line_number, line in enumerate(file, start=1):
                binary_value = line.strip()
                try:
                    unsigned_int_value = binary_to_uint32(binary_value)
                    output_vivado.append(unsigned_int_value)
                except ValueError as ve:
                    print(f"Error in line conversion {line_number}: {ve}")
    except FileNotFoundError:
        print(f"File not found: {file_path}")
    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":
    RCAunsignedRandInGenerator()
    input("Premi Invio per continuare o inserisci 'exit' per uscire: ")
    getRCAunsignedOutput()
    output_vivado.pop(0)
    print("{:<30} {:<30} {:<30} {:<30} {:<30}".format("input1", "input2", "output_python", "output_vivado", "error"))
    for in1, in2, out_python, out_vivado in zip(input1, input2, output_python, output_vivado):
        print("{:<30} {:<30} {:<30} {:<30} {:<30}".format(in1, in2, out_python, out_vivado, abs(out_python-out_vivado)))
