----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2016 05:16:57 PM
-- Design Name: 
-- Module Name: Main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main is
    Port ( 
    ev : in std_logic_vector(15 downto 0);
    abcd : in std_logic_vector(3 downto 0);
    en : in std_logic;
    output: out std_logic
    );
end Main;

architecture Behavioral of Main is
    signal y : std_logic_vector(15 downto 0) := x"0000";
begin
    y(0) <= ev(0) and (not abcd(3)) and (not abcd(2)) and (not abcd(1)) and (not abcd(0)) and (not en);
    y(1) <= ev(1) and (not abcd(3)) and (not abcd(2)) and (not abcd(1)) and  abcd(0) and (not en);
    y(2) <= ev(2) and (not abcd(3)) and (not abcd(2)) and abcd(1) and (not abcd(0)) and (not en);
    y(3) <= ev(3) and (not abcd(3)) and (not abcd(2)) and abcd(1) and  abcd(0) and (not en);
    y(4) <= ev(4) and (not abcd(3)) and abcd(2) and (not abcd(1)) and (not abcd(0)) and (not en);
    y(5) <= ev(5) and (not abcd(3)) and abcd(2) and (not abcd(1)) and abcd(0) and (not en);
    y(6) <= ev(6) and (not abcd(3)) and abcd(2) and abcd(1) and (not abcd(0)) and (not en);
    y(7) <= ev(7) and (not abcd(3)) and abcd(2) and abcd(1) and abcd(0) and (not en);
    y(8) <= ev(8) and  abcd(3) and (not abcd(2)) and (not abcd(1)) and (not abcd(0)) and (not en);
    y(9) <= ev(9) and  abcd(3) and (not abcd(2)) and (not abcd(1)) and abcd(0) and (not en);
    y(10) <= ev(10) and  abcd(3) and (not abcd(2)) and abcd(1) and (not abcd(0)) and (not en);
    y(11) <= ev(11) and  abcd(3) and (not abcd(2)) and abcd(1) and abcd(0) and (not en);
    y(12) <= ev(12) and  abcd(3) and abcd(2) and (not abcd(1)) and (not abcd(0)) and (not en);
    y(13) <= ev(13) and  abcd(3) and abcd(2) and (not abcd(1)) and abcd(0) and (not en);
    y(14) <= ev(14) and  abcd(3) and abcd(2) and abcd(1) and (not abcd(0)) and (not en);
    y(15) <= ev(15) and  abcd(3) and abcd(2) and abcd(1) and abcd(0) and (not en);
    
    output <= not (y(0) or y(1) or y(2) or y(3) or y(4) or y(5) or y(6) or y(7) or y(8)
             or y(9) or y(10) or y(11) or y(12) or y(13) or y(14) or y(15));
             
--    process(y)
--        variable var : std_logic;
--        begin
--        var := '0';
--            output <= var;
--            for i in 0 to 15 loop
--               var := var or y(i);
--           end loop;
--        output <= not var;
--    end process;
end Behavioral;
