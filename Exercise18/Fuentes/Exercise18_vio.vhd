library IEEE;
use IEEE.std_logic_1164.all;

entity Exercise18_vio is
    port(
        clk_i : in std_logic
        );
end;

architecture Exercise18_vio_arq of Exercise18_vio is
    -- Parte declarativa
    component Exercise18 is
        generic(
            N:integer:=15000000
            );
        port(
            ena_i : in std_logic;
            rst_i : in std_logic;
            clk_i : in std_logic;
            co_o  : out std_logic;
            s_o : out std_logic_vector(3 downto 0)
            );
    end component;

    COMPONENT vio_0
     PORT (
      clk : IN STD_LOGIC;
      probe_in0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe_in1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
    END COMPONENT;
    
    signal N_probe: integer:= 4;
    signal ena_probe: std_logic_vector(0 downto 0):=(others=>'0');
    signal rst_probe: std_logic_vector(0 downto 0);
    signal co_probe: std_logic_vector(0 downto 0);
    signal s_probe: std_logic_vector(3 downto 0):="0000";
begin   
    -- Parte descriptiva
    
    exercise_inst:Exercise18
        generic map(
            N => 95000000
            )
        port map(
            ena_i => ena_probe(0),
            rst_i => rst_probe(0),
            clk_i => clk_i,
            co_o  => co_probe(0),
            s_o => s_probe
            );

    vio_inst_0 : vio_0
        PORT MAP (
            clk => clk_i,
            probe_in0 => co_probe,
            probe_in1 => s_probe,
            probe_out0 => ena_probe,
            probe_out1 => rst_probe
            );
end;