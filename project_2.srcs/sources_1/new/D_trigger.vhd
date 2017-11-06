----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2016 03:42:11 PM
-- Design Name: 
-- Module Name: D_trigger - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity D_trigger is
    Port ( 
        R : in std_logic;
        S : in std_logic;
        C : in std_logic;
        D : in std_logic;
        Q : out std_logic;
        nQ: out std_logic
    );
end D_trigger;

architecture Behavioral of D_trigger is

begin
    process(C, R, S)
        begin
            if C'event and C = '1' then
                Q <= D;
                nQ <= not D;
            end if;
            
            if S = '0' then
                Q <= '1';
                nQ <= '0';
            end if;
            
            if R = '0' then
                Q <= '0';
                nQ <= '1';
            end if;      
    end process;
end Behavioral;
