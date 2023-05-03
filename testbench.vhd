library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

entity testbench is
    constant nBits  :   integer := 2;       --Definição do tamanho do registrador
end entity;

architecture sim of testbench is
    
    signal clk  :   std_logic := '0';       --sinal de clock que incia em 0
    signal rst  :   std_logic := '1';       --Sinal de reset que começa em nivel alto (rst em borda de descida)
    signal d, q :   std_logic_vector (nBits - 1 downto 0);  --Vetores de entrada e saída

begin
    
    dut_registrador :   entity work.parametrized_parallel_register(rtl) generic map(nBits) port map (clk, rst, d, q);
    --Cria instância do programa para simulação
    
    clk <= not clk after 10 ns;     --Comuta clock a cada 10 ns (clock de 1/20ns Hz)

    d <=    "00",               --valores de d com o passar do tempo (sequencial)
            "01" after 111 ns, 
            "10" after 157 ns, 
            "11" after 202 ns, 
            "00" after 218 ns, 
            "01" after 305 ns;

    rst <= '0' after 300 ns,    --Valores de rst com o passar do tempo (sequencial)
           '1' after 320 ns;
end architecture sim;