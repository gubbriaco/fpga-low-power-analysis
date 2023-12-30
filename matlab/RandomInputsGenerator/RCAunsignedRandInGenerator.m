function main()
    input1 = [];
    input2 = [];
    
    % Calling the unsigned random inputs generator
    output_python = RCAunsignedRandInputGenerator(input1, input2);
    
    % Pausing for user input or exit command
    user_input = input('Press Enter to continue or enter ''exit'' to exit: ', 's');
    if strcmpi(user_input, 'exit')
        return;
    end
    
    % Retrieving and processing the Vivado output
    output_vivado = getRCAunsignedOutput();
    
    % Displaying the results
    fprintf('output_python: [%s]\n', join(string(output_python), ','));
    fprintf('output_vivado: [%s]\n', join(string(output_vivado), ','));
end

function output_python = RCAunsignedRandInputGenerator(input1, input2)
    % Set the number of lines you want in the file
    num_lines = 25;
    
    % Specify the file path
    file_path = fullfile('..', '..', 'vivado', 'gate_level_control', 'sim');
    filename = 'RCAunsignedRandomInputsGenerator.txt';
    rca_random_inputs_file_path = fullfile(file_path, filename);
    output_python = [];
    % Generating and writing random values to the file
    file = fopen(rca_random_inputs_file_path, 'w');
    for k = 1:num_lines
        [input1_int, input1_bin] = generate_binary_32bit();
        input1 = [input1, binary_to_uint32(input1_bin)];
        [input2_int, input2_bin] = generate_binary_32bit();
        input2 = [input2, binary_to_uint32(input2_bin)];
        output_python = [output_python, binary_to_uint32(input1_bin) + binary_to_uint32(input2_bin)];
        write_to_file(file, input1_bin, input2_bin);
    end
    fclose(file);
end

function [rand_int_32, bin_str] = generate_binary_32bit()
    rand_int_32 = randi([0, 2^32 - 1]);
    bin_str = dec2bin(rand_int_32, 32);
end

function write_to_file(file, input1_bin, input2_bin)
    fprintf(file, 'input1TB <= "%s";\n', input1_bin);
    fprintf(file, 'input2TB <= "%s";\n', input2_bin);
    fprintf(file, 'wait for T_CLK;\n');
end

function uint32_value = binary_to_uint32(binary_str)
    uint32_value = bin2dec(binary_str);
end

function output_vivado = getRCAunsignedOutput()
    % Specify the file path
    file_path = fullfile('..', '..', 'vivado', 'gate_level_control', 'sim');
    filename = 'RCAunsignedOutput.txt';
    rca_output_file_path = fullfile(file_path, filename);
    output_vivado = [];
    try
        file = fopen(rca_output_file_path, 'r');
        line_number = 1;
        tline = fgetl(file);
        while ischar(tline)
            binary_value = strtrim(tline);
            unsigned_int_value = binary_to_uint32(binary_value);
            output_vivado = [output_vivado, unsigned_int_value];
            line_number = line_number + 1;
            tline = fgetl(file);
        end
        fclose(file);
    catch
        fprintf('An error occurred while reading the file.\n');
    end
end
