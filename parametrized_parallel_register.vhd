library ieee;
use ieee.std_logic_1164.all;


entity parametrized_parallel_register is
    generic (
        nBits   :   integer :=  4       --Generico para definir o tamanho do registrador
    );

    port (
        clk :	in		std_logic;      --Sinal do clock
        rst :	in		std_logic;      --Reset de borda de descida
        d   :	in		std_logic_vector (nBits-1 downto 0);        --Vetor de entrada de tamanho nBits
        q   :	out	    std_logic_vector (nBits-1 downto 0)         --Vetor de saida de tamanho nBits
    );

end entity;

architecture rtl of parametrized_parallel_register is
    
begin
    
    process(clk, rst)               --Process que ocorre com mudança de clock ou reset (assincrono)
    begin
        if rst = '0' then           --Se rst comutou para nivel baixo 
            q <= (others => '0');   --Reinicia saida
        elsif rising_edge(clk) then --Quando clock passa por borda de subida
            q <= d;                 --Saída recebe entrada
        end if;

    end process;

end architecture rtl;
