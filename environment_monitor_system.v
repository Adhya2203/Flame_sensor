module environment_monitor_system (
input clk,
input flame_d0,
input mq135_d0,
input adc_dout,
output adc_cs,
output adc_clk,
output adc_din,
output [7:0] leds,
output buzzer
);
wire [11:0] lm35_adc;
adc_reader u_adc_reader (
.clk(clk),
.adc_dout(adc_dout),
.adc_cs(adc_cs),
.adc_clk(adc_clk),
.adc_din(adc_din),
.adc_data(lm35_adc)
);
environment_monitor u_monitor (
.clk(clk),
.flame_d0(flame_d0),
.mq135_d0(mq135_d0),
.lm35_adc(lm35_adc),
.leds(leds),
.buzzer(buzzer)
);
endmodule