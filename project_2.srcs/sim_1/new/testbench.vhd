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

entity testbench is
end testbench;

architecture Behavioral of testbench is
    component Main_s
    Port ( 
        data : in std_logic_vector(3 downto 0);
        mr : in std_logic;
        pl : in std_logic;
        cpu : in std_logic;
        cpd : in std_logic;
        tcd : out std_logic;
        tcu : out std_logic;
        output: out std_logic_vector(3 downto 0)
    );
    end component;
    
    signal data_int : std_logic_vector(3 downto 0):= (others=>'0');
    signal mr_int : std_logic := '0';
    signal pl_int : std_logic := '0';
    signal cpu_int : std_logic := '0';
    signal cpd_int : std_logic := '0';
    signal tcu_int : std_logic := '0';
    signal tcd_int : std_logic := '0';
    signal output_int : std_logic_vector(3 downto 0):= (others=>'0');
    
    begin
        main1 : Main_s port map(
            data => data_int,
            mr => mr_int,   
            pl => pl_int,
            cpu => cpu_int,
            cpd => cpd_int,
            tcd => tcd_int,
            tcu => tcu_int,
            output => output_int
        );
        
        tb: Process
        variable cnt : std_logic_vector(15 downto 0);
        variable data_var : std_logic_vector(3 downto 0);
        begin
             data_var := x"0";
             cnt := x"0000";
             for i in 65535 downto 0 loop
                 cnt := std_logic_vector(to_unsigned(i, cnt'length));
                 mr_int <= cnt(15);
                 pl_int <= cnt(14);
                 cpd_int <= cnt(13) after 2 ns;
                 
                 data_int(3) <= data_var(3);
                 data_int(2) <= data_var(2);
                 data_int(1) <= data_var(1);
                 data_int(0) <= data_var(0);
                 
                 data_var := data_var + 1;
                 
                 if data_var = x"A" then 
                    data_var := x"0";
                 end if;
                          
                 cpu_int <= cnt(6);
                 wait for 10 ps;
             end loop;
             
            data_var := x"0";
            cnt := x"0000";
            for i in 65535 downto 0 loop
                 cnt := std_logic_vector(to_unsigned(i, cnt'length));
                 mr_int <= cnt(15);
                 pl_int <= cnt(14);
                 cpu_int <= cnt(13) after 2 ns;
                 
                 data_int(3) <= data_var(3);
                 data_int(2) <= data_var(2);
                 data_int(1) <= data_var(1);
                 data_int(0) <= data_var(0);
                 
                 data_var := data_var + 1;
                 
                 if data_var = x"A" then 
                    data_var := x"0";
                 end if;
                 
                 cpd_int <= cnt(6);
                 wait for 10 ps;
             end loop;
             
            assert false
                report "simulation ended"
                severity failure; 
            wait;
        end Process;
end Behavioral;
