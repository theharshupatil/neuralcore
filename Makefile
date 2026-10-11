.PHONY: test clean
test:
	mkdir -p build
	iverilog -g2012 -o build/mac_tb.vvp rtl/mac_pe.sv tb/mac_pe_tb.sv
	vvp build/mac_tb.vvp
clean:
	rm -rf build
