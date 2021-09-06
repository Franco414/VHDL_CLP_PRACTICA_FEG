library IEEE;
use IEEE.std_logic_1164.all;

entity BarrelShifterWP is
    generic (
        M: natural := 2;
        N: natural := 7
    );
    port(
        a_i : in std_logic_vector(N downto 0);
        des_i : in std_logic_vector(M downto 0);
        s_o : out std_logic_vector(N downto 0)
    );
end;

architecture BarrelShifterWP_arq of BarrelShifterWP is
    -- Parte declarativa

    signal auxS : std_logic_vector(N downto 0);

    function word_to_int(word: std_logic_vector) return integer is 
          variable result : integer := 0; 
    begin 
        for index in word'range loop 
            result := result * 2; 
            if (word(index) = '1') then 
                  result := result + 1; 
            end if; 
        end loop; 
          return result; 
    end word_to_int; 
begin   
    -- Parte descriptiva
    
    process(a_i)
        variable indexA : integer := 0;
    begin
        indexA := word_to_int(des_i);
        A1: for indexS in 0 to N loop
            cond1: if indexA > N then
                indexA := 0;
            end if;
            auxS(indexS) <= a_i(indexA);
            indexA := indexA+1;
        end loop;    
    end process;
        s_o <= auxS;
end;