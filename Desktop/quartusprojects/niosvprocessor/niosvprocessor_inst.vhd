	component niosvprocessor is
		port (
			clk_clk : in std_logic := 'X'  -- clk
		);
	end component niosvprocessor;

	u0 : component niosvprocessor
		port map (
			clk_clk => CONNECTED_TO_clk_clk  -- clk.clk
		);

