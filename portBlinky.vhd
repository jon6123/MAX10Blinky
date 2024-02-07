-- portBlinky.vhd
library ieee;
use ieee.std_logic_1164.all;
library altera;
use altera.altera_syn_attributes.all;

entity portBlinky is
  port (
    -- Define ports for connecting with other modules
    ipin_S1     :  in std_logic;
    ipin_S2     :  in std_logic;
    ipin_clk50  :  in std_logic;
    opin_D1     : out std_logic;
    opin_D5     : out std_logic
  );
end portBlinky;

architecture rtl of portBlinky is
  -- Include the required component declarations for your modules
  component S1toD1
    port
    (
      i_S1            : IN STD_LOGIC;
      o_intermediate  : OUT STD_LOGIC
    );
  end component;

  component ANDFILE
    port
    (
      i_intermediate : IN STD_LOGIC;
      i_S2           : IN STD_LOGIC;
      o_D1           : OUT STD_LOGIC
    );
  end component;

  component blink
    port
    (
      i_clk         : IN STD_LOGIC;
      o_flashing  : OUT STD_LOGIC
    );
  end component;

  -- Signals for interconnecting modules
  signal signal_interconnect1 : std_logic;

begin
  -- Instantiate S1toD1
  inst_S1toD1: S1toD1
    port map (
      -- Connect ports of S1toD1 to ports or signals of the top level
      i_S1 => ipin_S1,
      o_intermediate => signal_interconnect1
    );

  -- Instantiate ANDFILE
  inst_ANDFILE: ANDFILE
    port map (
      -- Connect ports of ANDFILE to ports or signals of the top level
      i_intermediate => signal_interconnect1,
      i_S2 => ipin_S2,
      o_D1 => opin_D1
    );

  inst_blink: blink
    port map(
      i_clk => ipin_clk50,
      o_flashing => opin_D5
    );

end rtl;