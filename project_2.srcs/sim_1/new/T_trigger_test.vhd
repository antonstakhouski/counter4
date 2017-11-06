----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2016 06:12:46 PM
-- Design Name: 
-- Module Name: testbench - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity T_trigger_test is
end T_trigger_test;

architecture Behavioral of T_trigger_test is
    component T_trigger
        Port ( 
            Rt : in std_logic;
            St : in std_logic;
            Tt : in std_logic;
            Qt : out std_logic;
            nQt: out std_logic
        );
    end component;
    
    signal T_int : std_logic :='0';
    signal Q_int : std_logic := '0';
    signal R_int : std_logic := '0';
    signal S_int : std_logic := '0';
    signal nQ_int : std_logic := '0';
    
    begin 
        t_trigger1 : T_trigger port map(
            Rt => R_int,
            St => S_int,   
            Tt => T_int,
            Qt => Q_int,
            nQt => nQ_int
        );
        
       tb : Process
       variable rst : std_logic_vector(3 downto 0);
       begin
            rst := "0000";
            for i in 0 to 15 loop
                rst := std_logic_vector(to_unsigned(i, rst'length));
                R_int <= rst(3);
                S_int <= rst(2);
                T_int <= rst(0);
                wait for 10 ps;
            end loop;
            
	        assert false
                report "simulation ended"
                severity failure;  
            wait;
       end Process;
end Behavioral;
