library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;
entity ALU is
    Port (
    A, B     : in  STD_LOGIC_VECTOR(7 downto 0);  
    ALU_Sel  : in  STD_LOGIC_VECTOR(1 downto 0);  
    ALU_Out   : out  STD_LOGIC_VECTOR(7 downto 0); 
    Carryout : out std_logic        
    );
end ALU; 
architecture Behavioral of ALU is

signal ALU_Result : std_logic_vector (15 downto 0);

begin
   process(A,B,ALU_Sel)
 begin
  case(ALU_Sel) is
  when "01" => 
   ALU_Result <= ("00000000" & A) + ("00000000" & B); 
  when "10" => 
	ALU_Result <= std_logic_vector(unsigned(A) * unsigned(B));
  when "11" => 
   case(B) is
            when x"00"   => ALU_Result <= std_logic_vector(unsigned(("00000000" & A)) srl 0);
            when x"01"   => ALU_Result <= std_logic_vector(unsigned(("00000000" & A)) srl 1);
            when x"02"   => ALU_Result <= std_logic_vector(unsigned(("00000000" & A)) srl 2);
            when x"03"   => ALU_Result <= std_logic_vector(unsigned(("00000000" & A)) srl 3);
            when x"04"   => ALU_Result <= std_logic_vector(unsigned(("00000000" & A)) srl 4);
            when x"05"   => ALU_Result <= std_logic_vector(unsigned(("00000000" & A)) srl 5);
            when x"06"   => ALU_Result <= std_logic_vector(unsigned(("00000000" & A)) srl 6);
            when x"07"   => ALU_Result <= std_logic_vector(unsigned(("00000000" & A)) srl 7);
            when others  => ALU_Result <= std_logic_vector(unsigned(("00000000" & A)) srl 0);
  end case;
  --ALU_Result(8) <= '0';
  when others => ALU_Result <= ("00000000" & B);
  end case;
 end process;
 ALU_Out <= ALU_Result(7 downto 0); 
 Carryout <= ALU_Result(8) or ALU_Result(9) or ALU_Result(10) or ALU_Result(11) or ALU_Result(12) or ALU_Result(13) or ALU_Result(14) or ALU_Result(15); 
end Behavioral;