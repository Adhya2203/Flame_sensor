module adc_reader (
input clk, // 50MHz
input adc_dout, // from ADC128S022
output reg adc_cs, // to ADC CS
output reg adc_clk, // to ADC SCLK
output reg adc_din, // to ADC DIN
output reg [11:0] adc_data
);
reg [4:0] bit_cnt = 0;
reg [15:0] shift_reg = 0;
reg [7:0] clk_div = 0;
parameter CMD = 4&#39;b1100; // start + SE + CH0
initial begin
adc_cs = 1;
adc_clk = 0;
adc_din = 0;
adc_data = 0;
bit_cnt = 0;
shift_reg = 0;
clk_div = 0;
end
always @(posedge clk) begin
clk_div &lt;= clk_div + 1;
if (clk_div == 0) begin
if (bit_cnt == 0) begin
adc_cs &lt;= 0;
bit_cnt &lt;= 16;
shift_reg &lt;= {CMD, 12&#39;d0};
end else begin
adc_clk &lt;= ~adc_clk;
if (adc_clk == 0) begin
adc_din &lt;= shift_reg[15];
end else begin
shift_reg &lt;= {shift_reg[14:0], adc_dout};
bit_cnt &lt;= bit_cnt - 1;
if (bit_cnt == 1) begin
adc_cs &lt;= 1;
adc_data &lt;= shift_reg[11:0];
end
end
end
end
end
endmodule